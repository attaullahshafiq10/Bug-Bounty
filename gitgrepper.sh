#Simple Bash script to find interesting data in GIT logs
#!/bin/bash

echo "*** Running..."

keywords=(
	"password"
	"key"
	"passwd"
	"secret"
)

echo
echo "Developers"
echo "=========="
if [[ $1 != "" ]]; then
	git log --reflog --pretty="format:%aE" | sort | uniq | grep "$1"
fi

echo
echo "Keywords"
echo "========"
for word in ${keywords[@]}; do
	git log --reflog --pretty="format:- (%H) %b" | grep --color "$word"
done

echo
echo "*** Done."
