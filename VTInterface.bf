using HydraInternal;
using System;
namespace Pasteware2.SDK.Interfaces
{
	[CRepr]
	struct VTInterface
	{
		public void** VT;// first shit is VT dummy

		public int GetVFuncAddr(int index)
		{
			return (.)VT[index];
		}

		public mixin CallVFuncRet<TRet>(int index) mut
		{
			function TRet(void* this) vfunc = (.)VT[index];
			return vfunc(&this);
		}

		public mixin CallVFuncRet<TRet, TArg>(int index, TArg arg) mut
		{
			function TRet(void* this, TArg) vfunc = (.)VT[index];
			return vfunc(&this, arg);
		}

		public mixin CallVFuncRet<TRet, TArg1, TArg2>(int index, TArg1 arg, TArg2 arg2) mut
		{
			function TRet(void* this, TArg1, TArg2) vfunc = (.)VT[index];
			return vfunc(&this, arg, arg2);
		}

		public mixin CallVFuncRet<TRet, TArg1, TArg2, TArg3>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3) mut
		{
			function TRet(void* this, TArg1, TArg2, TArg3) vfunc = (.)VT[index];
			return vfunc(&this, arg, arg2, arg3);
		}

		public mixin CallVFuncRet<TRet, TArg1, TArg2, TArg3, TArg4>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4) mut
		{
			function TRet(void* this, TArg1, TArg2, TArg3, TArg4) vfunc = (.)VT[index];
			return vfunc(&this, arg, arg2, arg3, arg4);
		}

		public mixin CallVFuncRet<TRet, TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7, TArg8 arg8, TArg9 arg9) mut
		{
			function TRet(void* this, TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9)
				vfunc = (.)VT[index];

			return vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
		}



		public mixin CallVFunc(int index) mut
		{
			function void(void* this) vfunc = (.)VT[index];
			vfunc(&this);
		}

		public mixin CallVFunc<TArg>(int index, TArg arg) mut
		{
			function void(void* this, TArg) vfunc = (.)VT[index];
			vfunc(&this, arg);
		}

		public mixin CallVFunc<TArg1, TArg2>(int index, TArg1 arg, TArg2 arg2) mut
		{
			function void(void* this, TArg1, TArg2) vfunc = (.)VT[index];
			vfunc(&this, arg, arg2);
		}

		public mixin CallVFunc<TArg1, TArg2, TArg3>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3) mut
		{
			function void(void* this, TArg1, TArg2, TArg3) vfunc = (.)VT[index];
			vfunc(&this, arg, arg2, arg3);
		}

		public mixin CallVFunc<TArg1, TArg2, TArg3, TArg4>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4) mut
		{
			function void(void* this, TArg1, TArg2, TArg3, TArg4) vfunc = (.)VT[index];
			vfunc(&this, arg, arg2, arg3, arg4);
		}

		public mixin CallVFunc<TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7) mut
		{
			function void(void* this, TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7)
				vfunc = (.)VT[index];

			vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7);
		}

		public mixin CallVFunc<TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7, TArg8 arg8) mut
		{
			function void(void* this, TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8)
				vfunc = (.)VT[index];

			vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
		}

		public mixin CallVFunc
			<TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7, TArg8 arg8, TArg9 arg9) mut
		{
			function void(void* this,
				TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9)
				vfunc = (.)VT[index];

			vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
		}

		public mixin CallVFunc
			<TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9, TArg10>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7, TArg8 arg8, TArg9 arg9, TArg10 arg10) mut
		{
			function void(void* this,
				TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9, TArg10)
				vfunc = (.)VT[index];

			vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
		}

		public mixin CallVFunc
			<TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9, TArg10,  TArg11>
			(int index, TArg1 arg, TArg2 arg2, TArg3 arg3, TArg4 arg4,
			TArg5 arg5, TArg6 arg6, TArg7 arg7, TArg8 arg8, TArg9 arg9, TArg10 arg10, TArg11 arg11) mut
		{
			function void(void* this,
				TArg1, TArg2, TArg3, TArg4, TArg5, TArg6, TArg7, TArg8, TArg9, TArg10, TArg11)
				vfunc = (.)VT[index];

			vfunc(&this, arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
		}


		/*public mixin CallVFuncVar<TArg>(int index, TArg arg) mut where TArg : var
		{
			function void(void* this, TArg) vfunc = (.)VT[index];
			vfunc(&this, arg);
		}*/

	}
}
