:: "SETLOCAL DELAYEDEXPANSION" MUST BE ENABLED FIRST BEFORE YOU CAN CALL THIS SUBCLASS!

:: INFORMATION FOR THIS SUBCLASS
:: Input:
::  !_cdc_Type!             -> [string]         : Value of current type state.
::  !_cdc_Codec!            -> [string]         : Value of current codec state.
::
:: Output:
::  

REM Check if type is filter/source/audio/video.
REM Then, if not filter or source, skip it to video/audio parser
:_cdc_checkIgnored_Type
    if /I "!_cdc_isSource!" == "true"   goto :_cdc_sourceHandler
    if /I "!_cdc_isFilter!" == "true"   goto :_cdc_sourceHandler

REM Check if codec in type defined or not.
:_cdc_checkCodec_in_Type
    REM Get an logic exception first for audio or video type
    find /I "!_cdc_Type!" "lib\\Rulesets\\Preset\\_TypesOfCodec" | find /I "!_cdc_Codec!" > nul
    if !errorlevel! == 0 (
        if /I "!_cdc_Type!" == "audio" (
            set _cdc_Audio_Codec=!_cdc_Codec!
        ) else if /I "!_cdc_Type!" == "video" (
            set _cdc_Video_Codec=!_cdc_Codec!
        )
    ) else (
        REM Throw Exception message to output and set codec type as unknown == true
        set _cdc_isType_Unknown=true
        (
            :DEBUG
                echo ### Unknown Codec detected: !_cdc_Codec! codec hasn't defined in @!_cdc_Type!'s type!
       )
    )

    goto :__end

:_cdc_sourceHandler
    echo Ignored ^| !_cdc_isSource! ^| !_cdc_isFilter!

:__end