mise activate pwsh | Out-String | Invoke-Expression

oh-my-posh init pwsh --config ~/theme.omp.json | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Location C:\code

# Helper: Test if a command exists in PATH
function Test-Command {
    param(
        [string]$Name,
        [string]$InstallCommand = $null
    )
    if ($null -ne (Get-Command $Name -ErrorAction SilentlyContinue)) {
        return $true
    } else {
        Write-Host "$Name not found in PATH. Install $Name with '$InstallCommand'"
        return $false
    }
}

# Alias to open lazygit quickly
if (Test-Command 'lazygit' 'winget install JesseDuffield.lazygit') {
    Set-Alias lg lazygit
}

# 'la' - list using eza with preferred flags
if (Test-Command 'eza' 'winget install eza-community.eza') {
    function la {
        param(
            [Parameter(ValueFromRemainingArguments=$true)]
            $RemainingArgs
        )
        & eza --group-directories-first -a --icons --hyperlink $RemainingArgs
    }
}

# 'prv' - fuzzy-select with preview using bat
if (Test-Command 'fzf' 'winget install junegunn.fzf') {
    function prv {
        param(
            [Parameter(ValueFromRemainingArguments=$true)]
            $RemainingArgs
        )
        & fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' @RemainingArgs
    }
}