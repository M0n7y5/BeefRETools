using System;
using System.Diagnostics;
using static System.Windows;
namespace HydraInternal.Logging
{
	class Logger
	{
		static bool isInitialized = false;

		public bool Attach(String title)
		{
			if (!AttachConsole())
				AllocConsole();

			/*if (!AllocConsole())
				return false;

			if (!AttachConsole())
				return false;*/

			/*if(Console.Out.Create("CONOUT$") case .Err)
				return false;*/

			if (!SetConsoleTitleA(title))
				return false;

			isInitialized = true;
			return true;
		}

		public void Detach()
		{
			FreeConsole();
		}

		public static void Log(ConsoleColor color, String message, String topic = "Log")
		{
			/*let time = scope String();
			GetDateTimeString(time);*/

			Debug.Assert(isInitialized, "Attempt to use Log when not initialized!");
			
			Console.ForegroundColor = .White;
			Console.Write("[");

			Console.ForegroundColor = .Magenta;
			Console.Write("{:MM/dd/yyyy-HH:mm:ss}", DateTime.Now);

			Console.ForegroundColor = .White;
			Console.Write("] ");

			Console.ForegroundColor = .White;
			Console.Write("[");

			Console.ForegroundColor = .DarkRed;
			Console.Write(topic);

			Console.ForegroundColor = .White;
			Console.Write("] ");

			Console.ForegroundColor = color;
			Console.WriteLine(message);
			Console.ResetColor();
		}



		private void GetDateTimeString(String dateTimeString)
		{
			let now = DateTime.Now;
			var date = scope String();
			var time = scope String();

			now.ToShortDateString(date);
			time.AppendF("{}:{}:{}", now.Hour, now.Minute, now.Second);

			dateTimeString.AppendF("[{}-{}]", date, time);
		}

		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern bool SetConsoleTitleA(char8* title);

		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern bool AttachConsole(uint32 dwProcessId = (.)-1);

		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern bool FreeConsole();

		[Import("kernel32.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern bool AllocConsole();
	}
}
