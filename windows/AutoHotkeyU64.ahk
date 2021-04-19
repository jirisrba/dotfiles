#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input
DetectHiddenWindows, on
SetWinDelay, 0

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ScratchDir = C:\Users\op3346\scratch

; Text Expander = Autohotkey hotstrings

::llt::ls -ltr | tail
::dush::du -sh * | sort -h | tail
:`t:-ot::-o table

; email
::sjopict::srba.jiri@operatorict.cz
:o:dd,::Dobrý den,`n`n
:`t:dj::di­ky, JS
::sp,::S pozdravem,`n`nJiří Srba
::ht,::hotovo,`n`nJS`n`n
::ddh,::Dobrý den,`n`nhotovo,`n`nS pozdravem,`n`nJiří Srba


; Windows and Q closes active window
^q::
if !WinActive("ahk_class WorkerW")
	WinClose, A
return

; Caps Lock acts as Shift
Capslock::Shift

; printscreen
PrintScreen::Run, "%windir%\system32\SnippingTool.exe"

; Paste plain text
; Ctrl+Shift+v
^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return


; Hyper terminal
#h::
	Run, "C:\Users\sol60210\AppData\Local\hyper\Hyper.exe"
return

; Win+t pro timestamp
#t::
	FormatTime, TimeString, %A_Now%, yyyyMMdd
	Send %TimeString%
return

; guake Windows Terminal
#`::
    terminal := WinExist("ahk_exe WindowsTerminal.exe")
    if (terminal)
    {
        active := WinActive("ahk_id " terminal)
        if (active)
            WinMinimize, ahk_id %active%
        else
            WinActivate, ahk_id %terminal%
    }
    else
        Run, wt.exe
Return

; Oracle
::$O::$ORACLE_HOME
:`t:. o::. oraenv
:`t:. oa::. oraenv <<< $(awk -F: '$1 ~ /\+ASM/ {print $1}' /etc/oratab)
:`t:spv::show parameter
:`t:rt/::rman target=/
:`t:cpfs::create pfile='$PWD/init@.ora' from spfile;
::cdl::cd /var/log/dba

; SQL command
:`t:ssf::select * from
:`t:scf::select count(*) from

;-------------------------------------------------------------------;
; WindowsKey+Shift+Up / WindowsKey+Shift+Down
; Resizes window to half the screen height and moves it to the top
; or bottom of whichever screen has the largest overlap.
; By default, the window retains its horizontal (x) position and
; width.  To change this, uncomment the WinMaximize line.
;-------------------------------------------------------------------;
UpDownSnap(Direction)
{
  ; WinMaximize, A
  WinGetPos, x, y, w, h, a, , ,
  SysGet , Count, MonitorCount
  refArea := 0
  Loop, %count%
  {
    SysGet, m, MonitorWorkArea, %A_Index%
    xo := Max(0, Min(x + w, mRight) - Max(x, mLeft))
    yo := Max(0, Min(y + h, mBottom) - Max(y, mTop))
    area := xo * yo
    if (area > refArea)
    {
      monTop := mTop
      monBottom := mBottom
      monLeft := mLeft
      monRight := mRight
      refArea := area
    }
  }

  ; If the refArea is still equal to 0, the window does
  ; not overlap with any monitors. Wat?
  if (refArea > 0)
  {
    if (direction = 1)
      newY := monTop
    Else
      newY := (monBottom - monTop) / 2 + monTop
    WinMove , a, , monLeft, newY, (monRight - monLeft), (monBottom - monTop) / 2
  }
}
#+Up::UpDownSnap(1)
#+Down::UpDownSnap(0)
