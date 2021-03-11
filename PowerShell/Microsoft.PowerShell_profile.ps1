# Import-Module oh-my-posh

# PoShFuck
Import-Module PoShFuck

# scoop-completion
Import-Module D:\Game\Scoop\modules\scoop-completion

# Tab自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# 设置主题
Set-PoshPrompt -Theme powerlevel10k_classic

# 清屏
clear
