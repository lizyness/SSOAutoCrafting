; Star Stable Online - Horse Care Automation Script.
; Maintainers: @am-yl and @NebSpacefarer.
; Based on the original work of: @h669835.
; License: GNU General Public License v3.0.
;
; This script might need some personal tweaking depending on your computer and game resolution.
; The default values *should* accommodate a fullscreen game at resolution 1920x1080.
; Please read more at : https://github.com/am-yl/SSOAutoCrafting/blob/main/README.md

; Offset to adapt to different resolution.
; Default values : 0
offsetX := 0
offsetY := 0

; How much milliseconds to wait for each action to be done.
; Change it only if the script tries to click on the next action too quickly.
; Default value : 6000
endWaitTime := 6000

; Dynamic variable for the script, leave untouched.
toggle := false

; Main toggle key, allowing to start and stop the script at ease. Default : F9
F8::
toggle := !toggle
if (toggle) {
    SetTimer, HorseCareLoop, 500
} else {
    SetTimer, HorseCareLoop, Off
}
return

; /!\ START OF THE SCRIPT
; If you do not know exactly what you are doing,
; leave all of below as is.

HorseCareLoop:
    ; Start of routine
    Tooltip, Horse will be taken care of!
    SetTimer, RemoveTip, -2000

    ; Picking Hooves
    Send {q down}
    Sleep, 100
    Send {q up}
    Sleep, 300
    MouseMove, (1044+offsetX), (385+offsetY)
    Click down
    Sleep, 100
    Click up
    Sleep, endWaitTime

    ; Eating Hay
    Send {q down}
    Sleep, 100
    Send {q up}
    Sleep, 300
    MouseMove, (1114+offsetX), (456+offsetY)
    Click down
    Sleep, 100
    Click up
    Sleep, 100
    MouseMove, (952+offsetX), (361+offsetY)
    Click down
    Sleep, 100
    Click up
    Sleep, endWaitTime

    ; Drinking
    Send {q down}
    Sleep, 100
    Send {q up}
    Sleep, 300
    MouseMove, (1136+offsetX), (547+offsetY)
    Click down
    Sleep, 100
    Click up
    Sleep, endWaitTime

    ; Brush
    Send {q down}
    Sleep, 100
    Send {q up}
    Sleep, 300
    MouseMove, (1120+offsetX), (638+offsetY)
    Click down
    Sleep, 100
    Click up

    ; End of routine
    SetTimer, HorseCareLoop, Off
    Tooltip, Horse cared for! You can proceed!
    toggle := false
    SetTimer, RemoveTip, -2000
return

; Remove tooltip
RemoveTip:
    ToolTip
return

; --- Optional: Press F4 to exit the script ---
F8 & F4::
    ExitApp
return