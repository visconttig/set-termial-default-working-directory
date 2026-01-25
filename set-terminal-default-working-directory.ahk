#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: 
; FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% 
; ;=============================================

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
    IfWinExist, ahk_exe Hyper.exe
    {
        if (!alreadyExecuted)
        {
            WinActivate
            WinWaitActive, ahk_exe Hyper.exe

            SendInput, cd %fullPath%{Enter}
            SendInput, clear{Enter}
            alreadyExecuted := true
        }
    }
    else
    {
        alreadyExecuted := false
    }
}

; ===============================
; RE-TRIGGER ON NEW TAB ONLY
; ===============================
#IfWinActive ahk_exe Hyper.exe
^+t::
{
    Send ^+t          ; let Hyper create the tab
    Sleep 300         ; give the shell time to initialize
    alreadyExecuted := false
}
return
#IfWinActive
