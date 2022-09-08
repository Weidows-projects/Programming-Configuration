# ======================================================================== #
#                               pwsh配置文件
# ======================================================================== #

# PoShFuck
Import-Module PoShFuck

# git-tab补全
Import-Module posh-git

# terminal-icons
Import-Module terminal-icons

# 设置主题
# Set-PoshPrompt -Theme powerlevel10k_rainbow
# Set-PoshPrompt -Theme blueish
Set-PoshPrompt -Theme atomic

# scoop-completion
Import-Module $env:SCOOP\apps\scoop\current\supporting\completion\Scoop-Completion.psd1 -ErrorAction SilentlyContinue

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 设置终端代理 (终端默认不会走代理)
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"

# 清屏
# clear
