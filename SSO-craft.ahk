; Configurable recipe positions
baseX := 800
baseY := 440

fertilizerOffset := -60
hayOffset := 0       ; Hay is at baseY = 440
jarOffset := -25     ; Jar is 25px above Hay
garPowOffset := 30   ; Garden Powder is 30px below Hay.
lightOffset := 60   ; Light is 60px below Hay.
purFabOff := 140    ; Purple Fabric

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

F9 & p::   ; F9 + P for Purple Fabric
if (!toggle) {
    currentRecipeOffset := purFabOff
    ToolTip, Selected: Purple Fabric
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
    Sleep, 9000 ; 9000 for Artisanat & 3000 for Crafting
return
