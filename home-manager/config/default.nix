{
  pkgs,
  isLinux,
  ...
}: {
  ".config/alacritty/alacritty.toml".source =
    if isLinux
    then ./alacritty/alacritty.toml
    else ./alacritty/alacritty-macos.toml;
  ".config/brittany/brittany.yml".source = ./brittany/config.yaml;
  ".config/dunst/dunstrc".source = ./dunst/dunstrc;
  ".config/i3/config".source = ./i3/config;
  ".config/i3status/config".source = ./i3status/config;
  ".config/nix/nix.conf".source = ./nix/nix.conf;
  ".config/pip/pip.conf".source = ./pip/pip.conf;
  ".config/rofi/config.rasi".source = ./rofi/config.rasi;
  ".config/rofi/custom-nord.rasi".source = ./rofi/custom-nord.rasi;
  ".config/starship.toml".source = ./starship/starship.toml;
  ".config/yamllint/config".source = ./yamllint/config;
  ".config/zathura/zathurarc".source = ./zathura/zathurarc;
  ".config/mise/config.toml".source = ./mise/config.toml;
  ".config/pypoetry/config.toml".source = ./pypoetry/config.toml;
  ".config/ghostty/config".source = ./ghostty/config;
}
