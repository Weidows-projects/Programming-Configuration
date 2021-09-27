@echo off
@REM ==================================================================
@REM main入口
@REM ==================================================================
:circle
  echo ==================================================================
  echo "backup(1) | boot-starter(2) | devenv-starter(3) | exit(4)"
  @REM 注意下面不能写成这样:  num = Please...
  set /p num=Please input function num:

  if %num%==1 (
    echo "==============================backup===================================="
    call :backup
  )
  if %num%==2 (
    echo "==============================boot-starter===================================="
    call :boot-starter
  )
  if %num%==3 (
    echo "==============================devenv-starter===================================="
    call :devenv-starter
  )
  if %num%==4 (
    exit
  )

  @REM 自循环
  call :circle
goto :eof



@REM ==================================================================
@REM 开机启动软件
@REM ==================================================================
:boot-starter
  @REM 雨滴桌面
  start /b Rainmeter

  @REM 鼠标手势
  start /b MouseInc

  @REM Dock
  start d:\Software\Beautify\MyDock\Dock_64.exe

  @REM aria2
  cscript //Nologo "d:\Game\Github\Programming-Configuration\local\start.vbs"

  @REM 酷狗
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
  xcopy D:\Game\Github\C++\.vscode .vscode\ /e/y/d
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
goto :eof



@REM ==================================================================
@REM 启动dev环境
@REM ==================================================================
:devenv-starter
  @REM 文件管理
  start /b xyplorerfree

  @REM IDE
  start /b code
  start /b idea64.exe
  @REM start /b pycharm64.exe

  @REM 浏览器
  start /b microsoft-edge:

  @REM 通讯
  start /b D:\Game\Scoop\apps\TIM\current\Bin\TIM.exe
  start /b D:\Game\Scoop\apps\wechat\current\WeChat.exe
  @REM start /b D:\Game\Scoop\apps\dingtalk\current\DingtalkLauncher.exe

  @REM 虚拟机
  start /b vmware
goto :eof
