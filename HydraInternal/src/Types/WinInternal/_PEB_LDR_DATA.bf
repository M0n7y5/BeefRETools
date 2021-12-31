using System;
namespace HydraInternal.Types.WinInternal
{
	[CRepr]
	struct _PEB_LDR_DATA
	{
		ULONG Length;//0x0
		UCHAR Initialized;//0x4
		VOID* SsHandle;//0x8
		_LIST_ENTRY InLoadOrderModuleList;//0x10
		_LIST_ENTRY InMemoryOrderModuleList;//0x20
		_LIST_ENTRY InInitializationOrderModuleList;//0x30
		VOID* EntryInProgress;//0x40
		UCHAR ShutdownInProgress;//0x48
		VOID* ShutdownThreadId;//0x50
	}
}
