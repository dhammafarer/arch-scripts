echo
echo "MODULE: PRODUCTIVITY"
echo

# ------------------------------------------------------------------------

PKGS=(

    'ghostscript'
    'gsfonts'
    'goldendict'
    'mupdf'
    'translate-shell'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# -----------------------------------------------------------------------

echo
echo "Copy Goldendict Config"

cp -r ~/Nextcloud/AppData/.goldendict ~

# ------------------------------------------------------------------------

echo
echo "Done!"

echo
