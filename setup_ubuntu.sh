cwd=$(pwd)

echo "Installing goodies"

# Install goodies
sudo apt install -y git zsh htop python3 neovim tmux tree cpputest pkg-config cmake cmake-curses-gui 

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
