# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew apps

# zsh theme
brew install powerlevel10k
# zsh syntax highlighting
brew install zsh-syntax-highlighting
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tools
brew install zoxide
brew install lazygit
brew install bat
brew install fzf
brew install eza
brew install tlrc # tldr

# environment
brew install mise

#terminal
brew install --cask wezterm

# llm
brew install llm

# zummoner (https://github.com/day50-dev/Zummoner)
git clone https://github.com/day50-dev/zummoner.git $HOME/.local/zummoner
echo source \$HOME/.local/zummoner/zummoner.zsh >> $HOME/.zshrc
source $HOME/.zshrc
