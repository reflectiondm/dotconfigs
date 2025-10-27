mise activate pwsh | Out-String | Invoke-Expression

oh-my-posh init pwsh --config ~/theme.omp.json | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Location C:\code

# Alias to open lazygit quickly
if (Get-Command lazygit -ErrorAction SilentlyContinue) {
    Set-Alias lg lazygit
} else {
    function lg { Write-Host 'lazygit not found in PATH' }
}

# 'la' - list using eza with preferred flags
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function la {
        param(
            [Parameter(ValueFromRemainingArguments=$true)]
            $RemainingArgs
        )
        # Run eza with the requested options and forward any additional args
        & eza --group-directories-first -a --icons --hyperlink $RemainingArgs
    }
} else {
    function la { Write-Host 'eza not found in PATH. Install eza (for example via scoop or winget) or add it to PATH.' }
}

# 'prv' - fuzzy-select with preview using bat
if (Get-Command fzf -ErrorAction SilentlyContinue) {
    function prv {
        param(
            [Parameter(ValueFromRemainingArguments=$true)]
            $RemainingArgs
        )
        # Forward any additional args to fzf. The preview uses bat to show up to 500 lines.
        & fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' @RemainingArgs
    }
} else {
    function prv { Write-Host 'fzf not found in PATH. Install fzf (for example via scoop or winget) or add it to PATH.' }
}