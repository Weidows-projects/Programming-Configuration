@REM 开机后设置备份,使用start是在新的终端同时进行的,call是按顺序依次

set HOME_PATH=C:\Users\29845
set BACKUP_DIR=D:\Game\Github\Programming-Configuration
mkdir %BACKUP_DIR% %BACKUP_DIR%\Scoop backup\.ssh User_config

@REM 备份Scoop
cd %BACKUP_DIR%\Scoop
call scoop list > apps.bak
call scoop bucket list > buckets.bak
copy %HOME_PATH%\.config\scoop\config.json .

@REM 备份pwsh
cd %BACKUP_DIR%
copy D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 PowerShell

@REM 备份hosts
copy C:\Windows\System32\drivers\etc\hosts hosts

@REM 备份 ~\
copy %HOME_PATH%\.ssh\* backup\.ssh
copy %HOME_PATH%\.gitconfig User_config
copy %HOME_PATH%\.npmrc User_config
copy %HOME_PATH%\.yarnrc User_config
copy %HOME_PATH%\pip.ini User_config
