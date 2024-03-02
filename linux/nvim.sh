sudo apt install ninja-build gettext cmake unzip curl python3 python3-pip ripgrep npm python3.10-venv -y

cd /tmp

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUILD_TYPE=Release
sudo make install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Now run :PlugUpdate in nvim"
