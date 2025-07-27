{ config, pkgs, ... }:

{
  hardware = {
    # Bluetooth
    bluetooth = {
      enable = true;
      # Fixes DS3 Controller bluetooth
      /*input = {
        General = {
	  ClassicBondedOnly = "false";
	};
      };*/
    };
  };

  # Install services
  services = {
    # Blueman
    blueman.enable = true;
    # Mullvad
    mullvad-vpn = {
      enable = false;
      package = pkgs.mullvad-vpn;
    };

    # USB automount
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    # Don't do anything when the lid is closed
    logind.lidSwitch = "ignore";
  };
}
