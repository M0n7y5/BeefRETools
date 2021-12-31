using System;
namespace HydraInternal.Logging
{
	// Export this to global scope
	static
	{
		typealias L = Log;
	}

	static class Log// : ILog
	{
		public static void Info(String text)
		{
			Logger.Log(.Blue, text);
		}

		public static void Success(String text)
		{
			Logger.Log(.Green, text);
		}

		public static void Warn(String text)
		{
			Logger.Log(.Yellow, text);
		}

		public static void Error(String text)
		{
			Logger.Log(.Red, text);
		}

		public static void Fatal(String text)
		{
			Logger.Log(.DarkRed, text);
		}

		public static void Debug(String text)
		{
			Logger.Log(.DarkMagenta, text);
		}

		public static void Trace(String text)
		{
			Logger.Log(.DarkGray, text);
		}
	}
}
