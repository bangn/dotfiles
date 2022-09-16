{ inputs, config, pkgs, ... }:
{
  environment = { };

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
    ];

    brews = [
      "automake"
      "bash-completion@2"
      "cmake"
      "coreutils"
      "gettext"
      "imagemagick"
      "jq"
      "libtermkey"
      "libtool"
      "libusb"
      "libuv"
      "libxmlsec1"
      "libyaml"
      "llvm@12"
      "luajit-openresty"
      "mas"
      "msgpack"
      "ninja"
      "pam-reattach"
      "pkg-config"
      "shared-mime-info"
      "starship"
      "tree-sitter"
      "watch"
      "zlib"
      "zstd"
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
