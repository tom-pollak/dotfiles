cd $(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

for dictionary in `ls`; do
	chmod +x $dictionary/install.sh
	$dictionary/install.sh
done
tmux source-file .tmux.conf
