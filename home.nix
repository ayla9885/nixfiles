{ pkgs, ... }:

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
    speedtest-cli # CLI tool for speedtest.net
    p7zip
    wootility # Keyboard customization software

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
    librewolf

    # Music
    sonata

    # Terminals
    kitty
    alacritty

    # Art
    gimp
    krita

    # Games
    vintagestory

    # Interpreters / Compilers
    python3Full
    clang

    # Rust
    rustc
    rustfmt
    rust-analyzer
    clippy
    cargo

    # LSPs
    nixd
    python312Packages.python-lsp-server
  ];

  #                      #
  ### ALIASES 'N STUFF ### 
  #                      #
  
  home.shellAliases = {
    ls = "lsd";
    tree = "lsd --tree";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  #             #
  ### CONFIGS ###
  #             #
  
  # Imported configs
  imports = [ 
    ./programfiles/neovim/neovim.nix
    ./programfiles/sway/sway.nix 
    ];

  home.file = {
  
    # FVWM 
    "fvwm" = {
      target = ".fvwm/config";
      source = ./programfiles/fvwm/config;
    };

  };

  # Git 
  programs = {
    git = {
      enable = true;
      userName = "ayla9885";
      userEmail = "number1noah@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };

    nushell = {
      enable = true;
      configFile.source = ./programfiles/nushell/config.nu;
      envFile.source = ./programfiles/nushell/env.nu;
    };

    fish = {
      enable = true;
    };
    
    # Starship 
    starship = {
      enable = true;
    };

    # Alacritty 
    alacritty = {
      enable = true;
      settings = {
        window = {
          resize_increments = true; # Resize in cell increments
        };
        font = {
          size = 14;
          normal = {
            # family = "BigBlueTermPlus Nerd Font Mono";
            family = "UbuntuMono Nerd Font Mono";
            # family = "Monofur Nerd Font Mono";
            # family = "JetBrainsMono Nerd Font Mono";
            style = "Bold";
          };
        };
      };
    };

    # Pidgin
    pidgin = {
      enable = true;
      #plugins = with pkgs; [
        # purple-discord
      # ];
    };

    # Librewolf
    librewolf = {
      enable = true;
      settings = {
        "privacy.donottrackheader.enabled" = true; # Sends websites a "do not track" request
        "privacy.globalprivacycontrol.enabled" = true; # Asks websites to not sell my data
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false; # Preserve history after closing  
        "layout.css.always_underline_links" = true;
      };
    };

  };

  #           #
  ### FONTS ###
  #           #

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "UbuntuMono Nerd Font Mono Bold" ];
      # serif = [ "BigBlueTermPlus Nerd Font Propo" ];
    };
  };

  home.stateVersion = "24.05";
}
