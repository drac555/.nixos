{
    inputs,
    nixpkgs,
    home-manager,
    hostName,
    user,
    ...
}:

let
    commonNixOSModules = hostName: systemType: [
        {
            networking.hostName = hostName;
            nix.settings.experimental-features = ["nix-command" "flakes"];

            nixpkgs.overlays = [
        (final: prev: {
      nur = import inputs.nur {
        nurpkgs = prev;
        pkgs = prev;
      };
    })
      ];
        }

        ./hosts/${hostName}

        ./base.nix

        ./nixos/common

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
                home-manager.users.${user}.imports = [
                    ./home-manager/common
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
