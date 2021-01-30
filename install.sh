for dictionary in `ls`; do
	echo "Installing $dictionary"
	chmod +x $dictionary/install.sh
	$dictionary/install.sh
done
