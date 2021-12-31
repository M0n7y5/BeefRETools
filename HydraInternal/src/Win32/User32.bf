using System;
using System.Interop;
using static System.Windows;
namespace HydraInternal.Win32
{
	static class User32
	{
		[Import("user32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern IntBool GetAsyncKeyState(VirtualKeys vkey);

		[Import("user32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern Handle CreateThread(
			void* secuAttributes,
			c_int stackSize,
			void* startAddr,
			void* param,
			c_int flags,
			c_int* threadID);
	}
}
