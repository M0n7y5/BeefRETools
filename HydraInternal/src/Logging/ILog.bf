using System;
namespace HydraInternal.Logging
{
	interface ILog
	{
		static void Info(String text);
		static void Success(String text);
		static void Warn(String text);
		static void Error(String text);
		static void Fatal(String text);
		static void Debug(String text);
		static void Trace(String text);
	}
}
