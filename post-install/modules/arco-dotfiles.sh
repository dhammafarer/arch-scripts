
echo
echo "MODULE: ARCO-DOTFILES"
echo

# ------------------------------------------------------------------------
# Cleanup
# ------------------------------------------------------------------------
mv ~/.xmonad ~/.xmonad-arco

rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.background-image > /dev/null 2>&1

# ------------------------------------------------------------------------
FILES=(
    ~/arch-scripts/dotfiles/.aliases
    ~/arch-scripts/dotfiles/.bashrc
    ~/arch-scripts/dotfiles/.dir_colors
    ~/arch-scripts/dotfiles/.gitconfig
    ~/arch-scripts/dotfiles/.gitconfig
    ~/arch-scripts/dotfiles/.noderc
    ~/arch-scripts/dotfiles/.npmrc
    ~/arch-scripts/dotfiles/.shrc
    ~/arch-scripts/dotfiles/.vimrc
    ~/arch-scripts/dotfiles/.xmonad
    ~/arch-scripts/dotfiles/.zshrc
    ~/arch-scripts/post-install/modules/files/.background-image
)

for FILE in "${FILES[@]}"; do
    echo "LINKING: ${FILE}"
    ln -fs ${FILE} ~
done

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
