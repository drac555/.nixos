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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  networking.networkmanager.enable = true;

  time.timeZone = "America/Indiana/Vincennes";

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

  	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		terminus_font
	];

	fonts.fontconfig.defaultFonts = {
		sansSerif = [ "Terminus" ];
		serif = [ "Terminus" ];
		monospace = ["Terminus" ];
	};

	fonts.fontconfig.enable = true;



  system.stateVersion = "25.11";
}
