#!/usr/bin/env bash

echo
echo "MODULE: TERMINAL"
echo

# ------------------------------------------------------------------------

PKGS=(

    'gtk2'
    'gtk3'
    'arc-icon-theme'
    'arc-gtk-theme'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "LINKING DOTFILES"
ln -fs /home/pawel/arch-scripts/dotfiles/.gtkrc-2.0 ~
ln -fs /home/pawel/arch-scripts/dotfiles/.config/gtk-3.0 ~/.config/
ln -fs /home/pawel/arch-scripts/post-install/modules/files/.background-image ~

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
