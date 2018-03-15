:ParseValue
    for /f "tokens=1,* delims== " %%a in ('type "%_in%"') do (
        setlocal enabledelayedexpansion
            set _inIl=%%a %%b
            call "lib\\DataAllocation\\PresetAllocation\\_IgnoredLine"
            
        endlocal
    )