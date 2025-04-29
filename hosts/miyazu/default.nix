# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/core
      ./../../modules/core/de/games.nix
    ];

  # External drives.
  fileSystems."/mnt/42a02f06-ecc3-4c19-b979-d92c3fe9323b" = {
    device = "/dev/disk/by-uuid/42a02f06-ecc3-4c19-b979-d92c3fe9323b";
    fsType = "ext4";
  };
  fileSystems."/mnt/503deb8a-29bb-4295-bec4-ae7875d26688" = {
    device = "/dev/disk/by-uuid/503deb8a-29bb-4295-bec4-ae7875d26688";
    fsType = "ext4";
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    #davinci-resolve
  ];
  games.steam.enabled = true;
  games.hoyo.enabled = true;
  virtualization.enabled = true;
}
