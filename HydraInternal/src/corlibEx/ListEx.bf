using System.Collections;
using System;
namespace HydraInternal.corlibEx
{
	static class ListEx
	{
		[Inline]
		public static T Accumulate<T>(this List<T> list, int offset = 0, int count = 0)
			where T : operator T + T
		{
			var offset;
			T res = default;
			//						small check
			int max = count == 0 || count > list.Count ? list.Count : count;
			for (; offset != max; ++offset)
			{
				res += list[offset];
			}
			return res;
		}
	}
}
