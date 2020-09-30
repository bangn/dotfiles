{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  home-manager.enable = true;

  direnv = import ./direnv { inherit pkgs; };
  git = import ./git { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  zsh = import ./zsh { inherit pkgs; };

  firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles = {
      bangn = {
        id = 0;
        isDefault = true;
        settings = {
          "browser.display.use_document_fonts" = 0;
          "browser.uidensity" = 1;
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "browser.urlbar.placeholderName.private" = "DuckDuckGo";
          "devtools.theme" = "dark";
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "font.name.monospace.x-western" = "Hack";
          "font.name.sans-serif.x-western" = "Hack";
          "font.name.serif.x-western" = "Hack";
          "signon.rememberSignons" = false;
        };
      };
    };
  };
}
