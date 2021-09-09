sudo apt install -y fd-find build-essential curl file git bat tmux python3-neovim python-neovim fuse zsh python3 exa python3-pip ncdu httpie gdb nodejs npm zsh ripgrep ctop htop taskwarrior lnav httpie glances tldr xcape  i3-wm dunst i3lock i3status suckless-tools compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior rofi pavucontrol nitrogen 
sudo curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage > /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install fzf starship pipx efm-langserver && $(brew --prefix)/opt/fzf/install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pipx install neovim pynvim jedi jedi-language-server black numpy pandas matplotlib 'python-lsp-server[all]'

mkdir $HOME/tools
git clone https://github.com/pwndbg/pwndbg $HOME/tools
chmod +x $HOME/tools/setup.sh && $HOME/tools/setup.sh
npm install -g tldr
