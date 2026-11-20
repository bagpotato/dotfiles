{ ... }:
let
  fg   = "#5a2a3a";   # texto oscuro sobre rosa
  bg1  = "#ffc2d4";   # directorio
  bg2  = "#ffa8c5";   # git
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;

      # Estilo agnoster: segmentos con fondo + separadores powerline
      format = "$directory"
        + "([](fg:${bg1} bg:${bg2})$git_branch$git_status[](fg:${bg2}))"
        + "\${custom.dir_end}"
        + "$cmd_duration"
        + "\n$character";

      directory = {
        style = "fg:${fg} bg:${bg1}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "";
        style = "fg:${fg} bg:${bg2}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:${fg} bg:${bg2}";
        format = "[$all_status$ahead_behind ]($style)";
      };

      # Cierra el segmento del directorio cuando NO estás dentro de un repo git
      custom.dir_end = {
        when = "! git rev-parse --is-inside-work-tree >/dev/null 2>&1";
        command = "echo x";
        format = "[](fg:${bg1})";
      };

      cmd_duration = {
        min_time = 2000;
        format = " [$duration](fg:#d9a0b3)";
      };

      character = {
        success_symbol = "[♥](bold #ff7eb3)";
        error_symbol = "[♥](bold #e0457b)";
      };
    };
  };
}
