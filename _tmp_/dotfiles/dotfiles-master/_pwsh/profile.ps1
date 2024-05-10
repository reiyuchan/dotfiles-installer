#colors
$Host.PrivateData.ErrorBackgroundColor = [console]::BackgroundColor

#start location
if($pwd.Path -eq "C:\Windows\System32") {Set-Location $env:USERPROFILE}

#window title and prompt
function Prompt{$path = $pwd.Path.Replace($HOME,'~'); $host.ui.RawUI.WindowTitle = "$path"; $branch = git branch --show-current; if($branch) {$branch = " | `e[31m$branch`e[0m"}; return "[$path$branch]>"}

#aliases
function c{clear}
function x{exit}
function e{echo $args}
function md{mkdir $args}
function ll{ls -la $args}

#Navigation macros
function ..{cd ..}
function ...{cd ../..}
function ....{cd ../../..}
function .....{cd ../../../..}
function ~{cd $env:USERPROFILE}

function arch{param([string]$arg) if($arg -eq "run") {wsl ~ -d Arch} else {echo "Did you mean arch run?"}}
function ubuntu{param([string]$arg) if($arg -eq "run") {wsl ~ -d Ubuntu-22.04} else {echo "Did you mean ubuntu run?"}}
