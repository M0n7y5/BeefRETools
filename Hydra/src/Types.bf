using System;
namespace Hydra
{
	[CRepr]
	public struct PROCESSENTRY32
	{
		public uint32 dwSize;
		public uint32 cntUsage;
		public uint32 th32ProcessID;
		public void* th32DefaultHeapID;
		public uint32 th32ModuleID;
		public uint32 cntThreads;
		public uint32 th32ParentProcessID;
		public uint64 pcPriClassBase;
		public uint32 dwFlags;
		public char8[260] szExeFile;
	}



	[CRepr]
	public struct LUID
	{
		public uint32 LowPart;
		public int32 HighPart;
	}

	[CRepr]
	public struct LUID_AND_ATTRIBUTES
	{
		public LUID Luid;
		public uint32 Attributes;
	}


	[CRepr]
	public struct TOKEN_PRIVILEGES
	{
		public uint32 PrivilegeCount;
		public LUID_AND_ATTRIBUTES[1] Privileges;
	}

	public enum SecurityEntity : uint32
	{
		SE_CREATE_TOKEN_NAME,
		SE_ASSIGNPRIMARYTOKEN_NAME,
		SE_LOCK_MEMORY_NAME,
		SE_INCREASE_QUOTA_NAME,
		SE_UNSOLICITED_INPUT_NAME,
		SE_MACHINE_ACCOUNT_NAME,
		SE_TCB_NAME,
		SE_SECURITY_NAME,
		SE_TAKE_OWNERSHIP_NAME,
		SE_LOAD_DRIVER_NAME,
		SE_SYSTEM_PROFILE_NAME,
		SE_SYSTEMTIME_NAME,
		SE_PROF_SINGLE_PROCESS_NAME,
		SE_INC_BASE_PRIORITY_NAME,
		SE_CREATE_PAGEFILE_NAME,
		SE_CREATE_PERMANENT_NAME,
		SE_BACKUP_NAME,
		SE_RESTORE_NAME,
		SE_SHUTDOWN_NAME,
		SE_DEBUG_NAME,
		SE_AUDIT_NAME,
		SE_SYSTEM_ENVIRONMENT_NAME,
		SE_CHANGE_NOTIFY_NAME,
		SE_REMOTE_SHUTDOWN_NAME,
		SE_UNDOCK_NAME,
		SE_SYNC_AGENT_NAME,
		SE_ENABLE_DELEGATION_NAME,
		SE_MANAGE_VOLUME_NAME,
		SE_IMPERSONATE_NAME,
		SE_CREATE_GLOBAL_NAME,
		SE_CREATE_SYMBOLIC_LINK_NAME,
		SE_INC_WORKING_SET_NAME,
		SE_RELABEL_NAME,
		SE_TIME_ZONE_NAME,
		SE_TRUSTED_CREDMAN_ACCESS_NAME
	}

	public enum SnapshotFlags : uint32
	{
		HeapList = 0x00000001,
		Process = 0x00000002,
		Thread = 0x00000004,
		Module = 0x00000008,
		Module32 = 0x00000010,
		Inherit = 0x80000000,
		All = 0x0000001F,
		NoHeaps = 0x40000000
	}
}