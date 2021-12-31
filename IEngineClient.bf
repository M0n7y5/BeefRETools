using HydraInternal;
using System;
using System.Interop;
using Pasteware2.SDK.Hash;
using Pasteware2.SDK.Datatypes;
using Pasteware2.SDK.Interfaces.Steam;
namespace Pasteware2.SDK.Interfaces
{
	[CRepr]
	public struct IEngineClient : VTInterface
	{
		public void GetScreenSize(c_int* iWidth, c_int* iHeight) mut
		{
			CallVFunc!<c_int*, c_int*>(5, iWidth, iHeight);
		}

		public bool GetPlayerInfo(int nEntityIndex, PlayerInfo_t* pInfo) mut
		{
			CallVFuncRet!<bool, PlayerInfo_t*>(8, pInfo);
		}


		public int GetPlayerForUserID(c_int nUserID) mut
		{
			CallVFuncRet!<int, c_int>(9, nUserID);
		}

		public bool IsConsoleVisible() mut
		{
			CallVFuncRet!<bool>(11);
		}

		public int GetLocalPlayer() mut
		{
			CallVFuncRet!<int>(12);
		}


		public bool GetLastTimeStamp() mut
		{
			CallVFuncRet!<bool>(14);
		}

		public void GetViewAngles(QAngle* angle) mut
		{
			CallVFunc!<QAngle*>(18, angle);
		}

		public void SetViewAngles(QAngle* angle) mut
		{
			CallVFunc!<QAngle*>(19, angle);
		}

		public int GetMaxClients() mut
		{
			CallVFuncRet!<int>(20);
		}

		/// returns true if the player is fully
		/// connected and active in game
		/// (i.e, not still loading) and for check doesnt
		/// need isconnected
		public bool IsInGame() mut
		{
			CallVFuncRet!<bool>(26);
		}

		/// returns true if the player is connected,
		/// but not necessarily active in game
		/// (could still be loading)
		public bool IsConnected() mut
		{
			CallVFuncRet!<bool>(27);
		}

		public bool IsDrawingLoadingImage() mut
		{
			CallVFuncRet!<bool>(28);
		}

		public ViewMatrix_t* GetViewAngles() mut
		{
			CallVFuncRet!<ViewMatrix_t*>(37);
		}

		public void* GetBSPTreeQuery() mut
		{
			CallVFuncRet!<void*>(43);
		}

		public char8* GetLevelName() mut
		{
			CallVFuncRet!<char8*>(52);
		}

		public char8* GetLevelNameShort() mut
		{
			CallVFuncRet!<char8*>(53);
		}

		public INetChannelInfo* GetNetChannelInfo() mut
		{
			CallVFuncRet!<INetChannelInfo*>(78);
		}

		public bool IsPlayingDemo() mut
		{
			CallVFuncRet!<bool>(82);
		}

		public bool IsRecordingDemo() mut
		{
			CallVFuncRet!<bool>(83);
		}

		public bool IsPlayingTimeDemo() mut
		{
			CallVFuncRet!<bool>(84);
		}

		public bool IsTakingScreenshot() mut
		{
			CallVFuncRet!<bool>(92);
		}

		public bool IsHLTV() mut
		{
			CallVFuncRet!<bool>(93);
		}

		public c_int GetEngineBuildNumber() mut
		{
			CallVFuncRet!<c_int>(104);
		}

		public char8* GetProductVersionString() mut
		{
			CallVFuncRet!<char8*>(105);
		}

		public void ExecuteClientCmd(char8* szCmdString) mut
		{
			CallVFunc!<char8*>(108, szCmdString);
		}

		public void ClientCmdUnrestricted(char8* szCmdString, bool bFromConsoleOrKeybind = false) mut
		{
			CallVFunc!<char8*, bool>(114, szCmdString, bFromConsoleOrKeybind);
		}

		public SteamAPIContext_t* GetSteamAPIContext() mut
		{
			CallVFuncRet!<SteamAPIContext_t*>(185);
		}

		public bool IsVoiceRecording() mut
		{
			CallVFuncRet!<bool>(224);
		}

		[CRepr]
		struct PlayerInfo_t
		{
			uint64 ullVersion = 0;
			uint64 ullXuid;
			char8[128] szName;
			c_int nUserID;
			char8[33] szSteamID;
			uint32 nFriendsID;
			char8[128] szFriendsName;
			bool bFakePlayer;
			bool bIsHLTV;
			crc32[4] uCustomFiles;
			uint8 dFilesDownloaded;
		};


		/*mixin CallVFunc<TRet,
	TArg1, TArg2, TArg3, TArg4>(int index, TArg arg)
		{
			return M.CallVFunc<TRet, TArg>(this, VT, index, arg);
		}*/


		/*mixin CallVFunc<TArg>(int index, TArg arg)
		{
			return M.CallVFunc<void, TArg>(this, VT, index, arg);
		}*/

			/*public mixin ToScopedNativeWChar()
			{
				int encodedLen = UTF16.GetEncodedLen(this);
				char16* buf;
				if (encodedLen < 128)
				{
					buf = scope:mixin char16[encodedLen]* ( ? );
				}
				else
				{
					buf = new char16[encodedLen]* ( ? );
					defer:mixin delete buf;
				}

				UTF16.Encode(this, buf, encodedLen);
				buf
			}*/
	}
}
