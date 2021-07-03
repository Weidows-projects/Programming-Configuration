# ======================================================================== #
#                               pwsh配置文件
# ======================================================================== #

# Import-Module oh-my-posh

# PoShFuck
Import-Module PoShFuck

# DockerCompletion
Import-Module D:\Game\Scoop\modules\DockerCompletion

# scoop-completion
Import-Module D:\Game\Scoop\modules\scoop-completion

# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# 设置主题
Set-PoshPrompt -Theme powerlevel10k_classic

# scoop search -> scoop-search
Invoke-Expression (&scoop-search --hook)

# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 清屏
clear
