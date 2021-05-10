echo
echo "MODULE: DEV"
echo

# ------------------------------------------------------------------------

PKGS=(
    'clang'
    'cmake'
    'gcc'
    'nodejs'
    'npm'
    'python'
    'python-pip'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo "LINKING CONFIGURATION"
ln -fs /home/pawel/arch-scripts/dotfiles/.noderc ~
ln -fs /home/pawel/arch-scripts/dotfiles/.npmrc ~

# ------------------------------------------------------------------------

echo
echo "Increasing file watcher count"

# This prevents a "too many files" error in Visual Studio Code
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

# ------------------------------------------------------------------------
echo "INSTALLING GLOBAL NPM MODULUES"
ln -fs /home/pawel/arch-scripts/dotfiles/.noderc ~

npm install -g gatsby-cli typescript prettier

# ------------------------------------------------------------------------

echo
echo "Done!"

echo
