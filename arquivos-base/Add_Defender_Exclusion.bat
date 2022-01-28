call :Admin

START Powershell -nologo -noninteractive -windowStyle hidden -noprofile -command ^
$First = "Add-MpPreference -ThreatIDDefaultAction_Ids "; ^
$Third = " -ThreatIDDefaultAction_Actions Allow -Force"; ^
$ListID =  2147685180, 2147735507, 2147736914, 2147743522, 2147734094, 2147743421, 251873, 213927, 2147722906, 2147748160; ^
ForEach ($ID in $ListID) { Invoke-Expression ($First + $ID + $Third) }; ^
$ListPath = "C:\Windows\KMSAutoS", "C:\Windows\System32\SppExtComObjHook.dll", "C:\Windows\System32\SppExtComObjPatcher.exe", "C:\Windows\AAct_Tools", "C:\Windows\AAct_Tools\AAct_x64.exe", "C:\Windows\AAct_Tools\AAct_files\KMSSS.exe", "C:\Windows\AAct_Tools\AAct_files", "C:\Windows\KMS"; "C:\Tools\Ativadores"; "C:\Tools\Ativadores\ativadores";  "C:\Tools\Ativadores\dfControl\dfControl.exe^
$First = "Add-MpPreference -ExclusionPath "; ^
$Third = "-Force"; ^
ForEach ($Path in $ListPath) { Invoke-Expression ($First + $Path + $Third) }; ^

:Admin
reg query "HKU\S-1-5-19\Environment" >nul 2>&1
if not %errorlevel% EQU 0 (
    cls
    powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -Verb RunAs"
    exit
)
