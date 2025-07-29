{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Sys mon
    btop
    nvtopPackages.amd
    bc # calculator
    ncdu # Disk space checker
    git
    imagemagick
    gnumake
    libgcc
    qmk
    doas-sudo-shim
    
    pamixer
    pulsemixer
    playerctl

    xwayland-satellite
    qbittorrent
    vesktop
    easyeffects
  ];
  programs = {
    zathura.enable = true;
    foot = {
      enable = true;
      settings = {
        main = {
          pad = "24x24";
        };
        colors = {
          background = lib.mkForce "${config.stylix.base16Scheme.base01}";
        };
      };
    };
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
  };

  /*programs.imv = {
    enable = true;
    settings = {
      binds = {
        "<Ctrl+w>" = "exec swww clear-cache; exec swww img --transition-type grow --transition-fps 165 --transition-step 30 $imv_current_file";
      };
    };
  };*/
}
