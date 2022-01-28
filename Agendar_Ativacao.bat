SCHTASKS /CREATE /TN "Ativador_do_Office" /TR "C:\Tools\Ativadores\Ativador_Agendado.bat" /SC ONSTART /RU SYSTEM /RL HIGHEST
pause