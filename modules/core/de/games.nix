{ config, lib, inputs, pkgs,  ... }:

let
  cfghoyo = config.games.hoyo;
  cfgsteam = config.games.steam;
  cfgvirt = config.virtualization;
in
{
  imports = [ inputs.aagl.nixosModules.default ];

  options = {
    virtualization.enabled = lib.mkOption {
      default = false;
      description = "Enable installation of virtualization programs";
    };
    games = {
      hoyo.enabled = lib.mkOption {
        default = false;
        description = "Enable installation of Hoyo games";
      };
      steam.enabled = lib.mkOption {
        default = false;
        description = "Enable installation of Steam and other related utilities";
      };
    };
  };
  config = {
    nix.settings = inputs.aagl.nixConfig; # Set up Cachix

    programs = {
      # Hoyo games
      anime-game-launcher.enable = cfghoyo.enabled;
      honkers-railway-launcher.enable = cfghoyo.enabled;
      # Steam
      steam = lib.mkIf cfgsteam.enabled {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
      };
      gamescope = lib.mkIf cfgsteam.enabled {
        enable = true;
        capSysNice = true;
      };
    };
    # Controller bluetooth support
    hardware.steam-hardware.enable = cfgsteam.enabled;

    # Virtualisation
    virtualisation = {
      virtualbox = {
        host.enable = cfgvirt.enabled;
      };
      /*vmware = {
        host.enable = cfgvirt.enabled;
      };*/
    };
  };
}
