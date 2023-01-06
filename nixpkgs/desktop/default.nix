{ pkgs, ... }: {
  ".local/share/applications/Alacritty.desktop".source = ./Alacritty.desktop;
  ".local/share/applications/firefox.desktop".source = ./firefox.desktop;
  ".local/share/applications/sxiv.desktop".source = ./sxiv.desktop;
  ".local/share/applications/thunderbird.desktop".source =
    ./thunderbird.desktop;
  ".local/share/applications/zathura.desktop".source = ./zathura.desktop;
}
