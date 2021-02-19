#!/usr/bin/env bash

echo
echo "MODULE: SAMBA"
echo

PKGS=(
    'samba'
    'smbclient'
    'autofs'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo "COPYING CONF FILE"
sudo cp /home/pawel/arch-scripts/post-install/modules/files/etc-samba-smb.conf /etc/samba/smb.conf

echo "ADDING A USER"
smbpasswd -a pawel

echo
echo "Done!"
echo
