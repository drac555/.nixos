{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Host-specific configuration for evie-laptop

  # Add any laptop-specific packages
  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    # Add more packages here
  ];

	fileSystems."/mnt/driveone" = {
		device = "/dev/disk/by-uuid/fe664b1c-b116-4bb5-98ed-a05f1cf67f7b";
		fsType = "btrfs";
	};


 }
