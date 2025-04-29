{ config, host, ... }:

{
  # Syncthing
  services.syncthing = {
    enable = true;
    settings = 
      if (host == "miyazu") then
      {
        devices = {
          "itsuku" = { id = "5HEEVIU-DOIYJH3-44NOBAD-3LVJDH3-5DYNEV5-26W3YW5-ZV57A2J-ZK3VBAX"; };
        };
        folders = {
          "${config.home.homeDirectory}/dox/send" = {
	    id = "d8mzi-18znf";
	    label = "shared";
            devices = [ "itsuku" ];
          };
          "${config.home.homeDirectory}/music" = {
	    id = "bj6oi-ijmtg";
	    label = "music";
            devices = [ "itsuku" ];
          };
          "${config.home.homeDirectory}/pix/snaps" = {
	    id = "hyjdy-jlqjt";
	    label = "snaps";
            devices = [ "itsuku" ];
          };
          "${config.home.homeDirectory}/.local/share/password-store" = {
            id = "xvy6e-h6zgk";
	    label = "pass";
            devices = [ "itsuku" ];
          };
          "${config.home.homeDirectory}/.config/nixos" = {
	    id = "rsgvn-dhhxs";
	    label = "nixos";
	    devices = [ "itsuku" ];
	    versioning = {
	      type = "simple";
	      params.keep = "5";
	    };
	  };
        };
      }
      else
      {
        devices = {
          "miyazu" = { id = "LYF53QB-67MIZKO-FLT6MQM-FKBT4VF-ZRSZYNI-NF65S6J-KOIBAZ7-4ERHIAH"; };
	  "droid" = { id = "T3XFMZZ-BVLSDLN-ZHH3WRO-WL35HXD-5WCXVWV-6OSJMNQ-LNCL5MG-GIWCFA3"; };
	};
	folders = {
          "${config.home.homeDirectory}/dox/send" = {
	    id = "d8mzi-18znf";
	    label = "shared";
            devices = [ "miyazu" "droid" ];
          };
          "${config.home.homeDirectory}/music" = {
	    id = "bj6oi-ijmtg";
	    label = "music";
            devices = [ "miyazu" ];
          };
          "${config.home.homeDirectory}/pix/snaps" = {
	    id = "hyjdy-jlqjt";
	    label = "snaps";
            devices = [ "miyazu" ];
          };
          "${config.home.homeDirectory}/.local/share/password-store" = {
            id = "xvy6e-h6zgk";
	    label = "pass";
            devices = [ "miyazu" ];
          };
          "${config.home.homeDirectory}/.config/nixos" = {
	    id = "rsgvn-dhhxs";
	    label = "nixos";
	    devices = [ "miyazu" ];
	    versioning = {
	      type = "simple";
	      params.keep = "5";
	    };
	    "${config.home.homeDirectory}/pix/.Ali" = {
	      id = "kcz3h-t062i";
	      label = "Ali";
	      devices = [ "droid" ];
	    };
	  };
	};
      };
  };
}
