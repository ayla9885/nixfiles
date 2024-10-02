{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {

      #startup = [ { command = "COMMAND"; ];

      menu = "rofi -show drun";
      terminal = "alacritty";

      modifier = "Mod4";

      defaultWorkspace = "workspace number 1";

      # Keyboard settings
      input."*" = {
        xkb_layout = "us";
        xkb_variant = "colemak";
      };
      # Monitor settings
      output.DP-3 = {
        mode = "1920x1080@165Hz";
      };
    };
  };
}
