
command="sudo apt install"

function __copy_dot_files {
  echo "Copying configs..."
  cp -r dot-root/dot-config/* ~/.config
  cp dot-root/dot-tmux.conf ~/.tmux.conf
  cp dot-root/dot-zshrc ~/.zshrc
}

function __install_shared {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ${command} btop tmux zsh python3 tree neovim
}

function __bs_linux {
  echo "linux..."
  sudo apt install -y git zsh btop guake python3 cpputest pkg-config \
	cmake cmake-curses-gui build-essential valgrind gdb clang-format cbonsai openvpn-systemd-resolved kitty \
	meson picom rofi i3blocks i3lock i3lock-fancy i3pystatus i3status nitrogen
}

function __bs_mac {
  echo "apple..."
  echo "installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install --cask cmake
  command="brew install"
}

# System specific things
if [[ `uname` == "Linux" ]]; then
  __bs_linux
elif [[ `uname` == "Darwin" ]]; then
  __bs_mac
else
    echo '<Warning> : Unknown OS'
fi

__install_shared

__copy_dot_files
