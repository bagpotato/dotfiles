{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop-cuda;

    settings = {
      color_theme = "pink";
      theme_background = false;
      truecolor = true;
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc gpu0";
      update_ms = 1000;
      proc_sorting = "cpu lazy";
    };

    themes.pink = ''
      theme[main_bg]="#2a1620"
      theme[main_fg]="#ffd6e0"
      theme[title]="#ff8fb5"
      theme[hi_fg]="#ff7eb3"
      theme[selected_bg]="#ffa8c5"
      theme[selected_fg]="#5a2a3a"
      theme[inactive_fg]="#8c5a6b"
      theme[graph_text]="#ffc2d4"
      theme[meter_bg]="#4a2a38"
      theme[proc_misc]="#ffa8c5"

      theme[cpu_box]="#ff8fb5"
      theme[mem_box]="#ff7eb3"
      theme[net_box]="#ffa8c5"
      theme[proc_box]="#ffc2d4"
      theme[div_line]="#6b3a4d"

      theme[temp_start]="#ffc2d4"
      theme[temp_mid]="#ff7eb3"
      theme[temp_end]="#e0457b"

      theme[cpu_start]="#ffc2d4"
      theme[cpu_mid]="#ff8fb5"
      theme[cpu_end]="#e0457b"

      theme[free_start]="#ffe0ea"
      theme[free_mid]="#ffc2d4"
      theme[free_end]="#ff8fb5"

      theme[cached_start]="#ffc2d4"
      theme[cached_mid]="#ffa8c5"
      theme[cached_end]="#ff7eb3"

      theme[available_start]="#ffd6e0"
      theme[available_mid]="#ffa8c5"
      theme[available_end]="#ff8fb5"

      theme[used_start]="#ffa8c5"
      theme[used_mid]="#ff7eb3"
      theme[used_end]="#e0457b"

      theme[download_start]="#ffc2d4"
      theme[download_mid]="#ff8fb5"
      theme[download_end]="#e0457b"

      theme[upload_start]="#ffe0ea"
      theme[upload_mid]="#ffa8c5"
      theme[upload_end]="#ff7eb3"

      theme[process_start]="#ffc2d4"
      theme[process_mid]="#ff8fb5"
      theme[process_end]="#e0457b"
    '';
  };
}
