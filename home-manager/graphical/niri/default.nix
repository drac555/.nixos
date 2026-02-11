{
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./keybindings.nix
  ];

  programs.fuzzel.enable = true;

  programs.niri = {
    settings = {
      spawn-at-startup = [
        { argv = [ "waybar" ]; }
      ];
      layout = {
        focus-ring = {
          enable = true;
          width = 4;
        };
        border = {
          enable = true;
          width = 2;
        };
      };
    };
  };

  home.packages = with pkgs; [
    alacritty

    waybar

    fuzzel

    swaylock

    orca
  ];

}
