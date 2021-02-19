## 3. CONFIGURATION
  + continued form install.md
  + arch-chroot /mnt

  + echo "archbox-pawel" > /etc/hostname

  + vim /etc/locale.gen
    - en_US.UTF-8 UTF-8
    - en_US ISO-8859-1

  + generate language layout
    - locale-gen
    - echo LANG=en_US.UTF-8 > /etc/locale.conf
    - export LANG=en_US.UTF-8

  + ln -s /usr/share/zoneinfo/Aisa/Kolkata /etc/localtime

  + hwclock --systohc --utc

  + vim /etc/pacman.conf
    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch

  + create users
    - passwd
    - useradd -mg users -G wheel,storage,power -s /bin/bash pawel
    - passwd pawel

  + add sudo
    - pacman -S sudo
    - visudo
    - %wheel ALL=(ALL) ALL

  + install boot loader
    - pacman -S grub efibootmgr dosfstools os-prober mtools
    - mkdir /boot/EFI
    - mount /dev/sda1 /boot/EFI  #Mount FAT32 EFI partition
    - grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck

  + grub-mkconfig -o /boot/grub/grub.cfg

  + exit
