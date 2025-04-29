{ pkgs, config, lib, ... }:

{
  programs.floorp = {
    enable = true;
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "${config.home.homeDirectory}/";
    };
    profiles."default" = {
      containers = {
        "Personal" = {
	  color = "blue";
	  icon = "fingerprint";
	  id = 1;
	};
	"School" = {
	  color = "red";
	  icon = "fruit";
	  id = 2;
	};
	"Business" = {
	  color = "green";
	  icon = "dollar";
	  id = 3;
	};
      };
      containersForce = true;
      settings = {
        "media.hardware-video-decoding.force-enabled" = true;
      };
    };
  };
}
