# Installation Instructions

## 1. PARTITION DRIVES
  + create partitions,

  + format partitions:
    - EFI:    mkfs.fat -F32 /dev/sda1
    - LINUX:  mkfs.ext4 /dev/sda3
    - SWAP:   mkswap /dev/sda2

## 2. INSTALLATION
  + mount partitions
    - LINUX:  mount /dev/sda3 /mnt
    - SWAP:   swapon /dev/sda2

  + install system
    pacstrap /mnt base base-devel linux linux-firmware git gvim dhcpcd

  + generate fstab file:
    genfstab -U -p /mnt >> /mnt/etc/fstab

## 3. CONFIGURATION
  + See config.md

  + arch-chroot /mnt

## 4.Reboot

  + reboot
    - umount -a
    - telinit 6
