{ config, pkgs, homeDirectory, ... }:

{
  system = {
    defaults = {
      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = true;
        QuitMenuItem = true;
      };

      trackpad = {
        ActuationStrength = 0;
        Clicking = true;
        FirstClickThreshold = 1;
        SecondClickThreshold = 1;
        TrackpadRightClick = true;
      };

      dock = {
        autohide = false;
        autohide-delay = "0.0";
        autohide-time-modifier = "1.0";
        mru-spaces = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        showhidden = false;
        static-only = true;
        tilesize = 25;
      };

      spaces = {
        spans-displays = false;
      };

      screencapture = {
        location = "${homeDirectory}/Pictures";
      };

      NSGlobalDomain = {
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = "0.000";
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
