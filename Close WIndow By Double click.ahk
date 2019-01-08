;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;  	Double Mouse Click Close Window	  	;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Double hit the mouse center wheel on any window to close it 
; Script taken from url: https://autohotkey.com/board/topic/66686-middle-click-to-close-windows/

~MButton::

   If (A_PriorHotkey != A_ThisHotkey OR A_TimeSincePriorHotkey > 300)
      Return
Sleep 100
   WinClose A
Return

AltTabWinArray(Include="NotExcluded",Exclude="Hidden Disable AllwaysOnTop TaskBar Desktop ChildWin NoTitle Custom1",Options="",Alert="")
{
Global                                                      ;VARS TO BE SEEN OUTSIDE THIS FUNCTION
WS_EX_CONTROLPARENT =0x10000
WS_EX_APPWINDOW =0x40000
WS_EX_TOOLWINDOW =0x80
WS_DISABLED =0x8000000
WS_POPUP =0x80000000

;Blank VARS
AltTab_Win_Count = 0
AltTab_Win_ID_List =

Loop
   {
   Sleep -1
   If    AltTab_Win_ID_%A_Index% =
      Break
   AltTab_Win_ID_%A_Index% =
   AltTab_Win_Class_%A_Index% =
   AltTab_Win_Title_%A_Index% =
   }

Prev_DetectHiddenWin := A_DetectHiddenWindows                        ;SAVE CUURENT STATUS

If Include not Contains Hidden
   DetectHiddenWindows, Off
Else
   DetectHiddenWindows, On

WinGet, Window_List, List                                       ; Gather a list of Visible or Not Visible running programs

Loop, %Window_List%
   {
   wid := Window_List%A_Index%
   
   If Include not Contains Disable
      {
      WinGet, Style, Style, ahk_id %wid%
      If (Style & WS_DISABLED)
         Continue
      }
   
   If Include not Contains AllwaysOnTop
      {
      WinGet, ExStyle, ExStyle, ahk_id %wid%
      If (ExStyle & 0x8)                                          ; skip Allways on top wins
         Continue
      }

   WinGetTitle, wid_Title, ahk_id %wid%
   
   If Include not Contains ChildWin
      {
      Parent := Decimal_to_Hex( DllCall( "GetParent", "uint", wid ) )
      WinGetClass, Win_Class, ahk_id %wid%
      
      If Exclude Contains TaskBar
      If Win_Class = Progman
      If wid_Title = Program Manager
         Continue

      If Exclude Contains Desktop
      If Win_Class = Shell_TrayWnd
      If wid_Title =
         Continue
      
      WinGet, Style_parent, Style, ahk_id %Parent%

      If ((ExStyle & WS_EX_TOOLWINDOW)
         or ((ExStyle & ws_ex_controlparent) and ! (Style & WS_POPUP) and !(Win_Class ="#32770") and ! (ExStyle & WS_EX_APPWINDOW))       ; pspad child window excluded
         or ((Style & WS_POPUP) and (Parent) and ((Style_parent & WS_DISABLED) =0)))                                        ; notepad find window excluded ; note - some windows result in blank value so must test for zero instead of using NOT operator!
         continue
      }
   
   If Include not Contains NoTitle
   If (! (wid_Title))                                           ; skip unimportant windows ; ! wid_Title or Disabled
      {
      If Win_Class <> Shell_TrayWnd                              ;TASKBAR WAS EXCLUDED BEFORE
         Continue
      }
    
   ;ADD WINS TITLES AND CLASSES TO EXCLUDE
   If Include not Contains Custom1
      {
      If (wid_Title = "Norton 360") && (Win_Class = "SymHTMLDialog")
         Continue
      }
    
                                             ;ADD CURRENT WINDOW TO LIST
   AltTab_Win_Count ++
   AltTab_Win_ID_%AltTab_Win_Count% := wid
   AltTab_Win_Class_%AltTab_Win_Count% := Win_Class
   AltTab_Win_Title_%AltTab_Win_Count% := wid_Title
   
   If AltTab_Win_ID_List =
      AltTab_Win_ID_List = %wid%
   Else
      AltTab_Win_ID_List = %AltTab_Win_ID_List%,%wid%
   }
   

                                                   ;Restore Status
If Prev_DetectHiddenWin in On,Off
   DetectHiddenWindows, %Prev_DetectHiddenWin%

Return AltTab_Win_ID_List
}
   
Decimal_to_Hex(var)            ;USED TO GET PARENT WIN
{
SetFormat, integer, hex
var += 0
SetFormat, integer, d
Return var
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;