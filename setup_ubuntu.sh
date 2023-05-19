cwd=$(pwd)

echo "Installing goodies"

# Install goodies
sudo apt install -y git zsh btop guake python3 neovim tmux tree cpputest pkg-config \
	cmake cmake-curses-gui build-essential valgrind gdb clang-format cbonsai openvpn-systemd-resolved kitty \
	meson picom rofi i3blocks i3lock i3lock-fancy i3pystatus i3status nitrogen

# Note - need to install i3-wm 4.22 for configs to work

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
