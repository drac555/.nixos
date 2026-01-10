{ config, lib, pkgs, user, ... }:

{
  # Common configuration shared across all systems
  # Can rely on flake inputs and external modules

  # Define your primary user
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" ];
    # Set your shell
    shell = pkgs.bash;
  };

  # System packages available on all systems
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    (python3.withPackages (p: [
        p.dbus-python
    ]))
  ];

  # Enable sudo for wheel group
  security.sudo.wheelNeedsPassword = false;

  # SSH configuration (optional)
  # services.openssh = {
  #   enable = true;
  #   settings.PermitRootLogin = "no";
  #   settings.PasswordAuthentication = false;
  # };
}
