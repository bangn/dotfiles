{ config, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    config = {
      active_window_border_color = "0xff775759";
      active_window_border_topmost = "off";
      active_window_opacity = 1.0;
      auto_balance = "on";
      bottom_padding = 0;
      focus_follows_mouse = "autoraise";
      insert_window_border_color = "0xffd75f5f";
      layout = "bsp";
      left_padding = 0;
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_follows_focus = "on";
      mouse_modifier = "fn";
      normal_window_border_color = "0xff505050";
      normal_window_opacity = 0.9;
      right_padding = 0;
      split_ratio = 0.5;
      top_padding = 0;
      window_border = "off";
      window_border_placement = "inset";
      window_border_radius = 0;
      window_border_width = 0;
      window_gap = 0;
      window_opacity = "off";
      window_opacity_duration = 0.0;
      window_placement = "second_child";
      window_shadow = "off";
      window_topmost = "off";
    };

    extraConfig = ''
      yabai -m rule --add app="^Firefox.*$" title="^Opening .*$" manage=off
      yabai -m rule --add app='System Preferences' manage=off
    '';
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = builtins.readFile ../homedot/skhd/skhdrc;
  };
}
