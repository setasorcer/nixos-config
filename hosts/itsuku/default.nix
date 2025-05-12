# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ username, inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/core
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    ];

  fileSystems."/mnt/bd1f36e9-cffd-4aaa-a70d-7e15a6b4a4f6" = {
    device = "/dev/disk/by-uuid/bd1f36e9-cffd-4aaa-a70d-7e15a6b4a4f6";
    fsType = "ext4";
  };
 
  # Power saving
  networking.networkmanager.wifi.powersave = true;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_TRESH_BAT0 = 55;
      STOP_CHARGE_TRESH_BAT0 = 80;

      START_CHARGE_TRESH_BAT1 = 55;
      STOP_CHARGE_TRESH_BAT1 = 80;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      #CPU_SCALING_MAX_FREQ_ON_BAT = 3200000;
    };
  };

  # Keyd
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        capslock = "overload(control,esc)";
	esc = "capslock";
	pause = "esc";
	sysrq = "overload(meta,sysrq)";
      };
    };
  };
  # Laptop optimizations: battery modules, disable hyprland decorations
  games.steam.enabled = true;
  home-manager.users."${username}" = {
    de = {
      decorations.enabled = false;
      extraBar.enabled = true;
    };
    home.packages = with pkgs; [
      anki-bin
    ];
  };
  virtualization.enabled = true;
}
