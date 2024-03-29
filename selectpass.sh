#!/bin/sh
PASSITY_DIR=`dirname $(readlink -f $0)`
PASSDIR=~/.password-store
if [ -e $PASSDIR ]; then
	cd $PASSDIR
	PASSWORDS=`find -name *.gpg -follow -type f | sed -e 's:.gpg::g' -e 's:\./::g'`
	TOCOPY=`zenity --list --hide-header --column Name --text "Select password to copy it" $PASSWORDS`
	if [ "$TOCOPY" != "" ]; then
		echo $TOCOPY
	fi
fi
