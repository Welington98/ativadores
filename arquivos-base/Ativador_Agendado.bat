@ECHO Off
REM - VARIAVEIS
	set LOG=C:\Tools\Ativadores\Ativador-Office.LOG
	set KMSAutox86=KMSAutox86.exe
echo EXTRAIR ATIVADOR DO OFFICE
	C:\Tools\Ativadores\7zip\7z.exe x -y "C:\Tools\Ativadores\Ativadores-superinner.zip" -psuperinner -oC:\Tools\ativadores\ativadores
echo ATIVAR WINDOWS E Office	
	cd C:\Tools\Ativadores\ativadores\
	%KMSAutox86% /ofs=act
echo REMOVER ARQUIVOS DO ATIVADOR
	del C:\Tools\ativadores\ativadores /F /Q
echo GERANDO LOG
	dir /s %KMSAutox86% > %LOG% 
	exit