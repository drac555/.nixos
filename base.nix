{ config,lib, pkgs, ...}:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	services.desktopManager.plasma6.enable = true;

    system.stateVersion = "25.11";
}
