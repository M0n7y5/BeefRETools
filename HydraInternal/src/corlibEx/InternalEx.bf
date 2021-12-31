using static System.Windows;
namespace System
{
	extension Internal
	{
		public static HModule GetModuleHandle()
		{
			return (.)(int)Internal.[Friend]sModuleHandle;
		}
	}
}
