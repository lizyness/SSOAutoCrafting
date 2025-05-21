; Configurable recipe positions
baseX := 800
baseY := 440

fertilizerOffset := -60
hayOffset := 0       ; Hay is at baseY = 440
jarOffset := 60      ; Jar is 60px bellow Hay
garPowOffset := 90   ; Garden Powder is 90px below Hay.
lightOffset := 210   ; Light is 210px below Hay.

toggle := false
currentRecipeOffset := hayOffset  ; Default recipe is Hay

; Main toggle key (F9)
F9::
toggle := !toggle
if (toggle) {
    SetTimer, CraftLoop, 500
} else {
    SetTimer, CraftLoop, Off
}
return

; Hotkeys to select recipes while macro is OFF
; (You could let them work anytime, but safer this way)
F9 & h::   ; F9 + H for Hay
if (!toggle) {
    currentRecipeOffset := hayOffset
    ToolTip, Selected: Hay
    SetTimer, RemoveTip, -1000
}
return

F9 & f::   ; F9 + F for Fertilizer
if (!toggle) {
    currentRecipeOffset := fertilizerOffset
    ToolTip, Selected: Fertilizer
    SetTimer, RemoveTip, -1000
}
return

F9 & j::   ; F9 + J for Jar
if (!toggle) {
    currentRecipeOffset := jarOffset
    ToolTip, Selected: Jar
    SetTimer, RemoveTip, -1000
}
return

F9 & g::   ; F9 + G for Garden Powder
if (!toggle) {
    currentRecipeOffset := garPowOffset
    ToolTip, Selected: Garden Power
    SetTimer, RemoveTip, -1000
}
return

F9 & l::   ; F9 + L for Light
if (!toggle) {
    currentRecipeOffset := lightOffset
    ToolTip, Selected: Light
    SetTimer, RemoveTip, -1000
}
return

; Remove tooltip
RemoveTip:
ToolTip
return

; Crafting loop
CraftLoop:
    ; Click crafting bench
    MouseMove, 920, 620
    Click down
    Sleep, 40
    Click up
    Sleep, 100

    ; Move to selected recipe
    recipeY := baseY + currentRecipeOffset
    MouseMove, baseX, recipeY
    Click down
    Sleep, 40
    Click up
    Sleep, 100

    ; Click 'Yes' button
    MouseMove, 1200, 700
    Click down
    Sleep, 40
    Click up
    Sleep, 3000
return
