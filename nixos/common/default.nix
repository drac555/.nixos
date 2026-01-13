{ config, lib, pkgs, inputs,  user, ... }:


{
  imports = [
    ./steam.nix
    ./hyprland.nix
	./Stylix
    ./prism.nix
  ];
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_6_18;
    
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
    pulseaudio
    btop
    (python3.withPackages (p: [
        p.dbus-python
    ]))
  ];

	environment.variables = {
	EDITOR = "nvim";	
	};

  security.sudo.wheelNeedsPassword = false;
   # SSH configuration (optionali)
  services.openssh = {
  enable = true;
  settings.PermitRootLogin = "no";
  settings.PasswordAuthentication = false;
  };

  services.colord.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
}; 

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      terminus_font
      terminus_font_ttf
	];

	fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Terminus" ];
      serif = [ "Terminus" ];
      monospace = ["Terminus" ];
	};

    };
  };
  
  system.stateVersion = "25.11";
}
