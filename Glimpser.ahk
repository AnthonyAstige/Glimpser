;;;;;;;;;
; Setup ;
;;;;;;;;;
#SingleInstance force
#NoEnv 						; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
SendMode Input 				; Recommended for new scripts due to its superior speed and reliability.

;;;;;;;;;;
; Config ;
;;;;;;;;;;
Key = RAlt
Browser = ahk_class Chrome_WidgetWin_0

;;;;;;;;;;;;;;;;;;;;
; Application loop ;
;;;;;;;;;;;;;;;;;;;;
Loop
{
	WaitForNextGlimpse(Key, Browser)
}

;;;;;;;;;;
; Methos ;
;;;;;;;;;;
WaitForNextGlimpse(Key, Browser){
	KeyWait, %Key%, D  ; Wait for the left mouse button to be pressed down.
	WinGet, active_id, PID, A
	WinActivate, %Browser%
	Sleep, 10
	Send {F5}
	Loop
	{
		Sleep, 500
		GetKeyState, state, %Key%, P
		if state = U  ; Key released
			break
	}
	WinActivate, ahk_pid %active_id%
}
