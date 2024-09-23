{ config, pkgs, nixvim, ... }:

{
  
  home.username = "ayla";
  home.homeDirectory = "/home/ayla";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;

  #              #
  ### PACKAGES ###
  #              #

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
    flatpak
    vlc # Media player

    # Chat
    vesktop
    pidgin # IRC client
    abaddon # Non-electron Discord client

    # Browsers
    firefox
    palemoon-bin
    librewolf

    # Music
    sonata

    # Terminals
    kitty
    alacritty

    # Art
    gimp
  ];

  #             #
  ### ALIASES ###
  #             #
  
  home.shellAliases = {
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #             #
  ### CONFIGS ###
  #             #

  home.file = {
  
    # FVWM 
    "fvwm" = {
      target = ".fvwm/config";
      source = ./programfiles/fvwm/config;
    };

  };

  # Git 
  programs.git = {
    enable = true;
    userName = "ayla9885";
    userEmail = "number1noah@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };

  # Neovim 
  imports = [ ./programfiles/neovim/neovim.nix ];
  programs.neovim.enable = true;

  programs.fish = {
    enable = true;
  };
  
  # Starship 
  programs.starship = {
    enable = true;
  };

  # Alacritty 
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        resize_increments = true; # Resize in cell increments
      };
      font.normal = {
        family = "BigBlueTermPlus Nerd Font Mono";
        # family = "Monofur Nerd Font Mono";
        # family = "JetBrainsMono Nerd Font Mono";
        style = "Regular";
      };
    };
  };

  # Pidgin
  programs.pidgin = {
    enable = true;
    #plugins = with pkgs; [
      # purple-discord
    # ];
  };

  # Librewolf
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.donottrackheader.enabled" = true; # Sends websites a "do not track" request
      "privacy.globalprivacycontrol.enabled" = true; # Asks websites to not sell my data
      "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false; # Preserve history after closing  
      "layout.css.always_underline_links" = true;
    };
  };

  #           #
  ### FONTS ###
  #           #

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "BigBlueTermPlus Nerd Font Propo" ];
      # serif = [ "BigBlueTermPlus Nerd Font Propo" ];
    };
  };

  home.stateVersion = "24.05";
}
