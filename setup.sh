
command="sudo apt install"

function __copy_dot_files {
  echo "Copying configs..."
  cp -r dot-root/dot-config/* ~/.config
  cp dot-root/dot-tmux.conf ~/.tmux.conf
  cp dot-root/dot-zshrc ~/.zshrc
}

function __neovim {
  cd /tmp
  git clone https://github.com/neovim/neovim.git
  cd neovim
  git checkout release-0.9
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  
  echo "Now run :PlugUpdate in nvim"
}

function __install_shared {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ${command} btop tmux zsh python3 tree neovim
}

function __bs_linux {
  echo "linux..."
  sudo apt install -y git zsh btop guake python3 cpputest pkg-config \
	cmake cmake-curses-gui build-essential valgrind gdb clang-format cbonsai openvpn-systemd-resolved kitty \
	meson picom rofi i3blocks i3lock i3lock-fancy i3pystatus i3status nitrogen \
  ninja-build gettext unzip curl python3-pip ripgrep npm python3.10-venv -y
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

__neovim

__copy_dot_files
