echo
echo "MODULE: BROWSERS"
echo

# ------------------------------------------------------------------------

PKGS=(
  'chromium'
  'firefox'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
