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
  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];

  services = {
    # Blueman
    blueman.enable = true;
    # Mullvad
    mullvad-vpn.enable = true;

    # USB automount
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
}
