#!/usr/bin/env bash

~/arch-scripts/post-install/modules/xorg.sh
~/arch-scripts/post-install/modules/xmonad.sh

~/arch-scripts/post-install/modules/base.sh
~/arch-scripts/post-install/modules/input.sh
~/arch-scripts/post-install/modules/audio.sh

~/arch-scripts/post-install/modules/git.sh
~/arch-scripts/post-install/modules/terminal.sh
~/arch-scripts/post-install/modules/vim.sh

~/arch-scripts/post-install/modules/fonts.sh
~/arch-scripts/post-install/modules/themes.sh

~/arch-scripts/post-install/modules/browsers.sh
~/arch-scripts/post-install/modules/graphics.sh
~/arch-scripts/post-install/modules/productivity.sh
~/arch-scripts/post-install/modules/media.sh

~/arch-scripts/post-install/modules/arbites.sh


#~/arch-scripts/post-install/modules/virtual-box.sh

~/arch-scripts/post-install/modules/aur.sh

ln -s -f ~/arch-scripts/dotfiles/.xsession ~/.xsession
