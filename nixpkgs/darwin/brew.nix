{ inputs, config, pkgs, ... }:
{
  environment = { };

  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "none";
    global = {
      brewfile = true;
      noLock = true;
    };

    taps = [
      "beeftornado/rmtree"
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
    ];

    brews = [
      "automake"
      "awscli"
      "cmake"
      "gettext"
      "imagemagick"
      "jq"
      "libtool"
      "libxmlsec1"
      "llvm@12"
      "mas"
      "ninja"
      "pkg-config"
      "postgresql@12"
      "teamookla/speedtest/speedtest"
      "theseal/ssh-askpass/ssh-askpass"
      "automake"
      "cmake"
      "gettext"
      "libtool"
      "libxmlsec1"
      "ninja"
      "pkg-config"
      "shared-mime-info"
    ];

    casks = [
      "clipy"
      "firefox-beta"
      "font-hack-nerd-font"
      "hammerspoon"
      "intellij-idea-ce"
      "kdiff3"
      "postman"
      "visual-studio-code"
    ];
  };
}
