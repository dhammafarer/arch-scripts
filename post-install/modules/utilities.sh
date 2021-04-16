echo
echo "MODULE: UTILITIES"
echo

# ------------------------------------------------------------------------

PKGS=(
    'android-tools'
    'goldendict'
    'mupdf'
    'pwgen'
    'translate-shell'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
