using System.Interop;
using System;
namespace HydraInternal.Hooking.VMT
{
	enum MemState : c_uint
	{
		MEM_COMMIT = 0x1000,
		MEM_FREE = 0x10000,
		MEM_RESERVE = 0x2000
	}

	enum MemType : c_uint
	{
		MEM_IMAGE = 0x01000000,
		MEM_MAPPED = 0x40000,
		MEM_PRIVATE = 0x20000
	}

	enum MemProtect : c_uint
	{
		PAGE_EXECUTE = 0x10,
		PAGE_EXECUTE_READ = 0x20,
		PAGE_EXECUTE_READWRITE = 0x40,
		PAGE_EXECUTE_WRITECOPY = 0x80,
		PAGE_NOACCESS = 0x01,
		PAGE_GUARD = 0x100
	}

	[CRepr]
	struct MEMORY_BASIC_INFORMATION// 32Bit
	{
		public c_uint BaseAddress;
		public c_uint AllocationBase;
		public MemProtect AllocationProtect;
		public c_uint RegionSize;
		public MemState State;
		public MemProtect Protect;
		public MemType Type;
	}

	/*typedef struct DECLSPEC_ALIGN(16) _MEMORY_BASIC_INFORMATION64 {
	    ULONGLONG BaseAddress;
	    ULONGLONG AllocationBase;
	    DWORD     AllocationProtect;
	    DWORD     __alignment1;
	    ULONGLONG RegionSize;
	    DWORD     State;
	    DWORD     Protect;
	    DWORD     Type;
	    DWORD     __alignment2;
	}*/
}
