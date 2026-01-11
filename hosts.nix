{
    inputs,
    nixpkgs,
    home-manager,
    hostName,
    user,
    homeModules ? [],
    ...
}:

let
    commonNixOSModules = hostName: systemType: [
        {
            networking.hostName = hostName;
            nix.settings.experimental-features = ["nix-command" "flakes"];
            
            nixpkgs = {
              config = { allowBroken = true; allowUnfree = true; };
              overlays = import ./overlays { inherit inputs; };
      };
    }
    
        ./nixos/common
        
        ./hosts/${hostName}

        inputs.stylix.nixosModules.stylix

    ];

    mkHost = hostName: user:
        nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = commonNixOSModules hostName "x86_64-linux"
            ++ [
            home-manager.nixosModules.home-manager
            {
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                    inherit (inputs) nix-colors;
                    inherit user;
                };

                home-manager.useUserPackages = true;
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.${user}.imports = [
                    ./home-manager/common
                    ./hosts/${hostName}/home.nix
                    
                ];
                }
            ];
        specialArgs = {
            inherit inputs;
            inherit user;
    };
};
in
    mkHost hostName user
