; Star Stable Online - Plant & Fertilizer Automation Script.
; Maintainers: @am-yl and @NebSpacefarer.
; Based on the original work of: @h669835.
; License: GNU General Public License v3.0.
;
; This script might need some personal tweaking depending on your computer and game resolution.
; The default values *should* accommodate a fullscreen game at resolution 1920x1080.
; Please read more at : https://github.com/am-yl/SSOAutoCrafting/blob/main/README.md

#SingleInstance force
SetBatchLines, -1
CoordMode, Mouse, Screen ; Ensure mouse coordinates are relative to the screen

; --- Default Coordinates PLANTS ---
xp := 900 ; Target X coordinate for plants (default = flax)
yp := 480  ; Target Y coordinate for plants
xf := -1 ; Target X coordinate for no fertilizer
yf := 670 ; Target Y coordinate for fertilizer

; --- Quit & Validation Button Coordinates ---
xc := 750  ; Target x coordinate for canceling
xv := 1170  ; Target X coordinate for validating
yv := 810  ; Target Y coordinate for validating

; Hotkeys by numbers for plants
F7 & 1::
if (!toggle) {
    xp := 700 ; Bee Balm
    ToolTip, Selected: Bee Balm
    SetTimer, RemoveTip, -1000
}
return

F7 & 2::
if (!toggle) {
    xp := 800 ; Chamomile
    ToolTip, Selected: Chamomile
    SetTimer, RemoveTip, -1000
}
return

F7 & 3::
if (!toggle) {
    xp := 900 ; Flax
    ToolTip, Selected: Flax
    SetTimer, RemoveTip, -1000
}
return

F7 & 4::
if (!toggle) {
    xp := 1000 ; Jute
    ToolTip, Selected: Jute
    SetTimer, RemoveTip, -1000
}
return
F7 & 5::
if (!toggle) {
    xp := 1100 ; Moss
    ToolTip, Selected: Moss
    SetTimer, RemoveTip, -1000
}
return
F7 & 6::
if (!toggle) {
    xp := 1200  ; Rubia
    ToolTip, Selected: Rubia
    SetTimer, RemoveTip, -1000
}
return

; Hotkeys by numbers for fertilizer
F7 & 7::
if (!toggle) {
    xf := 850 ; Double-yield fertilizer
    ToolTip, Selected: Double-yield fertilizer
    SetTimer, RemoveTip, -1000
}
return

F7 & 8::
if (!toggle) {
    xf := 950 ; Hybride - Rarity fertilizer
    ToolTip, Selected: Rarity fertilizer
    SetTimer, RemoveTip, -1000
}
return

F7 & 9::
if (!toggle) {
    xf := 1050 ; Fast-growth fertilizer
    ToolTip, Selected: Fast-growth fertilizer
    SetTimer, RemoveTip, -1000
}
return

; Reseting values for fertilizer and plants
F7 & 0::
if (!toggle) {
    xp := -1 ; No plant selected
    xf := -1 ; No fertilizer selected
    ToolTip, Selected: No plant or fertilizer selected
    SetTimer, RemoveTip, -1000
}
return

; --- Hotkey Definition ---
F7::

    ; -1 - Saving mouse position when launching the script
    MouseGetPos, originalX, originalY

    ; 0 - Canceling if nothing is selected
    if(xp =-1 & xf =-1) {
        ToolTip, Selected: No fertilizer selected
        SetTimer, RemoveTip, -1000
        return
    }

    ; 1 - Clicking on the plot of land
    Click down
    Sleep, 40
    Click up

    Sleep, 1000

    ; 2 - Checking if a plant is chosen, then selecting it
    if(xp & xp != -1) {
        MouseMove, %xp%, %yp%
        Sleep, 50
        Click down
        Sleep, 40
        Click up
        Sleep, 100 ; Delay after click
    }

    ; 3 - Checking if a fertilizer is chosen, then selecting it
    if(xf & xf != -1) {
        MouseMove, %xf%, %yf%
        Sleep, 50
        Click down
        Sleep, 40
        Click up
        Sleep, 100 ; Delay after click
    }

    ; 4. Move to bottom right to validate
    MouseMove, %xv%, %yv%
    Sleep, 50
    Click down
    Sleep, 40
    Click up
    Sleep, 100

    ; 5. Move back to the original mouse position
    MouseMove, %originalX%, %originalY%
return

; Remove tooltip
RemoveTip:
ToolTip
return

; --- Optional: Press F4 to exit the script ---
F4::
    ExitApp
return