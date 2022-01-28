@ECHO
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo # 			     Instalar FastCopy				     #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
	start \FastCopy\setup.exe /silent /DIR=C:\Tools\FastCopy
	echo.
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo # Copiando ativador para C:\Tools\Ativadores        #
	echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
	echo.
	MD C:\Tools\Ativadores
	C:\Tools\FastCopy\FastCopy.exe /cmd=diff /logfile=FastCopy\Log\bkp-disco-f.log /speed=512 /bufsize=256 /skip_empty_dir=FALSE /error_stop=FALSE /force_start /acl=FALSE /verify=FALSE /estimate /force_close Ativadores-superinner.zip /to=C:\Tools\Ativadores\
	
	C:\Tools\FastCopy\FastCopy.exe /cmd=diff /logfile=FastCopy\Log\bkp-disco-f.log /speed=512 /bufsize=256 /skip_empty_dir=FALSE /error_stop=FALSE /force_start /acl=FALSE /verify=FALSE /estimate /force_close 7zip\ /to=C:\Tools\Ativadores\7zip
	
	C:\Tools\FastCopy\FastCopy.exe /cmd=diff /logfile=FastCopy\Log\bkp-disco-f.log /speed=512 /bufsize=256 /skip_empty_dir=FALSE /error_stop=FALSE /force_start /acl=FALSE /verify=FALSE /estimate /force_close Ativador_Agendado.bat /to=C:\Tools\Ativadores
	
	C:\Tools\FastCopy\FastCopy.exe /cmd=diff /logfile=FastCopy\Log\bkp-disco-f.log /speed=512 /bufsize=256 /skip_empty_dir=FALSE /error_stop=FALSE /force_start /acl=FALSE /verify=FALSE /estimate /force_close Agendar_Ativacao.bat /to=C:\Tools\Ativadores
		
rem	copy "Ativadores-superinner.zip" C:\Tools\Ativadores\
rem	robocopy 7zip\ C:\Tools\Ativadores\7zip\
rem	copy Ativador_Agendado.bat C:\Tools\Ativadores\
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