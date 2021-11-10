{ inputs, config, pkgs, ... }:
let
  checkBrew = "command -v brew > /dev/null";
  installBrew = ''
    ${pkgs.bash}/bin/bash -c "$(${pkgs.curl}/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'';
in
{
  environment = {
    extraInit = ''
      ${checkBrew} || ${installBrew}
    '';
  };

  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "uninstall";
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
      "teamookla/speedtest"
    ];

    brews = [
      "beeftornado/rmtree/brew-rmtree"
      "mas"
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
      "flameshot"
      "font-hack-nerd-font"
      "visual-studio-code"
    ];
  };
}
