#!/bin/sh
TERMINAL_EXECUTE="xterm -e"
PASSDIR=~/.password-store
if [ -e $PASSDIR ]; then
	PASS_NAME=`zenity --entry --text "Enter name(e.g. 'google/gmail' without apostrophes)"`
	INSERT_WAY=`zenity --list --text "Please choose way to create your password" --column 'Thing' --hide-header "Generate new password" "Type password"`
	echo $INSERT_WAY
	if [ "$INSERT_WAY" = "Generate new password" ]; then
		PASS_LENGTH=`zenity --scale --text "Choose length" --title "Choose length" --max-value 100 --step 1`
		pass generate "$PASS_NAME" "$PASS_LENGTH"
	else
		`$TERMINAL_EXECUTE pass insert $PASS_NAME`
	fi
else
	zenity --warning --text "PASSW directory wasn't found. You probably need to unlock it."
fi
