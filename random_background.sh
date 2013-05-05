gsettings set org.gnome.desktop.background picture-uri file://`find ~/Pictures/backgrounds/ -type f | shuf -n1`
gsettings set org.gnome.desktop.background picture-options scaled
