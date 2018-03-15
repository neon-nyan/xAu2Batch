:: "SETLOCAL DELAYEDEXPANSION" MUST BE ENABLED FIRST BEFORE YOU CAN CALL THIS SUBCLASS!

:: INFORMATION FOR THIS SUBCLASS
:: Input:
::  !_inIl!                 -> [string]         : Variable contains of some value data in preset file.
::  !_IgnoredLine_Display!  -> [boolean]        : If it turned to true, Parser will automatically show
::                                                c_HASH class value in your preset file as output
::                                                message. Like comment line, but it's shown in your
::                                                console :D
::
:: Output:
::  !_IgnoredLine!          -> [boolean]        : To determine your value is IgnoredLine class one or not.
::  !_cdc_isVideo!          -> [boolean]        : Is the preset contains current video codec information?
::  !_cdc_isAudio!          -> [boolean]        : Is the preset contains current audio codec information?
::  !_cdc_isFilter!         -> [boolean]        : Do you want some tweaks for your video?
::  !_cdc_Video_Type!       -> [string]         : What of current video codec type that you want to use?
::  !_cdc_Audio_Type!       -> [string]         : What of current audio codec type that you want to use?
::  !_cdc_Video_Param_Out!  -> [string]         : Parameter output for your video processing.
::  !_cdc_Audio_Param_Out!  -> [string]         : Parameter output for your audio processing.

:RESET_TO_DEFAULT
    set _IgnoredLine=false
    set _IgnoredLine_Display=false
    set _IgnoredLine_c_HASH=false
    set _IgnoredLine_c_AT=false

:CheckIgnoredLine
    for /f "tokens=1,2,3 delims=: " %%a in ('type "lib\\Rulesets\\Preset\\_IgnoredLine"') do (
        echo !_inIl! | find "%%a" > nul
        if !errorlevel! == 0 (
            :_CheckIfNotIgnoredCOMMENT
                if not "%%c" == "c_COMMENT" (
                    echo !_inIl! | find "//" > nul
                    if !errorlevel! == 1 (
REM                     :: YOU CAN DEFINE YOUR OWN IMPLEMENTATION HERE!!!
                        :_is_IgnoredLine_Allowed
                            if "%%c" == "c_HASH"    set _IgnoredLine_c_HASH=true
                            if "%%c" == "c_AT"      set _IgnoredLine_c_AT=true

                        :: c_HASH Implementation
                        :IgnoredLine_c_HASH
                            if "!_IgnoredLine_c_HASH!" == "true" (
                                if "!_IgnoredLine_Display!" == "true" (
REM                                 :: Display c_HASH To Output :3
                                    echo !_inIl!
                                )
                            )
                        
                        :: c_AT Implementation
                        :IgnoredLine_c_HASH
                            if "!_IgnoredLine_c_AT!" == "true" (
REM                             :: This one will be more complicated T__T)
                                :: TODO: Find "audio" and/or "video" and/or "filter" tag on c_AT and
                                ::       split it for itself at 1st and its codec name/filter boolean as 2nd.
                                ::
                                ::       If one of them are not defined or even defined, pick the boolean for
                                ::       their own variable in action.

                                REM EOF
                            )
                    )
                )
            set _IgnoredLine=true
        )
    )