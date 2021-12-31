namespace HydraInternal.Hooking
{
	static
	{
		//Credit to Dogmatt on unknowncheats.me for IsValidPtr
		// and https://docs.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/virtual-address-spaces
#if BF_64_BIT 
		public const int64 _PTR_MAX_VALUE = 0x000F000000000000;
#else
		public const int64 _PTR_MAX_VALUE = 0xFFF00000;
#endif

	}

	static class Misc
	{
		public static bool IsValidPtr(void* p)
		{
			return p >= (void*)0x10000 &&
				(int)p < _PTR_MAX_VALUE &&
				p != null;
		}
	}
}
