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
	Loop (Num) {
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

; System-wide hotkey for opening all most used apps (file explorer and everything pinned to the taskbar) and all bookmarks on the Google Chrome bookmark bar at once
!Numpad1:: {
	Send('#e')
	Sleep(5*StandardPauseDuration)
	Loop (9) {
		Send('#' . A_Index)
		Sleep(5*StandardPauseDuration)
	}
	WinActivate('ahk_exe chrome.exe')
	Sleep(StandardPauseDuration)
	Loop (NumberOfBookmarks) {
		BookmarkNavigator(A_Index)
		Sleep(StandardPauseDuration)
		Send('^t')
		Sleep(StandardPauseDuration)
	}
	Send('^w')
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

; Windows File Explorer quick access and open selected file in secondary app hotkeys
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
	Send('+{F10}')
	Sleep(5*StandardPauseDuration)
	Send('h')
	Sleep(5*StandardPauseDuration)
	Send('{Down}')
	Sleep(StandardPauseDuration)
	Send('{Enter}')
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
