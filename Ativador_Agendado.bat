@ECHO Off
REM EXTRAIR ATIVADOR DO OFFICE
	C:\Tools\Ativadores\7zip\7z.exe x -y "C:\Tools\Ativadores\Ativadores-superinner.zip" -psuperinner -oC:\Tools\ativadores\ativadores
REM ATIVAR WINDOWS E Office	
	cd C:\Tools\Ativadores\ativadores\
	KMSAutox86.exe /ofs=act
REM REMOVER ARQUIVOS DO ATIVADOR
	del C:\Tools\ativadores\ativadores /F /Q
	exit