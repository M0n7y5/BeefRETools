using System;
using System.Interop;
using System.Collections;
using HydraInternal.Logging;
namespace HydraInternal.Hooking.VMT
{
	class VMTObjectManager
	{
		void* _ObjectPointer;
		void** _ObjectVTable;
		void** _ObjectVTableFake;
		int _ObjectVTableSize;

		Dictionary<int, void*> _Hooks = new Dictionary<int, void*>() ~ delete _;
		void*[] buffer ~ delete _;

		public this(void* object)
		{
			_ObjectPointer = object;
			_ObjectVTable = (.)*((void**)object);
			_ObjectVTableSize = GetFunctionCount();

			buffer = new void*[_ObjectVTableSize];
			_ObjectVTableFake = (.)buffer.CArray();
			for (int i = 0; i <= _ObjectVTableSize; ++i)
			{
				_ObjectVTableFake[i] = _ObjectVTable[i];
			}

			*((void**)object) = _ObjectVTableFake;

			L.Trace(scope $"VTable hooked {object} -> {_ObjectVTableFake}");
		}

		private int GetFunctionCount()
		{
			MEMORY_BASIC_INFORMATION mbi = default;
			int i = 0;

			MemProtect executableFlags = .PAGE_EXECUTE | .PAGE_EXECUTE_READ | .PAGE_EXECUTE_READWRITE | .PAGE_EXECUTE_WRITECOPY;

			let ptr = ((void**)_ObjectVTable)[i];
			let size = sizeof(MEMORY_BASIC_INFORMATION);
			let res = VirtualQuery(ptr, &mbi, size);
			while (res != 0)
			{
				let commit = !mbi.State.HasFlag(.MEM_COMMIT);
				let guard = mbi.Protect.HasFlag(.PAGE_GUARD | .PAGE_NOACCESS);
				let exe = !mbi.Protect.HasFlag(executableFlags);

				if (commit || guard || exe || i > 500 || !Misc.IsValidPtr(ptr))/* || !Misc.IsValidPtr(ptr) */
				{
					break;
				}

				i++;
			}

			// handle if i == 0
			
			return i;
		}

		public T Hook<T>(int index, T hookFunction) where T : var
		{
			void* _oFunc = buffer[index];

			buffer[index] = hookFunction;

			_Hooks.Add(index, _oFunc);

			L.Trace(scope $"VTable({_ObjectVTableFake}) hooked func {_ObjectVTable[index]} -> {hookFunction}");

			return (T)_oFunc;
		}

		public void UnHook(int index)
		{
			buffer[index] = _Hooks[index];

			_Hooks.Remove
				(index + 1);
		}

		[CLink, CallingConvention(.Stdcall)]//
		public static extern c_uint VirtualQuery(void* addr, MEMORY_BASIC_INFORMATION* mbi, c_uint lenght);
	}
}
