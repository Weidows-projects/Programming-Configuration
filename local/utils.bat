@echo off
@REM 执行时涉及到中文,cmd 默认按照 GBK/GB2312 解析(VScode强行按UTF-8),所以不开启的话会出现:显示没错但存储时乱码
chcp 65001

@REM ==================================================================
@REM main入口
@REM ==================================================================
:circle
  echo =============================================================================
  echo "exit(0) | backup(1) | boot-starter(2) | devenv-starter(3) | bilibili-helper(4)"
  echo "dir(5)"

  @REM 注意下面不能写成这样:  num = Please...
  set /p num=Please input function num:
  echo =============================================================================

  if %num%==0 exit
  if %num%==1 call :backup
  if %num%==2 call :boot-starter
  if %num%==3 call :devenv-starter
  if %num%==4 call :bilibili-helper
  if %num%==5 call :dir

  pause
  cls
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
  start d:\Software\MyDock\Dock_64.exe

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

  @REM 备份lists
  mkdir %BACKUP_DIR%\lists & cd %BACKUP_DIR%\lists
  call scoop list > scoop\scoop-apps.bak
  call scoop bucket list > scoop\scoop-buckets.bak
  call choco list -l > scoop\choco-list-local.bak
  call npm -g list > node\npm-global.bak
  call yarn global list > node\yarn-global.bak
  call dir D:\Musics\Local > dir\dir-music.bak
  call dir /b D:\Software > dir\dir-software.bak
  call dir /b E:\mystream > dir\dir-mystream.bak
  call conda list > conda-list.bak
  @REM 重装系统/重装wallpaper engine,所有壁纸会木大,所以备份
  xcopy D:\Game\Scoop\persist\steam\steamapps\common\wallpaper_engine\config.json .\wallpaper_engine\ /y/d
  call gh repo list > github\repo-list.bak

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
  xcopy %HOME_PATH%\.minttyrc . /y/d
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



@REM ==================================================================
@REM Bilibili-helper
@REM ==================================================================
:bilibili-helper
  d:&& cd D:\Game\Github\Programming-Configuration\backup\BILIBILI-HELPER*\
  ren .\BILIBILI-HELPER*.jar BILIBILI-HELPER.jar
  java -jar BILIBILI-HELPER.jar
goto :eof



@REM ==================================================================
@REM 批量获取文件名
@REM ==================================================================
:dir
  set /p path=Please input the path (blank for current path):
  DIR /B %path%
goto :eof
