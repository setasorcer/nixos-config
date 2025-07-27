# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ username, inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/core
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    ];

  /*fileSystems."/mnt/bd1f36e9-cffd-4aaa-a70d-7e15a6b4a4f6" = {
    device = "/dev/disk/by-uuid/bd1f36e9-cffd-4aaa-a70d-7e15a6b4a4f6";
    fsType = "ext4";
  };*/
  fileSystems."/mnt/503deb8a-29bb-4295-bec4-ae7875d26688" = {
    device = "/dev/disk/by-uuid/503deb8a-29bb-4295-bec4-ae7875d26688";
    fsType = "ext4";
  };
 
  # Power saving
  networking.networkmanager.wifi.powersave = true;
  services.fwupd.enable = true;

  # Keyd
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        capslock = "overload(control,esc)";
	esc = "capslock";
	pause = "esc";
	#sysrq = "overload(meta,sysrq)";
      };
      settings.global = {
        overload_tap_timeout = 175;
      };
    };
  };
  # Laptop optimizations: battery modules, disable hyprland decorations
  games.steam.enabled = true;
  games.hoyo.enabled = true;
  virtualization.enabled = true;
  home-manager.users."${username}" = {
    de = {
      decorations.enabled = true;
      extraBar.enabled = true;
    };
    home.packages = with pkgs; [
      prismlauncher
      anki-bin
    ];
  };
}
