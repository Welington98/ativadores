@ECHO  off
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #        Copiando arquivos necessarios 		     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		REM Criando pasta Ativadores
		MD C:\Tools\Ativadores
		MD C:\Tools\Ativadores\ativadores
		REM Copiando arquivos base
		robocopy arquivos-base\ C:\Tools\Ativadores\ /E /W:10 /XO /LOG:C:\Tools\Ativadores\Ativadores.LOG
		pause
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #           Adicionar Exceção Antivirus		     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		REM Variavel
		set DFCONTROL=C:\Tools\Ativadores\dfControl\dfControl.exe
		REM Estrutura
		powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath %DFCONTROL%
	pause
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #           Desativando Antivirus      		     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		REM Extrair dControl
		arquivos-base\7zip\7z.exe x -y "C:\Tools\Ativadores\dControl\dControl.zip" -psordum -oC:\Tools\Ativadores\
		REM Desativar Antivirus
		start C:\Tools\Ativadores\dControl\dfControl.exe
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #           Agendar Ativadores      			     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		rem	schtasks /Create /TN Ativador_do_Office C:\Tools\Ativadores\ativadores\KMSAutox86.exe /RU "%computername%\%username%" /RP * /mo 10
		rem	SCHTASKS /CREATE /TN "Ativador_do_Office" /TR "C:\Tools\Ativadores\Ativador_Agendado.bat" /SC ONSTART /RU SYSTEM /RL HIGHEST
		call C:\Tools\Ativadores\Agendar_Ativacao.bat
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
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo #           Ativar Antivirus      		     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
		REM Extrair dControl
		7zip\7z.exe x -y "C:\Tools\Ativadores\ativadores\dControl\dControl.zip" -psordum -oC:\Tools\Ativadores\dControl
		REM Desativar Antivirus
		start C:\Tools\Ativadores\dControl\dfControl.exe