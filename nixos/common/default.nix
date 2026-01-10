{ config, lib, pkgs, user, ... }:


{
  imports = [
    ./steam.nix
  ];
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_6_18;
    
  };

  networking.networkmanager = true;

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  environment.systemPackages = with pkgs; [
    killall
    wget
    gcc
    curl
    git
    btop
    (python3.withPackages (p: [
        p.dbus-python
    ]))
  ];

  security.sudo.wheelNeedsPassword = false;

   services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	services.desktopManager.plasma6.enable = true; 

  # SSH configuration (optional)
  services.openssh = {
  enable = true;
  settings.PermitRootLogin = "no";
  settings.PasswordAuthentication = false;
  };

  system.stateVersion = "26.1";
}
