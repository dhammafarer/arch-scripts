#!/usr/bin/env bash

echo
echo "MODULE: VIM"
echo

# ------------------------------------------------------------------------

PKGS=(
  'gvim'
  'cmake'
  'python'
  'nodejs'
  'npm'
  'ripgrep'
  'python-pynvim'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------

echo
echo "LINKING DOTFILES"
ln -fs /home/pawel/arch-scripts/dotfiles/.vimrc ~

# ------------------------------------------------------------------------

echo
echo "INSTALLING VUNDLE"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# ------------------------------------------------------------------------

echo
echo "INSTALLING PLUGINS"

vim +PluginInstall +qall

# ------------------------------------------------------------------------

echo
echo "INSTALLING YCM"

cd ~/.vim/bundle/YouCompleteMe && ./install.py --ts-completer

# ------------------------------------------------------------------------

echo
echo "CLONINING SNIPPETS"

git clone https://github.com/dhammafarer/UltiSnips ~/.vim/

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
