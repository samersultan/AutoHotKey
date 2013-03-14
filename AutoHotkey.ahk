;   /-------------------------------------------/
;  /-----Start Auto Hot Key Code --------------/
; /-------------------------------------------/

#n::
Run http://www.reddit.com
Run https://mail.google.com/mail/u/0/?shva=1#inbox
return

; -------------------------------------------------------------------------
; Ctrl + Shift + C to Search Google
; -------------------------------------------------------------------------

^+c::
{
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}


; -------------------------------------------------------------------------
; Caplocks Key To Min Windows
; -------------------------------------------------------------------------

Capslock::WinMinimize,A
+Capslock::Capslock

; -------------------------------------------------------------------------
;  plus on the numpad will send ctrl + 
; -------------------------------------------------------------------------

#IfWinActive, ahk_class MozillaUIWindowClass
NumpadAdd::^+
Return 
#IfWinActive

; -------------------------------------------------------------------------
;  New text file hot key alt + ctrl + n 
; -------------------------------------------------------------------------

; hotkey is set to control + alt + n
; more on hotkeys: http://www.autohotkey.com/docs/Hotkeys.htm
^!n::

; script will automatically use its current directory as its "working directory"
; to get the file to appear in the active directory we have to extract 
; the full path from the window(stupid!)

; get full path from open windows
WinGetText, FullPath, A

; split up result (returns paths seperated by newlines [also lame])
StringSplit, PathArray, FullPath, `n

; get first item
FullPath = %PathArray1%

; clean up result
FullPath := RegExReplace(FullPath, "(^Address: )", "")
StringReplace, FullPath, FullPath, `r, , all

; change working directory
SetWorkingDir, %FullPath%

; an error occurred with the SetWorkingDir directive
if ErrorLevel
	return

; display input box for file name
InputBox, UserInput, New File (example: foo.txt), , ,400, 100

; user pressed cancel
if ErrorLevel
    return

; success! output file with user input
else
	FileAppend, ,%UserInput%	
return

; -------------------------------------------------------------------------
;  Disable trackpad while typing (Default set to 500ms feel free to change)
; -------------------------------------------------------------------------

 ; Script Function: 
 ; Disables trackpad for 500ms any time a key is pressed (prevents accidental mouse clicks) 

 ;  #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases. SendMode Input  
 ; Recommended for new scripts due to its superior speed and reliability. SetWorkingDir %A_ScriptDir%  
 ; Ensures a consistent starting directory.  
 ; keyboard hook code credit: http://www.autohotkey.com/forum/post-127490.html#127490 

 #Persistent OnExit, Unhook  hHookKeybd := SetWindowsHookEx(WH_KEYBOARD_LL   := 13, RegisterCallback("Keyboard", "Fast")) Return  ReenableTrackpad: BlockInput, MouseMoveOff Return  Unhook: UnhookWindowsHookEx(hHookKeybd) ExitApp  Keyboard(nCode, wParam, lParam) {    Critical    If !nCode    {       BlockInput, MouseMove       SetTimer, ReenableTrackpad, 500    }    Return CallNextHookEx(nCode, wParam, lParam) }  SetWindowsHookEx(idHook, pfn) {    Return DllCall("SetWindowsHookEx", "int", idHook, "Uint", pfn, "Uint", DllCall("GetModuleHandle", "Uint", 0), "Uint", 0) }  UnhookWindowsHookEx(hHook) {    Return DllCall("UnhookWindowsHookEx", "Uint", hHook) }  CallNextHookEx(nCode, wParam, lParam, hHook = 0) {    Return DllCall("CallNextHookEx", "Uint", hHook, "int", nCode, "Uint", wParam, "Uint", lParam) }


; -------------------------------------------------------------------------
;  End
; -------------------------------------------------------------------------


;   /-------------------------------------------/
;  /-------End Auto Hot Key Code --------------/
; /-------------------------------------------/


