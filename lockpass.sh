#!/bin/sh
cd ~
PASSDIR=".password-store"
LOCKED_FILE=".passwd_locked.tar.gz"
if [ -e $LOCKED_FILE ]; then
	zenity --warning --text "Password Database is already locked!"
else
	PASSWORD=`zenity --password --title="Enter your password to lock pass."`
	tar cz .password-store | openssl enc -aes-256-cbc -e -k "$PASSWORD" > "$LOCKED_FILE"
	rm -rf $PASSDIR
	zenity --notification --timeout 1 --text "Password Database Locked."
fi
