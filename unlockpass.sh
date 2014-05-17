#!/bin/sh
cd ~
PASSDIR=".password-store"
LOCKED_FILE=".passwd_locked.tar.gz"
UNLOCKED_FILE=".passwd_unlocked.tar.gz"
if [ -e $PASSDIR ]; then
	zenity --warning --text "Password database already unlocked!"
else
	PASSWORD=`zenity --password --title="Enter your password to unlock pass."`
	openssl enc -aes-256-cbc -k "$PASSWORD" -d -in "$LOCKED_FILE" -out "$UNLOCKED_FILE"
	mkdir $PASSDIR
	tar -xf $UNLOCKED_FILE
	rm $LOCKED_FILE
	rm $UNLOCKED_FILE
	zenity --notification --timeout 1 --text "Password Database Unlocked."
fi
