#SingleInstance force
SetBatchLines, -1
CoordMode, Mouse, Screen ; Ensure mouse coordinates are relative to the screen

; --- Configurable Coordinates ---
x1 := 910  ; Target X coordinate for the first click
y1 := 480  ; Target Y coordinate for the first click

x2 := 1170  ; Target X coordinate for the second click
y2 := 810  ; Target Y coordinate for the second click

; --- Hotkey Definition ---
q::
    MouseGetPos, originalX, originalY

    Click down
    Sleep, 40
    Click up

    Sleep, 1000

    MouseMove, %x1%, %y1%
    Sleep, 50
    Click down
    Sleep, 40
    Click up
    Sleep, 100 ; Delay after click

    ; 4. Move to x2, y2 and left-click
    MouseMove, %x2%, %y2%
    Sleep, 50
    Click down
    Sleep, 40
    Click up
    Sleep, 100

    ; 5. Move back to the original mouse position
    MouseMove, %originalX%, %originalY%
return

; --- Optional: Press Escape to exit the script ---
Esc::
    ExitApp
return
