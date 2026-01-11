{
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
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: let

    inherit (self) outputs;

    commonInherits = {
        inherit (nixpkgs) lib;
        inherit inputs outputs nixpkgs home-manager;
        };

    user = "evie";
    #per-system home-manager modules go here >.<
    systems = {
        	nixos-btw-laptop = {
        homeModules = [

        ];
        	};
		      nixos-btw = {
        homeModules = [

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
