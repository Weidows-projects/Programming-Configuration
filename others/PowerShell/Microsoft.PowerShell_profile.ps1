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
Set-PoshPrompt -Theme powerlevel10k_rainbow

# scoop-completion
Import-Module D:\Game\Scoop\modules\scoop-completion
# scoop search -> scoop-search
Invoke-Expression (&scoop-search --hook)

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 清屏
clear
