{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
      package = pkgs.nerd-fonts.jetbrains-mono;
    };

    settings = {
      background_opacity = 0.92;
      window_padding_width = 12;
      confirm_os_window_close = 0;
      enable_audio_bell = false;

      foreground = "#e5e5e7";
      background = "#1c1c1e";
      selection_foreground = "#1c1c1e";
      selection_background = "#0a84ff";
      cursor = "#0a84ff";
      url_color = "#64d2ff";

      color0 = "#2c2c2e";
      color1 = "#ff453a";
      color2 = "#30d158";
      color3 = "#ffd60a";
      color4 = "#0a84ff";
      color5 = "#bf5af2";
      color6 = "#64d2ff";
      color7 = "#d1d1d6";

      color8 = "#636366";
      color9 = "#ff6961";
      color10 = "#5ee27a";
      color11 = "#ffe14d";
      color12 = "#409cff";
      color13 = "#da8fff";
      color14 = "#8fe0ff";
      color15 = "#ffffff";
    };
  };
}
