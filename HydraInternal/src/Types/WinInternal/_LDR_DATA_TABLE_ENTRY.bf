using System;
namespace HydraInternal.Types.WinInternal
{
	[CRepr]
	struct _LDR_DATA_TABLE_ENTRY
	{
		_LIST_ENTRY InLoadOrderLinks;
		_LIST_ENTRY InMemoryOrderModuleList;
		_LIST_ENTRY InInitializationOrderModuleList;
		PVOID DllBase;
		PVOID EntryPoint;
		ULONG SizeOfImage;
		UNICODE_STRING FullDllName;
		UNICODE_STRING BaseDllName;
		ULONG Flags;
		USHORT LoadCount;
		USHORT TlsIndex;
	}
}
