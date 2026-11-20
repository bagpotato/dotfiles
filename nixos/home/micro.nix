{ pkgs, ... }:
{
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "whitesur";
      diffgutter = true;
      mkparents = true;
      savecursor = true;
      saveundo = true;
      tabstospaces = true;
    };
  };

  home.packages = with pkgs; [
    shellcheck
    python3Packages.pyflakes
  ];

  xdg.configFile."micro/colorschemes/whitesur.micro".text = ''
    color-link default "#e5e5e7,#1c1c1e"
    color-link comment "#8e8e93"
    color-link identifier "#64d2ff"
    color-link constant "#ff9f0a"
    color-link constant.string "#30d158"
    color-link constant.specialChar "#ffd60a"
    color-link statement "#bf5af2"
    color-link symbol "#e5e5e7"
    color-link preproc "#ff375f"
    color-link type "#0a84ff"
    color-link special "#ff9f0a"
    color-link underlined "#0a84ff"
    color-link error "#ff453a"
    color-link todo "bold #ffd60a"
    color-link hlsearch "#1c1c1e,#ffd60a"
    color-link diff-added "#30d158"
    color-link diff-modified "#ff9f0a"
    color-link diff-deleted "#ff453a"
    color-link gutter-error "#ff453a"
    color-link gutter-warning "#ffd60a"
    color-link line-number "#636366"
    color-link current-line-number "#0a84ff"
    color-link cursor-line "#2c2c2e"
    color-link color-column "#2c2c2e"
    color-link statusline "#e5e5e7,#2c2c2e"
    color-link tabbar "#e5e5e7,#2c2c2e"
    color-link indent-char "#48484a"
    color-link scrollbar "#48484a"
  '';
}
