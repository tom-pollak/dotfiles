sudo apt install -y fd-find build-essential curl file git bat neovim-nightly tmux

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install fzf && $(brew --prefix)/opt/fzf/install
