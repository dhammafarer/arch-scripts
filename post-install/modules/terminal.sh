#!/usr/bin/env bash

echo
echo "MODULE: TERMINAL"
echo

PKGS=(

    'dunst'
    'openssh'
    'powerline-vim'
    'python-pynvim'
    'rxvt-unicode'
    'tree'
    'urxvt-perls'
    'zsh'
    'zsh-completions'
    'zsh-syntax-highlighting'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------
echo
echo "INSTALLING OH-MY-ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ------------------------------------------------------------------------
echo
echo "INSTALLING AUTOSUGGESTIONS"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# ------------------------------------------------------------------------

echo
echo "LINKING DOTFILES"
ln -fs ~/arch-scripts/dotfiles/.shrc ~
ln -fs ~/arch-scripts/dotfiles/.bashrc ~
ln -fs ~/arch-scripts/dotfiles/.zshrc ~
ln -fs ~/arch-scripts/dotfiles/.Xresources ~

ln -fs ~/arch-scripts/dotfiles/.config/dunst ~/.config/
ln -fs ~/arch-scripts/dotfiles/.config/picom ~/.config/
ln -fs ~/arch-scripts/dotfiles/.config/ranger ~/.config

# ------------------------------------------------------------------------

echo
echo "COPYING TASKRC"
cp ~/arch-scripts/post-install/modules/files/.taskrc ~

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
