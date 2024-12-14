; Forces only one instance of this script to run
#SingleInstance Force

; Duration of standard pause between actions
StandardPauseDuration := 50

; Number of bookmarks on the Google Chrome bookmark bar
NumberOfBookmarks := 3

; Function for navigating to quick access folders in Windows File Explorer
FolderNavigator(Num) {
	Send('+{Tab}')
	Sleep(StandardPauseDuration)
	Send('{Home}')
	Sleep(StandardPauseDuration)
	Loop (Num+2) {
		Send('{Down}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
	Sleep(5*StandardPauseDuration)
	Send('{Tab}')
}

; Function for navigating to bookmarks on the Google Chrome bookmark bar
BookmarkNavigator(Num) {
	Send('!B')
	Sleep(StandardPauseDuration)
	Loop (Num-1) {
		Send('{Tab}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
}

; System-wide hotkey for launching all favorite apps (and browser bookmarks) and moving them to the preferred screen positions
^Numpad1:: {
	Send('#e')
	Loop (9) {
		Sleep(15*StandardPauseDuration)
		Send('#' . A_Index)
	}

	WinWait('ahk_class CabinetWClass')
	WinActivate('ahk_class CabinetWClass')
	WinMove(10, 10, 1000, 500, 'ahk_class CabinetWClass')
	WinMaximize('ahk_class CabinetWClass')
	Send('{LWin down}+{Left}{LWin up}')

	WinWait('ahk_exe chrome.exe')
	WinActivate('ahk_exe chrome.exe')
	WinMove(10, 10, 1000, 500, 'ahk_exe chrome.exe')
	WinMaximize('ahk_exe chrome.exe')
	Loop (NumberOfBookmarks) {
		BookmarkNavigator(A_Index)
		Sleep(StandardPauseDuration)
		Send('^t')
		Sleep(StandardPauseDuration)
	}
	Send('^w')

	WinWait('ahk_exe OUTLOOK.EXE')
	WinActivate('ahk_exe OUTLOOK.EXE')
	WinMove(10, 10, 1000, 500, 'ahk_exe OUTLOOK.EXE')
	WinMaximize('ahk_exe OUTLOOK.EXE')
	Send('{LWin down}+{Left}{LWin up}')

	WinWait('Microsoft To Do')
	WinActivate('Microsoft To Do')
	WinMove(10, 10, 1000, 500, 'Microsoft To Do')
	WinMaximize('Microsoft To Do')
	Send('{LWin down}+{Left}{LWin up}')

	WinWait('ahk_exe Spotify.exe')
	WinActivate('ahk_exe Spotify.exe')
	WinMove(10, 10, 1000, 500, 'ahk_exe Spotify.exe')
	WinMaximize('ahk_exe Spotify.exe')
	Send('{LWin down}+{Left}{LWin up}')
}

; System-wide music hotkeys
^Numpad0:: {
	Send('{Volume_Mute}')
}
^Numpad8:: {
	Send('{Volume_Up}')
}
^Numpad2:: {
	Send('{Volume_Down}')
}
^Numpad5:: {
	Send('{Media_Play_Pause}')
}
^Numpad6:: {
	Send('{Media_Next}')
}
^Numpad4:: {
	Send('{Media_Prev}')
}

; Windows File Explorer quick access and open selected file in Visual Studio Code hotkeys
#HotIf WinActive('ahk_class CabinetWClass')
^1:: {
	FolderNavigator(1)
}
^2:: {
	FolderNavigator(2)
}
^3:: {
	FolderNavigator(3)
}
^4:: {
	FolderNavigator(4)
}
^5:: {
	FolderNavigator(5)
}
^6:: {
	FolderNavigator(6)
}
^7:: {
	FolderNavigator(7)
}
^8:: {
	FolderNavigator(8)
}
^9:: {
	FolderNavigator(9)
}
^o:: {
	A_Clipboard := ''
	Send('^C')
	ClipWait()
	Run('C:\Users\Maarten lokaal\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk ' . A_Clipboard)
}

; Google Chrome bookmark bar hotkeys
#HotIf WinActive('ahk_exe chrome.exe')
^1:: {
	BookmarkNavigator(1)
}
^2:: {
	BookmarkNavigator(2)
}
^3:: {
	BookmarkNavigator(3)
}
^4:: {
	BookmarkNavigator(4)
}
^5:: {
	BookmarkNavigator(5)
}
^6:: {
	BookmarkNavigator(6)
}
^7:: {
	BookmarkNavigator(7)
}
^8:: {
	BookmarkNavigator(8)
}
^9:: {
	BookmarkNavigator(9)
}
