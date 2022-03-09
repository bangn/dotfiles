{ pkgs, ... }:
{
  ".config/alacritty/alacritty.yml".source = ./alacritty/alacritty.yml;
  ".config/brittany/brittany.yml".source = ./brittany/config.yaml;
  ".config/i3/config".source = ./i3/config;
  ".config/i3status/config".source = ./i3status/config;
  ".config/rofi/config.rasi".source = ./rofi/config.rasi;
  ".config/rofi/custom-nord.rasi".source = ./rofi/custom-nord.rasi;
  ".config/yamllint/config".source = ./yamllint/config;
  ".config/zathura/zathurarc".source = ./zathura/zathurarc;
  ".config/starship.toml".source = ./starship/starship.toml;
  ".config/dunst/dunstrc".source = ./dunst/dunstrc;
  ".config/nix/nix.conf".source = ./nix/nix.conf;
}
