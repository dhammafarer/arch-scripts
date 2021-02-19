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
    'kupfer'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# -----------------------------------------------------------------------

echo
echo "LINKING DOTFILES"

ln -fs ~/arch-scripts/dotfiles/.goldendict/config ~/.goldendict/config/

# ------------------------------------------------------------------------

echo
echo "Done!"

echo
