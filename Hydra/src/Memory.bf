using System;
using System.Collections;
namespace Hydra
{
	public class Memory : NativeApiWin
	{
		this() { }

		public Result<uint32> GetProcessId(String processName)
		{
			SetLastError(0);
			PROCESSENTRY32 pe32 = default;
			Handle hSnapshot;
			GetLastError();
			pe32.dwSize = sizeof(PROCESSENTRY32);

			hSnapshot = CreateToolhelp32Snapshot(.Process, 0);

			if (Process32First(hSnapshot, &pe32))
			{
				do repeat
					{
						if (processName.Equals(scope String(&pe32.szExeFile, 260)))
							break;
					}
					while (Process32Next(hSnapshot, &pe32));
			}

			if (!hSnapshot.IsInvalid)
				CloseHandle(hSnapshot);

			if (GetLastError() != 0)
				return .Err;

			return .Ok(pe32.th32ProcessID);
		}


		public Result<uint32> GetModuleBase(Handle processHandle, ref String moduleName)
		{
			HModule[] hModules = null;
			String szBuf = scope String(50);
			uint32 cModules = default;
			uint32 dwBase = (.)-1;

			NativeApiWin.EnumProcessModules(processHandle, hModules.CArray(), 0, &cModules);
			hModules = scope HModule[cModules / sizeof(HModule)];

			if (EnumProcessModules(processHandle, hModules.CArray(), cModules / sizeof(HModule), &cModules))
			{
				for (var module in hModules)
				{
					if (GetModuleBaseNameA(processHandle, &module, szBuf.Ptr, (.)szBuf.AllocSize))
					{
						if (szBuf.CompareTo(moduleName) == 0)
						{
							dwBase = (.)module;
							break;
						}
					}
				}
			}
			// That's invalid right?
			if (dwBase == (.)-1)
				return .Err;

			return .Ok(dwBase);
		}

		public Result<void> SetPrivilege(Handle hToken, char8* lpszPrivilege, IntBool bEnablePrivilege)
		{
			TOKEN_PRIVILEGES tp = default;
			LUID luid = default;

			if (!LookupPrivilegeValueA(null, lpszPrivilege, &luid))
				return .Err;

			tp.PrivilegeCount = 1;
			tp.Privileges[0].Luid = luid;
			tp.Privileges[0].Attributes = bEnablePrivilege ? SE_PRIVILEGE_ENABLED : 0;

			if (!AdjustTokenPrivileges(hToken, false, &tp, sizeof(TOKEN_PRIVILEGES), null, null))
				return .Err;

			if (GetLastError() == ERROR_NOT_ALL_ASSIGNED)
				return .Err;

			return .Ok;
		}


		public Result<void> GetDebugPrivileges()
		{
			Handle hToken = default;

			if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, &hToken))
				return .Err;

			return SetPrivilege(hToken, GetSecurityEntityValue(.SE_DEBUG_NAME), true);
		}

		public Result<T> Read<T>(Handle processHandle, int32 address) where T : struct
		{
			var address;
			if (address == -1)
				return .Err;

			T buffer = default;

			uint NumberOfBytesToRead = (.)sizeof(T);
			uint NumberOfBytesActuallyRead = default;

			let success = ReadProcessMemory(processHandle, (.)&address, &buffer, NumberOfBytesToRead, &NumberOfBytesActuallyRead);
			if (!success || NumberOfBytesActuallyRead != NumberOfBytesToRead)
			{
				// Memory error
				return .Err;
			}

			return .Ok(buffer);
		}

		public Result<T> Read<T>(Handle processHandle, int32 address, List<int32> offsets) where T : struct
		{
			var address;
			if (address == -1)
				return .Err;

			let lastOffset = offsets.PopBack();

			for (let offset in offsets)
			{
				address = Read<int32>(processHandle, address + offset);
			}

			return .Ok(Read<T>(processHandle, address + lastOffset));
		}


		private static String GetSecurityEntityValue(SecurityEntity securityEntity)
		{
			switch (securityEntity)
			{
			case SecurityEntity.SE_ASSIGNPRIMARYTOKEN_NAME:
				return "SeAssignPrimaryTokenPrivilege";
			case SecurityEntity.SE_AUDIT_NAME:
				return "SeAuditPrivilege";
			case SecurityEntity.SE_BACKUP_NAME:
				return "SeBackupPrivilege";
			case SecurityEntity.SE_CHANGE_NOTIFY_NAME:
				return "SeChangeNotifyPrivilege";
			case SecurityEntity.SE_CREATE_GLOBAL_NAME:
				return "SeCreateGlobalPrivilege";
			case SecurityEntity.SE_CREATE_PAGEFILE_NAME:
				return "SeCreatePagefilePrivilege";
			case SecurityEntity.SE_CREATE_PERMANENT_NAME:
				return "SeCreatePermanentPrivilege";
			case SecurityEntity.SE_CREATE_SYMBOLIC_LINK_NAME:
				return "SeCreateSymbolicLinkPrivilege";
			case SecurityEntity.SE_CREATE_TOKEN_NAME:
				return "SeCreateTokenPrivilege";
			case SecurityEntity.SE_DEBUG_NAME:
				return "SeDebugPrivilege";
			case SecurityEntity.SE_ENABLE_DELEGATION_NAME:
				return "SeEnableDelegationPrivilege";
			case SecurityEntity.SE_IMPERSONATE_NAME:
				return "SeImpersonatePrivilege";
			case SecurityEntity.SE_INC_BASE_PRIORITY_NAME:
				return "SeIncreaseBasePriorityPrivilege";
			case SecurityEntity.SE_INCREASE_QUOTA_NAME:
				return "SeIncreaseQuotaPrivilege";
			case SecurityEntity.SE_INC_WORKING_SET_NAME:
				return "SeIncreaseWorkingSetPrivilege";
			case SecurityEntity.SE_LOAD_DRIVER_NAME:
				return "SeLoadDriverPrivilege";
			case SecurityEntity.SE_LOCK_MEMORY_NAME:
				return "SeLockMemoryPrivilege";
			case SecurityEntity.SE_MACHINE_ACCOUNT_NAME:
				return "SeMachineAccountPrivilege";
			case SecurityEntity.SE_MANAGE_VOLUME_NAME:
				return "SeManageVolumePrivilege";
			case SecurityEntity.SE_PROF_SINGLE_PROCESS_NAME:
				return "SeProfileSingleProcessPrivilege";
			case SecurityEntity.SE_RELABEL_NAME:
				return "SeRelabelPrivilege";
			case SecurityEntity.SE_REMOTE_SHUTDOWN_NAME:
				return "SeRemoteShutdownPrivilege";
			case SecurityEntity.SE_RESTORE_NAME:
				return "SeRestorePrivilege";
			case SecurityEntity.SE_SECURITY_NAME:
				return "SeSecurityPrivilege";
			case SecurityEntity.SE_SHUTDOWN_NAME:
				return "SeShutdownPrivilege";
			case SecurityEntity.SE_SYNC_AGENT_NAME:
				return "SeSyncAgentPrivilege";
			case SecurityEntity.SE_SYSTEM_ENVIRONMENT_NAME:
				return "SeSystemEnvironmentPrivilege";
			case SecurityEntity.SE_SYSTEM_PROFILE_NAME:
				return "SeSystemProfilePrivilege";
			case SecurityEntity.SE_SYSTEMTIME_NAME:
				return "SeSystemtimePrivilege";
			case SecurityEntity.SE_TAKE_OWNERSHIP_NAME:
				return "SeTakeOwnershipPrivilege";
			case SecurityEntity.SE_TCB_NAME:
				return "SeTcbPrivilege";
			case SecurityEntity.SE_TIME_ZONE_NAME:
				return "SeTimeZonePrivilege";
			case SecurityEntity.SE_TRUSTED_CREDMAN_ACCESS_NAME:
				return "SeTrustedCredManAccessPrivilege";
			case SecurityEntity.SE_UNDOCK_NAME:
				return "SeUndockPrivilege";
			default:
				return .Empty;
			}
		}

	}
}