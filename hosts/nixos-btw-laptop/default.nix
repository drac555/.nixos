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

  # Laptop-specific services
  # services.logind.lidSwitch = "suspend";

  # Battery optimization
#  services.tlp.enable = true;

  # Touchpad support
	 # services.libinput.enable = true;
}
