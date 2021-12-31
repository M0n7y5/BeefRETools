using System;
namespace Hydra
{
	public class NativeApiWin : Windows
	{
		[Import("kernel32.lib"), CLink]
		public static extern Handle CreateToolhelp32Snapshot(SnapshotFlags flags, uint32 th32ProcessID);

		[Import("kernel32.lib"), CLink]
		public static extern void SetLastError(uint32 dwErrCode);

		[Import("kernel32.lib"), CLink]
		public static extern IntBool Process32First(Handle hSnapshot, PROCESSENTRY32* lppe);

		[Import("kernel32.lib"), CLink]
		public static extern IntBool Process32Next(Handle hSnapshot, PROCESSENTRY32* lppe);

		[Import("kernel32.lib"), CLink]
		/// Retrieves a handle for each module in the specified process.
		/// hProcess > A handle to the process.
		/// lphModule > An array that receives the list of module handles.
		/// lpcbNeeded > The number of bytes required to store all module handles in the lphModule array.
		/// Return = If the function succeeds, the return value is nonzero.
		public static extern IntBool EnumProcessModules(
			Handle hProcess,
			HModule* lphModule,
			uint32 cb,
			uint32* lpcbNeeded);

		[Import("kernel32.lib"), CLink]
		/// Retrieves the base name of the specified module.
		public static extern IntBool GetModuleBaseNameA(
			Handle hProcess,
			HModule* lphModule,
			char8* lpBaseName,
			uint32 nSize);

		[Import("Advapi32.lib"), CLink]
		public static extern IntBool LookupPrivilegeValueA(
			char8* lpSystemName,
			char8* lpName,
			LUID* lpLuid);

		[Import("Advapi32.lib"), CLink]
		/// The AdjustTokenPrivileges function enables or disables
		/// privileges in the specified access token. Enabling or
		/// disabling privileges in an access token requires
		/// TOKEN_ADJUST_PRIVILEGES access.
		public static extern IntBool AdjustTokenPrivileges(
			Handle TokenHandle,
			IntBool DisableAllPrivileges,
			TOKEN_PRIVILEGES* NewState,
			uint32 BufferLength,
			TOKEN_PRIVILEGES* PreviousState,
			uint32* ReturnLength);

		[Import("Advapi32.lib"), CLink]
		/// The OpenProcessToken function opens the access token
		/// associated with a process.
		public static extern IntBool OpenProcessToken(
			Handle ProcessHandle,
			uint32 DesiredAccess,
			Handle* TokenHandle);

		[Import("kernel32.lib"), CLink]
		/// ReadProcessMemory copies the data in the specified
		/// address range from the address space of the specified
		/// process into the specified buffer of the current
		/// process. Any process that has a handle with
		/// PROCESS_VM_READ access can call the function.
		public static extern IntBool ReadProcessMemory(
			Handle hSnapshot,
			void* lpBaseAddress,
			void* lpBuffer,
			uint nSize,
			uint* lpNumberOfBytesRead);
	}
}