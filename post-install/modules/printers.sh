#!/usr/bin/env bash

echo
echo "MODULE: PRINTER DRIVERS"
echo

PKGS=(

    'ghostscript'
    'gsfonts'
    'cups'                  # Open source printer drivers
    'cups-pdf'              # PDF support for cups
    'system-config-printer' # Printer setup  utility
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------
echo
echo "Enabling the cups service daemon so we can print"

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service
# ------------------------------------------------------------------------

echo
echo "Done!"
echo
