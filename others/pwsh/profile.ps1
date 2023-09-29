# ======================================================================== #
#                               template
# ======================================================================== #
# Alias
# Set-Alias -Name code        -Value code-insiders
# Set-Alias -Name open        -Value explorer
# Set-Alias -Name c           -Value CODEHERE
# Set-Alias -Name o           -Value OPENHERE

# Define
# Function OPENHERE    { Start-Process -FilePath "explorer" -ArgumentList "."}
# Function CODEHERE    { Start-Process -FilePath "code-insiders" -ArgumentList "."}


# ======================================================================== #
#                               pwsh 配置
# ======================================================================== #
# 设置主题 (Get-PoshThemes $env:SCOOP\persist\oh-my-posh\themes) / https://ohmyposh.dev/docs/themes
oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/markbull.omp.json" | Invoke-Expression

# 解决这种报错: WARNING: The prediction 'ListView' is temporarily disabled because the current window size of the console is too small. To use the 'ListView', please make
# https://stackoverflow.com/questions/73864754/why-do-i-get-a-warning-about-listview-in-terminal-powershell-in-vscode
$WarningPreference = "SilentlyContinue"
iex "$(thefuck --alias)"

# 设置终端代理 (终端默认不会走代理)
# $Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="https://127.0.0.1:7890"

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

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

# https://github.com/yuk7/dotfiles/blob/main/_pwsh/profile.ps1
function x{exit}
function c{cls}
function e{echo $args}
function ..{cd ..}
function ...{cd ../..}
function ....{cd ../../..}
function ~{cd $env:USERPROFILE}
function /{cd \}
function \{cd \}
function killer{taskkill /F /im $args}




# ======================================================================== #
#                               scoop
# ======================================================================== #
# Import-Module $env:SCOOP\modules\scoop-completion
Import-Module scoop-completion
Import-Module Terminal-Icons
Import-Module posh-git
Import-Module posh-docker
# Import-Module PowerShellAI
Import-Module yarn-completion
# Import-Module posh-cd
# Import-Module posh-maven
Set-PSReadlineKeyHandler -Key Tab -ScriptBlock { Invoke-GuiCompletion }
Invoke-Expression (&scoop-search-multisource --hook) -ErrorAction SilentlyContinue

function sct{scoop status}
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

function scs{scoop search $args}
function sci{
  Foreach($argv in $args) {
    scoop install $argv
    echo ========================================================================
  }
}
function scc{scoop cat $args}

# -f, --force               Force update even when there isn't a newer version
# -g, --global              Update a globally installed app
# -i, --independent         Don't install dependencies automatically
# -k, --no-cache            Don't use the download cache
# -s, --skip                Skip hash validation (use with caution!)
# -q, --quiet               Hide extraneous messages
# -a, --all                 Update all apps (alternative to '*')



# ======================================================================== #
#                               powerline-go
# ======================================================================== #
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
                                # clear
# ======================================================================== #
