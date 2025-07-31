{ lib, pkgs, ... }:

{
  # Greetd with tuigreet
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --remember-session --window-padding 2";
	user = "greeter";
      };
    };
  };
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    nerd-fonts.inconsolata
  ];
}
