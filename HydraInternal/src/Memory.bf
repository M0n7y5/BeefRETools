using System;
using HydraInternal.Logging;
namespace HydraInternal
{
	static
	{
		typealias M = Memory;
	}

	static class Memory
	{


		[Inline]
		public static T GetVFunc<T>(void* thisptr, int nIndex)
		{
			return (*(T**)(thisptr))[nIndex];

			/*function T(void* this) vFn = (.)vt[nIndex];
			return vFn;//(thisObj);*/
		}

		[Inline]
		public static T CallVFunc<T>(Object thisObj, void** vt, int nIndex)
		{
			function T(Object this) vFn = (.)vt[nIndex];

			L.Trace(scope $"Called Virtual function 0x{(uint)vt[nIndex]:X} from object {thisObj}");

			return vFn(thisObj);
		}

		[Inline]
		public static TRet CallVFunc<TRet, T1>(Object thisObj, void** vt, int nIndex, T1 arg1)
		{
			function TRet(Object this, T1 arg) vFn = (.)vt[nIndex];

			L.Trace(scope $"Called Virtual function 0x{(uint)vt[nIndex]:X} from object {thisObj}");

			return vFn(thisObj, arg1);
		}

		[Inline]
		public static TRet CallVFunc<TRet, T1, T2>
			(Object thisObj, void** vt, int nIndex, T1 arg1, T2 arg2)
		{
			function TRet(System.Object this, T1 arg, T2 arg) vFn = (.)vt[nIndex];
			L.Trace(scope $"Called Virtual function 0x{(uint)vt[nIndex]:X} from object {thisObj}");

			return vFn(thisObj, arg1, arg2);
		}

		[Inline]
		public static TRet CallVFunc<TRet, T1, T2, T3>
			(Object thisObj, void** vt, int nIndex, T1 arg1, T2 arg2, T3 arg3)
		{
			function TRet(Object this, T1 arg, T2 arg, T3 arg) vFn = (.)vt[nIndex];

			return vFn(thisObj, arg1, arg2, arg3);
		}

		[Inline]
		public static TRet CallVFunc<TRet, T1, T2, T3, T4>
			(Object thisObj, void** vt, int nIndex, T1 arg1, T2 arg2, T3 arg3, T4 arg4)
		{
			function TRet(Object this, T1 arg, T2 arg, T3 arg, T4 arg) vFn = (.)vt[nIndex];

			return vFn(thisObj, arg1, arg2, arg3, arg4);
		}
	}
}
