{ pkgs, ... }:

let
  resumeScript = pkgs.writeShellScript "resumeScript.sh" ''

    hyprctl dispatch dpms on
  '';
in
{
  services.hypridle = {
    enable = false;
    settings = {
      general = {
        #after_sleep_cmd = "hyprctl dispatch dpms on";
	#ignore_dbus_inhibit = "false";
      };
      listener = [
	/*{
	  # Fade before shutting off display
	  timeout = 297;
	  on-timeout = "chayang";
	}*/
	{
          timeout = 300;
	  on-timeout = "chayang && hyprctl dispatch dpms on";
          #on-resume = "${resumeScript}";
	}
      ];
    };
  };
}
