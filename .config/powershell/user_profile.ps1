# Pronmp
# Import-Module posh-git
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -HistoryNoDuplicates


# Themes
# onehalf.minimal, peru, uew, xtoys
# festivetech, powerlevel10k_rainbow, slimfat, clean-detailed, honukai
oh-my-posh init pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes/uew.omp.json | Invoke-Expression

# echo 'test'

#Alias
Set-Alias vim nvim


# open dir
function e() { start .}
function edl() { cd ~/Downloads }
function edk() { cd ~/Desktop }
function ew() { cd /Users/Public/_WorkingSpace }
