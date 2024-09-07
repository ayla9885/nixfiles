{ config, pkgs, nixvim, ... }:

{
  
  home.username = "ayla";
  home.homeDirectory = "/home/ayla";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;

  #
  ### PACKAGES
  #

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
       
    # CLI tools
    btop # Resource monitoring
    iotop # IO monitoring
    iftop # Network monitoring
    lf # Tui file manager
    p7zip
    tree # Show file tree structure

    # Utilities
    feh # Image viewer
    fastfetch # System info fetcher
    rofi # Launcher
    pavucontrol

    # Chat
    ripcord # Light-weight Discord client

    # Games
    steam

    # Browsers
    firefox
    palemoon-bin

    # Terminals
    kitty
    
  ];

  #
  ### ALIASES
  #
  
  home.shellAliases = {
    
  };

  #
  ### CONFIGS
  #

  home.file = {
  
    # FVWM config
    "fvwm" = {
      target = ".fvwm/config";
      text = "
      CursorStyle ROOT top_left_arrow
      ";
    };

    # Neovim config
    "nvim" = {
      source = ./programfiles/neovim;
      target = ".config/nvim";
      recursive = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "ayla9885";
    userEmail = "number1noah@gmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.kitty = {
    enable = true;
  };

  #
  ### FONTS
  #

  fonts.fontconfig = {
    enable = true;
  };

  home.stateVersion = "24.05";
}
