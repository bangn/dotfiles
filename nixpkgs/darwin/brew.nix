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
      "gradle"
      "imagemagick"
      "jq"
      "libtool"
      "libxmlsec1"
      "mas"
      "ninja"
      "pkg-config"
      "platform-tools"
      "postgresql@12"
      "shared-mime-info"
    ];

    casks = [
      "clipy"
      "dbeaver-community"
      "firefox-beta"
      "flameshot"
      "font-hack-nerd-font"
      "postman"
      "visual-studio-code"
    ];
  };
}
