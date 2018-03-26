@echo off
cls

:_main && (
    REM DISPLAYABLE COMMENT LINE TEST
        set std=%~1

    set _in=test2.2ab
    call "lib\\DataAllocation\\PresetAllocation"

    goto :__end
)

:__end