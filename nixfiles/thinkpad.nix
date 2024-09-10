{ config, pkgs, ... }:

{
  imports = [
    ./hardware-laptop.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "Noahs-Laptop";
}
