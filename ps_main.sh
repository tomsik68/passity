#!/bin/sh
# Make sure PASSITY_DIR is set right, so this script will have access to all its parts
PASSITY_DIR=`dirname $(readlink -f $0)`
LOCKED_FILE=~/.passwd_locked.tar.gz
PASSDIR=~/.password-store
ACTION=""
if [ -e $LOCKED_FILE ]; then
  ACTION=`zenity --list --hide-header --column This --text "Welcome to passity! Please choose an action" "Unlock Password Database"`
fi
if [ -e $PASSDIR ]; then
  ACTION=`zenity --list --hide-header --column This --text "Welcome to passity! Please choose an action" "Lock Password Database" "List your passwords"`
fi
cd $PASSITY_DIR
case $ACTION in
	"Lock Password Database" )
		sh lockpass.sh;;
	"Unlock Password Database" )
		sh unlockpass.sh;;
	"List your passwords" )
		sh listpass.sh;;
esac
