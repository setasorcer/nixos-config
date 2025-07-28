{
  description = "NixOS for Kyoko";

  # Cachix
  nixConfig = {
    extra-substituters = [ "https://ezkea.cachix.org" ];
    extra-trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    stylix.url = "github:danth/stylix";
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    username = "kyoko";
  in
  {
    nixosConfigurations = {
      miyazu = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/miyazu ];
        specialArgs = {
	  host = "miyazu";
          inherit self inputs username;
        };
      };
      itsuku = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/itsuku ];
	specialArgs = {
	  host = "itsuku";
	  inherit self inputs username;
	};
      };
    };
  };
}
