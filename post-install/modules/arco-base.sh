#!/usr/bin/env bash

echo
echo "MODULE: ARCO-BASE"
echo

# ------------------------------------------------------------------------
# Community Apps
# ------------------------------------------------------------------------

PKGS=(
### System Apps ###
    #'udisk2'
    #'udiskie'
    'android-tools'
    'atool'
    'chromium'
    'cmus'
    'curl'
    'feh'
    'firefox'
    'fzf'
    'ghostscript'
    'goldendict'
    'gsfonts'
    'hardinfo'
    'htop'
    'kupfer'
    'maim'
    'mpv'
    'mupdf'
    'nextcloud-client'
    'ntfs-3g'
    'ntp'
    'paperkey'
    'pass'
    'pwgen'
    'rsync'
    'seahorse'
    'signal-desktop'
    'stalonetray'
    'translate-shell'
    'unrar'
    'unzip'
    'usbutils'
    'vlc'
    'wget'
    'xscreensaver'
    'zip'
### Terminal ###
    #'dunst'
    #'openssh'
    'rxvt-unicode'
    'tree'
    'urxvt-perls'
    'zsh'
    'zsh-completions'
    'zsh-syntax-highlighting'
### Dev      ###
    'clang'
    'cmake'
    'gcc'
    'ghc-static'
    'nodejs'
    'npm'
    'python'
    'python'
    'python-pip'
    'stack'
    'stylish-haskell'
### Vim      ###
    'cmake'
    'gvim'
    'powerline-vim'
    'python-pynvim'
    'ripgrep'
### Graphics ###
    'blender'
    'gpick'
    'imagemagick'
    'krita'
### Input   ###
    'fcitx5'
    'fcitx5-chinese-addons'
    'fcitx5-configtool'
    'fcitx5-rime'
### Fonts   ###
    'noto-fonts-cjk'
    'powerline-fonts'
    'ttf-dejavu'
    'ttf-fira-code'
    'ttf-fira-mono'
    'ttf-fira-sans'
    'ttf-font-awesome'
    'ttf-ubuntu-font-family'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

# ------------------------------------------------------------------------
# AUR Apps
# ------------------------------------------------------------------------

PKGS=(

    'jmtpfs'
    'pureref'
    'pyradio'
    'volnoti'
)

for PKG in "${PKGS[@]}"; do
    yay -S $PKG
done

# ------------------------------------------------------------------------
# NPM
# ------------------------------------------------------------------------
# linking config
ln -fs /home/pawel/arch-scripts/dotfiles/.noderc ~
ln -fs /home/pawel/arch-scripts/dotfiles/.npmrc ~

PKGS=(

    'gatsby-cli'
    'prettier'
    'typescript'
)

for PKG in "${PKGS[@]}"; do
    npm install -g $PKG
done
# ------------------------------------------------------------------------

echo
echo "Done!"
echo
