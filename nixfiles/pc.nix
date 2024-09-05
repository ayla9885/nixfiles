{ config, pkgs, ... }

{
  imports = [
    ./hardware-pc.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
  };
}
