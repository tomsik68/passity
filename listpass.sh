#!/bin/sh
PASSITY_DIR=`dirname $(readlink -f $0)`
SELECTED=`sh $PASSITY_DIR/selectpass.sh`
if [ $SELECTED != "" ]; then
  pass show -c $SELECTED
  zenity --notification --text "Password $SELECTED is now copied for 45 seconds." --timeout 35
fi
