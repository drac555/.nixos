{
  config,
  lib,
  pkgs,
  inputs,
  user,
  ...
}:

{
  imports = [
    ./Stylix
    ./zsh.nix
  ];
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxKernel.packages.linux_6_18;

  };

  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  location.provider = "geoclue2";

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    killall
    wget
    gcc
    curl
    helix
    unzip
    ripgrep
    sdl3
    sdl3-image
    sdl3-shadercross
    sdl3-ttf
    btop
    (python3.withPackages (p: [
      p.dbus-python
    ]))
  ];

  security.sudo.wheelNeedsPassword = false;

  services.tailscale.enable = true;
  networking.firewall = {
    trustedInterfaces = [ "tailscale0 " ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
  # SSH configuration (optionali)
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };

  services.colord.enable = true;

  services.geoclue2.enable = true;
  services.localtimed.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services = {
    fail2ban.enable = true;

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
        monospace = [ "Terminus" ];
      };

    };
  };

  system.stateVersion = "25.11";
}
