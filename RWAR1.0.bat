@echo off
set "batFile=C:\yourscript.cmd"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=[Security.Principal.WindowsIdentity]::GetCurrent(); $a=New-Object Security.Principal.WindowsPrincipal($p); if(-not $a.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){ $s=New-Object System.Diagnostics.ProcessStartInfo; $s.FileName='powershell.exe'; $s.Arguments='-ExecutionPolicy Bypass -NoProfile -Command \"Start-Process ''%batFile%'' -Verb RunAs\"'; $s.Verb='runas'; [Diagnostics.Process]::Start($s) } else { Start-Process '%batFile%' -Verb RunAs }"
