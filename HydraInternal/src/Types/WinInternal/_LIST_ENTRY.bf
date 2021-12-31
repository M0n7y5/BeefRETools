using System;
namespace HydraInternal.Types.WinInternal
{
	[CRepr]
	struct _LIST_ENTRY
	{
		_LIST_ENTRY* Flink;//0x0
		_LIST_ENTRY* Blink;//0x8
	}
}
