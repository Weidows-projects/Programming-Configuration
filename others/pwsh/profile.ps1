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
#                               pwsh配置
# ======================================================================== #
# 设置主题 (Get-PoshThemes $env:SCOOP\persist\oh-my-posh\themes) / https://ohmyposh.dev/docs/themes
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/powerlevel10k_rainbow.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/iterm2.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/night-owl.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/powerlevel10k_classic.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/poshmon.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/slimfat.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/takuya.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/thecyberden.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:SCOOP/persist/oh-my-posh/themes/wholespace.omp.json" | Invoke-Expression

# Import-Module PoShFuck

# 设置终端代理 (终端默认不会走代理)
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

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
function utils{D:\Repos\Weidows-projects\Keeper\utils.bat}




# ======================================================================== #
#                               scoop
# ======================================================================== #
# scoop-completion
Invoke-Expression (&scoop-search-multisource --hook) -ErrorAction SilentlyContinue

function sct{scoop status}
function scl{scoop list}
function sccl{
  Foreach($argv in $args) {
    scoop cleanup $argv
    echo ========================================================================
  }
}
function scu{
  Foreach($argv in $args) {
    scoop update $argv
    scoop cleanup $argv
    echo ========================================================================
  }
}
function scun{scoop uninstall $args}
function scs{scoop search $args}
function sci{
  Foreach($argv in $args) {
    scoop install $argv
    echo ========================================================================
  }
}
function scin{scoop info $args}

Import-Module $env:SCOOP\modules\scoop-completion
# terminal-icons
Import-Module $env:SCOOP\modules\Terminal-Icons
# git-tab补全
Import-Module $env:SCOOP\modules\posh-git
# Import-Module $env:SCOOP\modules\posh-docker


# 清屏
# clear
