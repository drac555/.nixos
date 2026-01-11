{ config, pkgs, user, ... }:

{
  # Common home-manager configuration for all users/systems
  imports = [
    ../modules
    ./prismlauncher.nix
    ./yazi.nix
	./Hyprland
    ./stylix.nix

  ];
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.11";
  };
  home.sessionVariables = {
	EDITOR = "nvim";
	};

  # User packages
  home.packages = with pkgs; [
    
    hyfetch
    yazi
    mpv
    ashell
    grimblast
    
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
      rebuild = "f() {sudo nixos-rebuild switch --flake \"$1\"; }; f";
    };
  };

  programs.vesktop = {
    enable = true;
  };




  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
