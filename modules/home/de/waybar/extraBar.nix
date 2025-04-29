{ config, lib, ... }:

let
  cfg = config.de.extraBar;
in
{
  options.de.extraBar = {
    enabled = lib.mkEnableOption "Enable battery modules in waybar, and change things around";
  };
  config = lib.mkIf cfg.enabled {
    programs.waybar.settings = {
      mainBar = {
        modules-left = lib.mkForce [ "custom/power" "custom/clockicon" "clock#2" "custom/notification" "hyprland/workspaces" "hyprland/window" ];
        modules-center = lib.mkForce [ ];
        modules-right = lib.mkForce [ "custom/media" "memory" "temperature" "battery#1" "battery#2" "wireplumber" "network" "tray" ];

        "battery#1" = {
          bat = "BAT0";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "󰂎" "󰁼" "󰁾" "󰂀" "󰁹" ];
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂌 {capacity}%";
          format-full = "󰂃 {capacity}%";
        };
        "battery#2" = {
          bat = "BAT1";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "󰂎" "󰁼" "󰁾" "󰂀" "󰁹" ];
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂌 {capacity}%";
          format-full = "󰂃 {capacity}%";
        };
      };
    };
  };
}
