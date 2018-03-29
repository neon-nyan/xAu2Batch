:ParseValue
    for /f "tokens=1,* delims== " %%a in ('type "%_in%"') do (
        setlocal enabledelayedexpansion
            set _inIl=%%a %%b
            
            REM DISPLAYABLE COMMENT LINE TEST
                if %std% == 1 set _IgnoredLine_Display=true

            call "lib\\DataAllocation\\PresetAllocation\\_IgnoredLine"
            
        endlocal
    )