{ ... }:
{
  programs.serpantinum = {
    enable = true;
    systemd.enable = false;
    settings = {
      wallpaperDir = "/home/bag/Pictures/Wallpapers";
    };
  };

  home.file."Pictures/Wallpapers/.keep".text = "";
}
