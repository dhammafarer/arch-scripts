#!/usr/bin/env bash

echo
echo "MODULE: ARCO-DOTFILES"
echo

# ------------------------------------------------------------------------
# Fonts
sudo ln -fs /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -fs /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -fs /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo cp ~/arch-scripts/post-install/modules/files/etc-fonts-local.conf /etc/fonts/local.conf
sudo vim /etc/profile.d/freetype2.sh

# This prevents a "too many files"
echo
echo "Increasing file watcher count"
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
