#!/usr/bin/env bash

echo
echo "MODULE: ARBITES"
echo

# ------------------------------------------------------------------------

PKGS=(
    'gtk-sharp-2'
    'java-rxtx'
    'mono'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "ADDING USER TO GROUPS"

sudo usermod -a -G uucp pawel
sudo usermod -a -G lock pawel

# ------------------------------------------------------------------------
echo "DOWNLOADING ARBITES"

wget "https://github.com/blahlicus/arbites-family/releases/download/2-3-5/Arbites.Innova.2-3-5.Gtk2.zip" -O temp.zip
unzip temp.zip -d ~/Downloads
rm temp.zip
ln -fs ~/Nextcloud/AppData/arbites/pawel-DTM2-swapped-tab.arb2dtm ~/Downloads/'Arbites Innova 2-3-5 Gtk2'/

# ------------------------------------------------------------------------

echo
echo "Done!"

echo
