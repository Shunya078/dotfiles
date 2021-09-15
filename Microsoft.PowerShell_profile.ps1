Import-Module posh-git
Import-Module oh-my-posh
Import-Module z

Set-PoshPrompt -Theme iterm2

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

set-alias vi 'C:\Program Files (x86)\Vim\Vim82\vim.exe'
set-alias vim 'C:\Program Files (x86)\Vim\Vim82\vim.exe'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

$Env:Path += ";C:\Program Files\Git\bin\"
$Env:HOME = "C:\Users\riclabo"

Set-Alias -Name touch -Value New-Item

Set-Alias touch New-Item

function el() {explorer .}

function pwdc() {Set-Clipboard "$pwd"}

# fzf
$env:FZF_DEFAULT_OPTS="--reverse --border --height 50%"
$env:FZF_DEFAULT_COMMAND='fd -HL --exclude ".git" .'
function _fzf_compgen_path() {
  fd -HL --exclude ".git" . "$1"
}

function _fzf_compgen_dir() {
  fd --type d -HL --exclude ".git" . "$1"
}

# Command
function cdr() { fd -H -t d -E .git -E node_modules | fzf | cd }
function cdz() { z -l | oss | select -skip 3 | % { $_ -split " +" } | sls -raw '^[a-zA-Z].+' | fzf | cd }
function vimr() { fd -H -E .git -E node_modules | fzf | % { vim $_ } }

