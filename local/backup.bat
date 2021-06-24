@REM 开机后设置备份,使用start是在新的终端同时进行的,call是按顺序依次

set HOME_PATH=C:\Users\29845
set BACKUP_DIR=D:\Game\Github\Programming-Configuration

@REM 备份ssh 目录后都必须加个'\' (比如.ssh有可能是目录,也可能是文件,而.ssh\只可能是目录)
mkdir %BACKUP_DIR%\backup & cd %BACKUP_DIR%\backup
xcopy %HOME_PATH%\.ssh\ .ssh\ /e/y/d

@REM 备份lists
mkdir %BACKUP_DIR%\lists & cd %BACKUP_DIR%\lists
call scoop list > scoop-apps.bak
call scoop bucket list > scoop-buckets.bak
call yarn global list > yarn-global.bak
call npm -g list > npm-global.bak

@REM 备份其他
mkdir %BACKUP_DIR%\others & cd %BACKUP_DIR%\others
xcopy C:\Windows\System32\drivers\etc\hosts hosts\ /e/y/d
xcopy D:\Game\Scoop\persist\maven\conf\settings.xml maven\conf\ /e/y/d
xcopy D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 .\PowerShell\ /e/y/d

@REM 备份 ~\
mkdir %BACKUP_DIR%\user-config & cd %BACKUP_DIR%\user-config
xcopy %HOME_PATH%\.conda\ .conda\ /e/y/d
xcopy %HOME_PATH%\.config\ .config\ /e/y/d
xcopy %HOME_PATH%\pip\ pip\ /e/y/d
xcopy %HOME_PATH%\.npmrc . /y/d
xcopy %HOME_PATH%\.yarnrc . /y/d
xcopy %HOME_PATH%\.condarc . /y/d
xcopy %HOME_PATH%\.gitconfig . /y/d

pause
