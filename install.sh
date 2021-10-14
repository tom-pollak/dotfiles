cd $(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

for dictionary in `ls`; do
    if [$dictionary -ne "nvim-old"]
	chmod +x $dictionary/install.sh
	$dictionary/install.sh
    fi
done
tmux source-file .tmux.conf
