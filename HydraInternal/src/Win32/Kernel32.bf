using System;
using System.Interop;
using static System.Windows;
namespace HydraInternal.Win32
{
	static class Kernel32
	{
		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern IntBool DisableThreadLibraryCalls(HModule module);

		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern IntBool FreeLibraryAndExitThread(HModule module, c_int exitCode);
	}
}
