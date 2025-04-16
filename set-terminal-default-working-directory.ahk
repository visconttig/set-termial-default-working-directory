#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: 
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% 
;=============================================

; Target directory (dynamic version)
targetDir := A_UserName "\\OneDrive\\Desktop\\html-projects"
fullPath := "C:\\Users\\" . targetDir


; Prevent repeat execution
alreadyExecuted := false

; Watch for Hyper launching every second
SetTimer, CheckHyper, 1000
return

CheckHyper:
{
    ; Look for a window with "Hyper" in its title
    IfWinExist, ahk_exe Hyper.exe
    {
        if (!alreadyExecuted)
        {
            ; Activate the window
            WinActivate
            ; Wait for it to be ready
            WinWaitActive, ahk_exe Hyper.exe

            ; Send the cd command + Enter
            SendInput, cd %fullPath%{Enter}
            SendInput, clear{Enter}
            alreadyExecuted := true
        }
    }
    else
    {
        alreadyExecuted := false ; Reset if Hyper is closed
    }
}
