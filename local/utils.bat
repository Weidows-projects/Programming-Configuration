@REM @echo off
@REM ==================================================================
@REM main入口,使用前需要添加环境变量:                     D:\Game\Github\Programming-Configuration\local
@REM ==================================================================

if /i %1 == s call :devenv-starter
if /i %1 == b call :backup
exit


@REM ==================================================================
@REM 启动dev环境
@REM ==================================================================
:devenv-starter
  echo "Confirm if to open?"
  pause

  @REM 备份
  call :backup

  @REM 文件管理
  start /b explorer
  start /b D:\Game\Scoop\apps\OneCommander\current\OneCommanderPortable\OneCommanderV2.exe

  @REM IDE
  start /b code
  start /b idea64.exe
  start /b pycharm64.exe

  @REM 浏览器
  start /b microsoft-edge:

  @REM 通讯
  start /b D:\Game\Scoop\apps\TIM\current\Bin\TIM.exe
  start /b D:\Game\Scoop\apps\dingtalk\current\DingtalkLauncher.exe
  start /b D:\Game\Scoop\apps\wechat\current\WeChat.exe

  @REM 音乐
  start /b D:\Software\KGMusic\KuGou.exe
goto :eof


@REM ==================================================================
@REM 开机后设置备份,使用start是在新的终端同时进行的,call是按顺序依次
@REM ==================================================================
:backup
  @REM !!!!一定要注意等号'='前后不要加空格!!!!
  set HOME_PATH=C:\Users\29845
  set BACKUP_DIR=D:\Game\Github\Programming-Configuration

  @REM cmd 默认是在 HOME_PATH 下启动,需要跳到 BACKUP_DIR 所属盘符
  d:

  @REM 备份ssh 目录后都必须加个'\' (比如.ssh有可能是目录,也可能是文件,而.ssh\只可能是目录)
  mkdir %BACKUP_DIR%\backup & cd %BACKUP_DIR%\backup
  xcopy %HOME_PATH%\.ssh\ .ssh\ /e/y/d
  xcopy C:\root\ root\ /e/y/d

  @REM 备份lists
  mkdir %BACKUP_DIR%\lists & cd %BACKUP_DIR%\lists
  call scoop list > scoop-apps.bak
  call scoop bucket list > scoop-buckets.bak
  call yarn global list > yarn-global.bak
  call npm -g list > npm-global.bak
  call choco list -l > choco-list-local.bak

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
  xcopy %HOME_PATH%\.continuum\ .continuum\ /e/y/d
  xcopy %HOME_PATH%\.npmrc . /y/d
  xcopy %HOME_PATH%\.yarnrc . /y/d
  xcopy %HOME_PATH%\.condarc . /y/d
  xcopy %HOME_PATH%\.gitconfig . /y/d
  xcopy %HOME_PATH%\.bashrc.bat . /y/d
  xcopy %HOME_PATH%\.wakatime.cfg . /y/d

  pause
goto :eof
