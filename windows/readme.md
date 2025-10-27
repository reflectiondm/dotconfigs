# Terminal setup

## Powershell version

Make sure to install powershell 7 to have `pwsh` as a command. It is needed for `mise` among other things.

### Setup ohmyposh
https://ohmyposh.dev/docs/installation/windows

### Powershell config location

```shell
code $PROFILE
```

### Tools

#### Git 

**Lazygit:**

```shell
winget install JesseDuffield.lazygit
```

**Git Aliases:** 
```shell
Install-Module git-aliases -Scope CurrentUser -AllowClobber
```
**Powershell Git**

UPD: not recommend as it adds ~200ms to pwsh startup time
```shell
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
```

#### Files

eza

```shell
winget install eza-community.eza
```

fuzzy finder
```shell
winget install junegunn.fzf
```

zoxide
```shell
winget install ajeetdsouza.zoxide
```
(add `Invoke-Expression (& { (zoxide init powershell | Out-String) })` to your pwsh profile)

bat
```shell
winget install sharkdp.bat
```

tldr
```shell
winget install tldr-pages.tlrc
```