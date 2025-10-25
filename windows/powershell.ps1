mise activate pwsh | Out-String | Invoke-Expression

Import-Module posh-git
oh-my-posh init pwsh --config ~/theme.omp.json | Invoke-Expression