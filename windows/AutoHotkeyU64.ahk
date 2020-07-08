#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ScratchDir = C:\Users\op3346\scratch

; Text Expander = Autohotkey hotstrings
; Oracle
::$O::$ORACLE_HOME
:`t:. o::. oraenv
:`t:. oa::. oraenv <<< $(awk -F: '$1 ~ /\+ASM/ {print $1}' /etc/oratab)
:`t:spv::show parameter
:`t:rt/::rman target=/
:`t:ssf::select * from
:`t:scf::select count(*) from
::ework::jsrba@csas.cz
::cdl::cd /var/log/dba
::llt::ls -ltr | tail
::dush::du -sh * | sort -h | tail
#Hotstring r c   ; send raw and case sensitive
::nfm::{noformat}`n
;:`t:tfa::tail -f ${ORACLE_BASE}/diag/$([[ ${ORACLE_SID%%[1-9]} = "+ASM" ]] && echo "asm" || echo "rdbms")/$(echo ${ORACLE_SID%%[1-9]}|tr '[:upper:]' '[:lower:]')/${ORACLE_SID}/trace/alert_${ORACLE_SID}.log
:`t:cpfs::create pfile='$PWD/init@.ora' from spfile;

; email
:o:dd,::Dobrý den,`n`n
::dj::díky, JS
::sp,::S pozdravem,`n`nJiří Srba
::ht,::hotovo,`n`nJS`n`n
::ddh,::Dobrý den,`n`nhotovo,`n`nS pozdravem,`n`nJiří Srba

; Windows and Q closes active window
#q::
if !WinActive("ahk_class WorkerW")
	WinClose, A
return

; Caps Lock acts as Shift
Capslock::Shift
return

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


; ConEmu64
#c::
	Run, D:\App\cmder\cmder.exe, %ScratchDir%
	;Run, "D:\App\ConEmu\ConEmu64.exe", %ScratchDir%
	return

; Hyper terminal
#h::
	Run, "C:\Users\sol60210\AppData\Local\hyper\Hyper.exe"
	return


; windows shortcuts
; KiTTy Oracle
#o::Send $ORACLE_HOME

; Win+t pro timestamp
#t::
	FormatTime, TimeString, %A_Now%, yyyyMMdd
	Send %TimeString%
	return

; Win+- su - oracle
#-::
	Send, sudo su - oracle{Enter}
        Send, LS_COLORS=$LS_COLORS'di=01;36:'{Enter}
	return


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
