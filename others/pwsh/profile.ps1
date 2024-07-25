# ======================================================================== #
#                             alias & function
# ======================================================================== #
# Alias
# Set-Alias -Name code        -Value code-insiders
# Set-Alias -Name open        -Value explorer
# Set-Alias -Name c           -Value CODEHERE
# Set-Alias -Name o           -Value OPENHERE
Set-Alias -N l -V Get-ChildItem
Set-Alias -N c -V cls
# Set-Alias -N nsv -V New-Service
# Set-Alias -N rssv -V Restart-Service
# Set-Alias -N rdns -V Resolve-DnsName
# Set-Alias -N gnc -V Get-NetTCPConnection
# Set-Alias -N gvm -V Get-VM
# Set-Alias -N cnvm -V Connnect-VM
# function Connect-VM { vmconnect localhost $args }
# Set-Alias -N open -V Invoke-Item

# Define
# Function OPENHERE    { Start-Process -FilePath "explorer" -ArgumentList "."}
# Function CODEHERE    { Start-Process -FilePath "code-insiders" -ArgumentList "."}
# https://github.com/yuk7/dotfiles/blob/main/_pwsh/profile.ps1
function x{exit}
function e{echo $args}
function ..{cd ..}
function ...{cd ../..}
function ~{cd $env:USERPROFILE}
function /{cd \}
function \{cd \}
function killer{taskkill /F /im $args}

# scoop
# -f, --force               Force update even when there isn't a newer version
# -g, --global              Update a globally installed app
# -i, --independent         Don't install dependencies automatically
# -k, --no-cache            Don't use the download cache
# -s, --skip                Skip hash validation (use with caution!)
# -q, --quiet               Hide extraneous messages
# -a, --all                 Update all apps (alternative to '*')
function scs{scoop search $args}
function sct{scoop update && scoop status}
function scu{
  Foreach($argv in $args) {
    scoop update $argv -s
    echo ========================================================================

    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process
    # $sb = &{ param($argv)
    #   scoop update $argv -s
    # } -argv $argv

    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/start-job
    # Start-Job -Name scu -Type BackgroundJob -ScriptBlock $sb

    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-job
    # Get-Job
  }
}

function ya {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -Path $cwd
    }
    Remove-Item -Path $tmp
}

# ======================================================================== #
#                                  pwsh
# ======================================================================== #
# https://lamirs.vercel.app/index-powershell/

# 设置主题 | https://ohmyposh.dev/docs/themes
# 网不好时可能不会生效
# oh-my-posh init pwsh --config "https://fastly.jsdelivr.net/gh/Weidows-projects/Programming-Configuration@master/others/pwsh/weidows.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "D:/Repos/Weidows-projects/Keeper/Programming-Configuration/others/pwsh/weidows.omp.json" | Invoke-Expression
$env:POSH_GIT_ENABLED = $true
Enable-PoshTooltips

# Invoke-Expression (&starship init powershell)

# 解决这种报错: WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. To use the 'ListView', please make
# https://stackoverflow.com/questions/73864754/why-do-i-get-a-warning-about-listview-in-terminal-powershell-in-vscode
$WarningPreference = "SilentlyContinue"
# iex "$(thefuck --alias)"

# 设置终端代理 (终端默认不会走代理)
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Tab自动补全
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key Tab -ScriptBlock { Invoke-GuiCompletion }

# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 設定按下 Ctrl+d 可以退出 PowerShell 執行環境
# Set-PSReadlineKeyHandler -Chord ctrl+d -Function ViExit
# 設定按下 Ctrl+w 可以刪除一個單字
# Set-PSReadlineKeyHandler -Chord ctrl+w -Function BackwardDeleteWord
# 設定按下 Ctrl+e 可以移動游標到最後面(End)
# Set-PSReadlineKeyHandler -Chord ctrl+e -Function EndOfLine
# 設定按下 Ctrl+a 可以移動游標到最前面(Begin)
# Set-PSReadlineKeyHandler -Chord ctrl+a -Function BeginningOfLine

# Load powerline-go prompt: https://github.com/justjanne/powerline-go
# function global:prompt {
#     $pwd = $ExecutionContext.SessionState.Path.CurrentLocation
#     $startInfo = New-Object System.Diagnostics.ProcessStartInfo
#     $startInfo.FileName = "powerline-go"
#     $startInfo.Arguments = "-shell bare -theme solarized-dark16"
#     $startInfo.Environment["TERM"] = "xterm-256color"
#     $startInfo.CreateNoWindow = $true
#     $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
#     $startInfo.RedirectStandardOutput = $true
#     $startInfo.UseShellExecute = $false
#     $startInfo.WorkingDirectory = $pwd
#     $process = New-Object System.Diagnostics.Process
#     $process.StartInfo = $startInfo
#     $process.Start() | Out-Null
#     $standardOut = $process.StandardOutput.ReadToEnd()
#     $process.WaitForExit()
#     $standardOut
# }

# ======================================================================== #
#                                 scoop
# ======================================================================== #
Import-Module scoop-ext
Import-Module scoop-completion
Invoke-Expression (&scoop-search-multisource --hook)
# Invoke-Expression (&scoop-search --hook)

# Import-Module Microsoft.WinGet.Client
Import-Module posh-git
# Import-Module bottom/_btm.ps1
# Import-Module Terminal-Icons
# Import-Module PowerShellAI
# Import-Module posh-docker
# Import-Module yarn-completion
# Import-Module $env:SCOOP\apps\vcpkg\current\scripts\posh-vcpkg
# Import-Module posh-maven

# ======================================================================== #
#                              completion
# ======================================================================== #
# https://gist.github.com/kid1412621/e9bafc5362acbded0f6b726402c40d62#file-microsoft-powershell_profile-ps1
# Github CLI
Invoke-Expression -Command $(gh completion -s powershell | Out-String)
Invoke-Expression -Command $(fav completion powershell | Out-String)
# tdl completion powershell | Out-String | Invoke-Expression
Invoke-Expression -Command $(tdl completion powershell | Out-String)

# Winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
}

# Chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# AWS
Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
                $env:COMP_LINE=$wordToComplete
                $env:COMP_POINT=$cursorPosition
                aws_completer.exe | ForEach-Object {
                        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
                }
        Remove-Item Env:\COMP_LINE
                Remove-Item Env:\COMP_POINT
}

# ======================================================================== #
                                # clear
# ======================================================================== #
