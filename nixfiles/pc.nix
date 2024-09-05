{ config, pkgs, ... }:

{
  imports = [
    ./hardware-pc.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Noahs-PC";
}
