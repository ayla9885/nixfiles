# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Enable nix flakes and accompanying nix command line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking = {
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved"; # Prevent networkmanager from overriding dns server
  };
  services.resolved = {
    enable = true;
    extraConfig = "DNS=194.242.2.3#adblock.dns.mullvad.net";
    dnsovertls = "true";
    fallbackDns = [ "194.242.2.2#dns.mullvad.net" ];
  };


  # Enable sound
  hardware.pulseaudio.enable = true;
  

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };
  console.useXkbConfig = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ayla = {
    isNormalUser = true;
    description = "Ayla";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # cli utils
    neovim 
    git

    # window managers
    fvwm3

    home-manager

  ];

  programs.steam = {
    enable = true;
  };

  programs.fish.enable = true;

  # x11 and window manager
  services.xserver = {
    enable = true;
    windowManager.fvwm3.enable = true;
    autorun = true;
  };

  # mouse/touchpad
  services.libinput = {
    enable = true;
    touchpad = {
      middleEmulation = true; # press left + right mouse to middle click
      disableWhileTyping = true;
      scrollMethod = "edge";
      horizontalScrolling = true;
      accelProfile = "flat";
    };
  };

  #
  ### FONTS
  #

  fonts.packages = with pkgs; [
    dejavu_fonts
    (nerdfonts.override { fonts = [ "BigBlueTerminal" "FiraCode" "JetBrainsMono" "Gohu" "MartianMono" "Monofur" ]; })
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
