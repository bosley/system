sudo apt-get install ninja-build gettext cmake unzip curl python3 python3-pip ripgrep npm python3.10-venv -y

cd /tmp

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUILD_TYPE=Release
sudo make install

