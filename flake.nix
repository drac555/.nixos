{
	nixConfig = {
		substituters = [
			      "https://cache.nixos.org"
			      "https://nix-community.cachix.org"
			      "https://niri.cachix.org"

			];
			trusted-public-keys = [
				"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      				"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      				"niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
			];
		};
    inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        };
    nixvim.url = "github:mikaelfangel/nixvim-config";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
    	url = "github:sodiboo/niri-flake";
	};
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: let

    inherit (self) outputs;

    commonInherits = {
        inherit (nixpkgs) lib;
        inherit inputs outputs nixpkgs home-manager;
        };

    user = "evie";
    #per-system modules go here >.<
    systems = {
        	nixos-btw-laptop = {
        homeModules = [
		./home-manager/graphical
		./home-manager/gaming

        ];
	systemModules = [
		./nixos/graphical/niri

	];
        	};
		      nixos-btw = {
        homeModules = [
		./home-manager/graphical
		./home-manager/gaming

        ];
	systemModules = [
		./nixos/graphical
	];

		      };
	};
    mkSystem = host: system:
        import ./hosts.nix (commonInherits
            // {
                hostName = "${host}";
                user = system.user or user;
                }
                // system);
    in {
    nixosConfigurations = nixpkgs.lib.mapAttrs mkSystem systems;
    };
}
