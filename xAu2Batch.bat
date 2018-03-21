@echo off
cls

:_main && (
    set _in=test2.2ab
    call "lib\\DataAllocation\\PresetAllocation"

    goto :__end
)

:__end