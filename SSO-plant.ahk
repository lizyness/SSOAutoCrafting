#SingleInstance force
SetBatchLines, -1
CoordMode, Mouse, Screen ; Ensure mouse coordinates are relative to the screen

; --- Configurable Coordinates PLANTS ---
xp := 700 ; Monarde - Bee Balm
; xp := 800 ; Camomille - Chamomile
; xp := 900 ; Lin - Flax
; xp := 1000 ; Jute - Jute
; xp := 1100 ; Mousse - Moss
; xp := 1200  ; Garence des teinturiers - Rubia
yp := 480  ; Target Y coordinate Plants

; --- Configurable Coordinates FERTILIZER ---
; xf := 850 ; Surpuissant - Double-yield fertilizer
; xf := 950 ; Hybride - Rarity fertilizer
; xf := 1050 ; Croissance rapide - Fast-growth fertilizer
; yf := 670 ; Target Y coordinate engrais - fertilizer

; --- Quit & Validation Button Coordinates ---
xc := 750  ;
xv := 1170  ; Target X coordinate for the second click
yv := 810  ; Target Y coordinate for the second click


; --- Hotkey Definition ---
p::
    MouseGetPos, originalX, originalY

    Click down
    Sleep, 40
    Click up

    Sleep, 1000

    if(!xp & !yp & !xf & !yf) {
        MouseMove, %xc%, %yv%
        Sleep, 50
        Click down
        Sleep, 40
        Click up
        Sleep, 100
        MouseMove, %originalX%, %originalY%
        return
    }

    if(xp & yp) {
        MouseMove, %xp%, %yp%
        Sleep, 50
        Click down
        Sleep, 40
        Click up
        Sleep, 100 ; Delay after click
    }

    if(xf & yf) {
        MouseMove, %xf%, %yf%
        Sleep, 50
        Click down
        Sleep, 40
        Click up
        Sleep, 100 ; Delay after click
    }

    ; 4. Move to xv, yv and left-click
    MouseMove, %xv%, %yv%
    Sleep, 50
    Click down
    Sleep, 40
    Click up
    Sleep, 100

    ; 5. Move back to the original mouse position
    MouseMove, %originalX%, %originalY%
return

; --- Optional: Press X to exit the script ---
x::
    ExitApp
return
