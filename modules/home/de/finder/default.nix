{ pkgs, config, lib, ... }:

{
  imports = [ ./style.nix ];
  # Extra goodies
  home.packages = with pkgs; [
    rofi-power-menu # Power menu
    tessen # for password-store
  ];
  # Tessen config
  home.file.".config/tessen/config".text = ''
    dmenu_backend="rofi"
    action="copy"
    notify="false"
  '';
  # Launcher
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    # rofi accessories
    plugins = [ pkgs.rofi-emoji ];
  };
}
