; Forces only one instance of this script to run
#SingleInstance Force

; Duration of standard pause between keypresses
StandardPauseDuration := 50

; Function for navigating to quick access folders in Windows File Explorer
FolderNavigator(Num) {
	Sleep(10*StandardPauseDuration)
	Send('+{Tab}')
	Sleep(StandardPauseDuration)
	Send('{Home}')
	Sleep(StandardPauseDuration)
	Loop (Num) {
		Send('{Down}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
	Sleep(20*StandardPauseDuration)
	Send('{Tab}')
}

; Function for navigating to bookmarks on the Google Chrome bookmark bar
BookmarkNavigator(Num) {
	Sleep(10*StandardPauseDuration)
	Send('!B')
	Sleep(StandardPauseDuration)
	Loop (Num-1) {
		Send('{Tab}')
		Sleep(StandardPauseDuration)
	}
	Send('{Enter}')
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

; Windows File Explorer quick access hotkeys
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

; Google Chrome bookmark hotkeys
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
