{ pkgs, config, lib, host, ... }:

{
  imports = [
    ./style.nix
    ./extraBar.nix # Extra modules for laptop
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	# Bar positioning
        layer = "top";
        position = "top";
	height = 44;
	spacing = 0;
	# Module placement
	modules-left = [ "custom/power" "custom/clockicon" "clock#2" "custom/notification" "hyprland/window" ];
	modules-center = [ "hyprland/workspaces" ];
	modules-right = [ "custom/media" "memory" "temperature" "wireplumber" "network" "tray" ];

	# Module configuration
	# Left
	"custom/power" = {
	  tooltip = false;
	  format = "";
	  on-click = "rofi -show power-menu -modi power-menu:rofi-power-menu";
	  escape = true;
	};
	"custom/notification" = {
	  tooltip = false;
	  format = "{icon}";
	  format-icons = {
	    notification = "<span foreground='red'><sup></sup></span>";
	    none = "";
	    dnd-notification = "<span foreground='red'><sup></sup></span>";
	    dnd-none = "";
	    inhibited-notification = "<span foreground='red'><sup></sup></span>";
	    inhibited-none = "";
	    dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
	    dnd-inhibited-none = "";
	  };
	  return-type = "json";
	  exec-if = "which swaync-client";
	  exec = "swaync-client -swb";
	  on-click = "swaync-client -t -sw";
	  on-click-right = "swaync-client -d -sw";
	  escape = true;
	};
	"custom/clockicon" = {
	  tooltip = false;
	  format = "󰥔";
	};
	"clock#2" = {
	  interval = 60;
	  format = "<span size='9pt' weight='700'>{:L%R\n%x(%a)}</span>";
	  tooltip-format = "<span size='9pt' font='Noto Sans Mono CJK JP'>{calendar}</span>";
	  calendar = {
	    mode = "month";
	    mode-mon-col = 3;
	    on-scroll = 1;
	    format = {
	      months = "<span color='#${config.stylix.base16Scheme.base05}'><b>{}</b></span>";
	      days = "<span color='#${config.stylix.base16Scheme.base06}'><b>{}</b></span>";
	      weekdays = "<span color='#${config.stylix.base16Scheme.base0F}'><b>{}</b></span>";
	      today = "<span color='#${config.stylix.base16Scheme.base08}'><b>{}</b></span>";
	    };
	  };
	};
	"hyprland/window" = {
	  format = "<span size='9pt' weight='700'>{}</span>";
	  tooltip = false;
	};
	# Center
	"hyprland/workspaces" = {
	  format = "{icon}";
	  format-icons = {
	    "1" = "一";
	    "2" = "二";
	    "3" = "三";
	    "4" = "四";
	    "5" = "五";
	    "6" = "六";
	    "7" = "七";
	    "8" = "八";
	    "9" = "九";
	  };
	  #ignore-workspaces = [ "sp1" ];
	  show-special = true;
	  special-visible-only = true;
	};
	# Right
	# Better MPRIS module
	"custom/media" = {
          format = "{icon}<span size='9pt' weight='700'>{}</span>";
          return-type = "json";
          format-icons = {
              "Playing" = " ";
              "Paused" = " ";
          };
          max-length = 70;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "playerctl play-pause";
	  tooltip = false;
	};
	cava = {
	  cava_config = "${config.home.homeDirectory}/.config/cava/config";
	  format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
	  method = "pipewire";
	  bars = 18;
	  autosens = 1;
	  source = "auto";
	  bar_delimiter = 0;
	  input_delay = 2;
	  hide_on_silence = true;
	};
	cpu = {
	  interval = 10;
    	  format = " {}%";
    	  max-length = 10;
        };
	temperature = {
	  hwmon-path-abs =
	  if (host == "miyazu") then
	    "/sys/devices/pci0000:00/0000:00:18.3/hwmon"
	  else
	    "/sys/devices/platform/thinkpad_hwmon/hwmon";
	  input-filename = "temp1_input";
	  critical-threshold = 80;
	  format = " {temperatureC}°C";
	  tooltip = false;
	};
	memory = {
	  interval = 30;
	  format = " {used:0.1f}G";
	  tooltip-format = " {used:0.1f}G/{total:0.1f}G\n {swapUsed:0.1f}G/{swapTotal:0.1f}G";
        };
	wireplumber = {
	  format = "{icon} {volume}%";
	  format-muted = "󰝟";
	  format-icons = [ "󰕿" "󰖀" "󰕾" ];
	  on-click = "foot -e pulsemixer";
	};
	network = {
	  format = "{icon}";
	  format-icons = {
	    ethernet = [ "" ];
	    wifi = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
	    disconnected = [ "󰌙" ];
	  };
	  tooltip-format = "{icon} {ifname} via {gwaddr}";
	  tooltip-format-wifi = "{icon} {essid} ({signalStrength}%)";
	  tooltip-format-ethernet = "{icon} {ifname}";
	  tooltip-format-disconnected = "Disconnected";
	};
	tray = {
	  icon-size = 16;
	  spacing = 10;
	};
      };
    };
  };
}
