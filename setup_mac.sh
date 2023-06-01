cwd=$(pwd)

echo "Installing brew"

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing goodies"

# Install goodies
brew install git zsh htop python3 neovim tmux tree cpputest

echo "Installing oh my zsh"

# OH MY ZSH!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd $cwd

echo "Installing configs"

# Install configs
/bin/bash/ install.sh

echo "Source"

# Source 
source ~/.zshrc

echo "Complete"
