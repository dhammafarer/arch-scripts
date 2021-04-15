echo
echo "MODULE: BASE"
echo

# ------------------------------------------------------------------------

PKGS=(
    'atool'
    'curl'
    'feh'
    'hardinfo'
    'htop'
    'ntfs-3g'
    'ntp'
    'paperkey'
    'pass'
    'rsync'
    'signal-desktop'
    'udisk2'
    'udiskie'
    'unrar'
    'unzip'
    'usbutils'
    'wget'
    'zip'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "Enabling Network Time Protocol so clock will be set via the network"

sudo ntpd -qg
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
