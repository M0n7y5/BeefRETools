using System.Text;
namespace System
{
	extension String
	{
		public mixin ToNativeWChar()
		{
			int encodedLen = UTF16.GetEncodedLen(this);
			char16* buf;
			buf = new char16[encodedLen]* (?);
			UTF16.Encode(this, buf, encodedLen);
			buf
		}
	}
}
