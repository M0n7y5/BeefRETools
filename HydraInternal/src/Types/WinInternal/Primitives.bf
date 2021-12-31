namespace HydraInternal.Types.WinInternal
{
	typealias UCHAR = uint8;
	typealias VOID = void;
	typealias PVOID = VOID*;
	typealias ULONG = uint32;
	typealias USHORT = uint16;
	typealias WCHAR = char16;
	typealias PWSTR = WCHAR*;
	typealias CHAR = char8;

	struct UNICODE_STRING
	{
		USHORT Length;
		USHORT MaximumLength;
		PWSTR Buffer;
	}
}
