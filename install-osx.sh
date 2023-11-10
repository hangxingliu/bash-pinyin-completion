#!/usr/bin/env bash

throw() { echo "$1" >&2; exit 1; }
execute() { echo "$ $*" >&2; "$@" || throw "failed to execute '$1'"; }

test ! -e "/usr/local/etc/bash_completion.d" && throw 'install bash-completion first!';
test ! -d "/usr/local/bin" && throw '/usr/local/bin is not a directory! please check and create it before installing'

execute cp pinyin_completion /usr/local/etc/bash_completion.d/;

if test -w /usr/local/bin; then
	execute cp pinyinmatch /usr/local/bin;
else
	execute sudo cp pinyinmatch /usr/local/bin;
fi
