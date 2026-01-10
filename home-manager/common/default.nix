{ config, pkgs, user, ... }:

{
  # Common home-manager configuration for all users/systems
  imports = [
    ../modules
  ];
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "26.1";
  };

  # User packages
  home.packages = with pkgs; [
    prismlauncher
    hyfetch
    yazi
    
    # Add common user packages here
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "drac555";
    userEmail = "evanmorrison25@gmail.com";  # Change this
  };

  # Bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      rebuild = "sudo nixos-rebuild switch --flake .#evie";
    };
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
