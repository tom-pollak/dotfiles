sudo apt install -y fd-find build-essential curl file git bat tmux python3-neovim python-neovim fuse zsh python3 exa python3-pip
sudo curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install fzf starship && $(brew --prefix)/opt/fzf/install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt install -y nodejs npm
pip3 install neovim jedi-language-server
