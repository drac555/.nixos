{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Host-specific configuration for evie-laptop

  # Add any laptop-specific packages
  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${stdenv.hostPlatform.system}.default
    # Add more packages here
  ];

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Laptop-specific services
  # services.logind.lidSwitch = "suspend";

  # Battery optimization
#  services.tlp.enable = true;

  # Touchpad support
	 # services.libinput.enable = true;
}
