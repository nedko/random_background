#!/bin/sh

#set -x

rotation=`xrandr --verbose | grep LVDS1 | sed 's/.*) \([a-z]*\) (.*/\1/'`
if test "$rotation" == "normal" -o "$rotation" == "inverted"
then
  orientation=landscape
else
  orientation=portrait
fi

current_background=`gsettings get org.gnome.desktop.background picture-uri|sed "s@^'file://\\(.*\\)'\\$@\\1@"`

backgrounds1=`find ~/Pictures/backgrounds/ -maxdepth 1 -type f`
backgrounds2=`find ~/Pictures/backgrounds/${orientation} -maxdepth 1 -type f`
backgrounds="${backgrounds1}
${backgrounds2}"
if test -z "${backgrounds}"; then exit 0; fi

background=`echo "${backgrounds}" | shuf -n1`

if test "${background}"
then
  gsettings set org.gnome.desktop.background picture-uri file://${background}
  gsettings set org.gnome.desktop.background picture-options scaled
fi
