{ inputs, config, pkgs, ... }: {
  environment = { };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    global = {
      brewfile = true;
      lockfiles = true;
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
      "starship"
      "tree-sitter"
      "zlib"
      "zstd"
    ];

    casks = [
      "basictex"
      "clipy"
      "firefox-beta"
      "font-hack-nerd-font"
      "hammerspoon"
      "intellij-idea-ce"
      "kdiff3"
      "obsidian"
      "postman"
      "visual-studio-code"
    ];
  };
}
