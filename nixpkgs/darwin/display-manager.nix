{ config, pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    config = {
      mouse_follows_focus = "on";
      focus_follows_mouse = "off";
      window_placement = "second_child";
      window_topmost = "off";
      window_opacity = "off";
      window_opacity_duration = 0.0;
      window_shadow = "off";
      window_border = "off";
      window_border_placement = "inset";
      window_border_width = 0;
      window_border_radius = 0;
      active_window_border_topmost = "off";
      active_window_border_color = "0xff775759";
      normal_window_border_color = "0xff505050";
      insert_window_border_color = "0xffd75f5f";
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      split_ratio = 0.5;
      auto_balance = "on";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      layout = "bsp";
      top_padding = 0;
      bottom_padding = 0;
      left_padding = 0;
      right_padding = 0;
      window_gap = 0;
    };
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = builtins.readFile ../homedot/skhd/skhdrc;
  };
}
