echo 'Loading powershell profile'

# Pronmp
Import-Module posh-git
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -HistoryNoDuplicates

# fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Themes
# onehalf.minimal, peru, uew, xtoys, bubblesextra
# festivetech, powerlevel10k_rainbow, slimfat, clean-detailed, honukai
oh-my-posh init pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes/zash.omp.json | Invoke-Expression

#Alias
Set-Alias vim nvim


# utilities
function e() { start .}
function edw() { cd ~/Downloads }
function eds() { cd ~/Desktop }
function edc() { cd ~/Documents }
function ew() { cd /Users/Public/_WorkingSpace }
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function lg() { lazygit.exe }
