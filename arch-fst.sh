#!/bin/bash

#timedatectl set-ntp true
lsblk

echo -n ">>> Ingrese el numero de la unidad donde se montara /swap: "
read -s swap_number
echo $swap_number
mkswap /dev/sda$swap_number
swapon /dev/sda$swap_number

echo -n ">>> Ingrese el numero de la unidad donde se montara /root: "
read -s mnt_number
echo $mnt_number
mkfs.ext4 /dev/sda$mnt_number
mount /dev/sda$mnt_number /mnt

echo -n "Ingrese el numero de la unidad donde se montara /boot: "
read -s boot_number
echo $boot_number
mkfs.ext4 /dev/sda$boot_number
mkdir /mnt/boot
mount /dev/sda$boot_number /mnt/boot

echo -n ">>> Ingrese el numero de la unidad donde se montara /efi: "
read -s efi_number
echo $efi_number
mkfs.fat -F32 /dev/sda$efi_number
mkdir /mnt/boot/efi
mount /dev/sda$efi_number /mnt/boot/efi

echo -n ">>> Ingrese el numero de la unidad donde se montara /home: "
read -s home_number
echo $home_number
mkdir /mnt/home
mount /dev/sda$home_number /mnt/home

# echo -n "Instalando archlinux-heyring\n"

# pacman -Syu
# pacman -Sy archlinux-keyring #
# pacman-key --refresh-keys

echo -n ">>>> Instalando archlinux-heyring\n"
# pacstrap /mnt base
# pacstrap /mnt base linux-firmware linux
pacstrap /mnt base linux-firmware linux linux-headers base-devel
# linux-headers net-tools vim lvm2 nano iwd man-pages dialog dnsutils iputils wpa_supplicant dhcpcd

genfstab -U /mnt >> /mnt/etc/fstab

echo -n ">>> bye bye\n"

arch-chroot /mnt
#arch-chroot /mnt /bin/bash
