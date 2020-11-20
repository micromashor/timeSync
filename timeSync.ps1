if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$tick=New-Object System.Media.SoundPlayer
$tick.SoundLocation=".\tick.wav"
while ($true) {
	$millis=(Get-Date).millisecond
	if ($millis -eq 0 -and !(((Get-date).second -eq 29) -or ((Get-date).second -eq 59))) {
		$tick.playsync()
	}
	if([Console]::KeyAvailable) {
		$key = [Console]::ReadKey($true)
		switch ($key.key) {
			J {
				Set-Date -Adjust 0:00:0.01 | Out-Null
				Write-Host 'Adjusted system clock +10 ms'
			}
			G {
				Set-Date -Adjust -0:00:0.01 | Out-Null
				Write-Host 'Adjusted system clock -10 ms'
			}
			K {
				Set-Date -Adjust 0:00:0.1 | Out-Null
				Write-Host 'Adjusted system clock +100 ms'
			}
			F {
				Set-Date -Adjust -0:00:0.1 | Out-Null
				Write-Host 'Adjusted system clock -100 ms'
			}
		}
    }
}
