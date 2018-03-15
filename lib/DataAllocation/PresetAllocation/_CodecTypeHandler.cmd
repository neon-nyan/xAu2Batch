:: "SETLOCAL DELAYEDEXPANSION" MUST BE ENABLED FIRST BEFORE YOU CAN CALL THIS SUBCLASS!

:CodecTypeHandler
    :_is_t_Codec
        for /f "tokens=1,2 delims=@ " %%a in ('echo !_inIl!') do (
            echo %%a %%b
        )