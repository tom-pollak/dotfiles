cd $(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

for dictionary in `ls`; do
    if [$dictionary -ne "nvim-old"]
	chmod +x $dictionary/install.sh
	$dictionary/install.sh
done
tmux source-file .tmux.conf
