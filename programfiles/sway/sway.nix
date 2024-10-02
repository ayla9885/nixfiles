{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {

      #startup = [ { command = "COMMAND"; ];

      menu = "rofi -show drun";

      # Keyboard settings
      input."*" = {
        xkb_layout = "us";
        xkb_variant = "colemak";
      };
      # Monitor settings
      output.DP-3 = {
        mode = "1920x1080@165Hz";
      };

      modifier = "Mod4";


      terminal = "alacritty";
    };
  };
}
