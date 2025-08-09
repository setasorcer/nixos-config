{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # System apps/generic
    doas-sudo-shim
    btop
    bc # calculator
    ncdu # Disk space checker

    # Suites/complex programs
    imagemagick
    qbittorrent
    yt-dlp
    ffmpeg

    # Compilation/coding
    git
    gnumake
    libgcc
    qmk

    # Gaming tools
    ryzenadj
    nvtopPackages.amd
    vesktop
    
    # Sound/music tools
    pamixer
    pulsemixer
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
}
