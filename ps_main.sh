#!/bin/sh
ACTION=`zenity --list --text "What do you want to do?" --hide-header --column "This" "Lock Password Database" "Unlock Password Database" "Insert Password" "Edit Password" "See your passwords"`
case $ACTION in
	"Lock Password Database" )
		sh lockpass.sh;;
	"Unlock Password Database" )
		sh unlockpass.sh;;
	"Insert Password" )
		sh insertpass.sh;;
	"Edit Password" )
		sh editpass.sh;;
	"See your passwords" )
		sh passlist.sh;;
	* )
		zenity --warning --text "Unknown answer";;
esac
