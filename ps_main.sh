#!/bin/sh
# Make sure PASSITY_DIR is set right, so this script will have access to all its parts
PASSITY_DIR=`dirname $(readlink -f $0)`
LOCKED_FILE=~/.passwd_locked.tar.gz
PASSDIR=~/.password-store
LIST_ACTIONS=""
if [ -e $LOCKED_FILE ]; then
  LIST_ACTIONS="Unlock Password Database"
fi
if [ -e $PASSDIR ]; then
  LIST_ACTIONS="Lock Password Database"
fi
echo $LIST_OPTIONS
ACTION=`zenity --list --hide-header --column This --text "Welcome to passity! Please choose an action" "$LIST_ACTIONS"`
cd $PASSITY_DIR
case $ACTION in
	"Lock Password Database" )
		sh lockpass.sh;;
	"Unlock Password Database" )
		sh unlockpass.sh;;
esac
