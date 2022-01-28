@ECHO  off
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #        Copiando arquivos necessarios 		     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		REM Criando pasta Ativadores
		MD C:\Tools\Ativadores
		REM Copiando arquivos base
		robocopy arquivos-base\ C:\Tools\Ativadores\ /E /W:10 /XO /LOG:C:\Tools\Ativadores\Ativadores.LOG
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #           Agendar Ativadores      			     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		rem	schtasks /Create /TN Ativador_do_Office C:\Tools\Ativadores\ativadores\KMSAutox86.exe /RU "%computername%\%username%" /RP * /mo 10
		rem	SCHTASKS /CREATE /TN "Ativador_do_Office" /TR "C:\Tools\Ativadores\Ativador_Agendado.bat" /SC ONSTART /RU SYSTEM /RL HIGHEST
		call C:\Tools\Ativadores\Agendar_Ativacao.bat
	pause
	pause
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #                Extrair Ativadores			     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		7zip\7z.exe x -y "C:\Tools\Ativadores\Ativadores-superinner.zip" -psuperinner -oC:\Tools\ativadores\ativadores
	pause
REM ATIVAR WINDOWS E Office	
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #            Ativar Windows e Office			     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		cd C:\Tools\Ativadores\ativadores\
			KMSAutox86.exe /ofs=act
	pause
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #       Remover arquivos do ativadores       	     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		del C:\Tools\ativadores\ativadores /F /Q
	pause