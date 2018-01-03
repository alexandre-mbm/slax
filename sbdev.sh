#!/bin/bash

# TODO validate pwd HERE

CHDIR="/var/run/initramfs/memory/changes"

find $CHDIR > /tmp/sbdev/changes

cat /etc/sbdev/ex > /tmp/sbdev/ex
cat ~/.sbdev/*/ex >> /tmp/sbdev/ex

function status() {

while read ETC; do
  ETC="$CHDIR$ETC"
  ETC=$(echo "$ETC" | sed 's/\//\\\//g')
  sed -i '/^'"$ETC"'$/d' /tmp/sbdev/changes
done < /tmp/sbdev/ex

cat /tmp/sbdev/changes |
  cut -d"/" -f6- |
  sed "s/^changes//g"

}

case $1 in
  status)
    status
    ;;
  make)
    PKG=$(pwd | sed "s/^.*\/\([^\/]*\)$/\1/")  # TODO refactoring out here
    tar -czf $PKG.tar.gz -T sel
    mkdir -p /tmp/sbdev/sb
    tar -xzf $PKG.tar.gz -C /tmp/sbdev/sb
    mksquashfs /tmp/sbdev/sb $PKG.sb
    ;;
  help|*)
    echo "sbdev status > sel"
    echo "sbdev make"
    ;;
esac
