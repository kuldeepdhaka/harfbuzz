#/bin/sh

# Author: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>

SRC_DIR="$PWD/../src"
DEST_DIR="$PWD/include"

for SRC in $SRC_DIR/*.rl
do
	NAME="$(basename $SRC .rl)" #extract "ding" from "/bla/bla/ding.rl"
	DEST="$DEST_DIR/$NAME.hh"
	ragel -e -F1 -o "$DEST" "$SRC"
done
