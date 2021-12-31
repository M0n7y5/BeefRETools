using System;
namespace HydraInternal.Types.WinInternal
{
	enum BitFieldFlags : uint8
	{
		ImageUsesLargePages,
		IsProtectedProcess,
		IsImageDynamicallyRelocated,
		SkipPatchingUser32Forwarders,
		IsPackagedProcess,
		IsAppContainer,
		IsProtectedProcessLight,
		IsLongPathAwareProcess
	}

	[CRepr]
	struct _PEB
	{
		UCHAR InheritedAddressSpace;//0x0
		UCHAR ReadImageFileExecOptions;//0x1
		UCHAR BeingDebugged;//0x2

		BitFieldFlags BitField;//0x3

		UCHAR[4] Padding0;//0x4
		VOID* Mutant;//0x8
		VOID* ImageBaseAddress;//0x10
		_PEB_LDR_DATA* Ldr;//0x18

	}
}
