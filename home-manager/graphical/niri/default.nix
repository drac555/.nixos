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
  programs.kitty.enable = true;

  programs.niri = {
    settings = {

      environment."NIXOS_OZONE_WL" = "1";

      layout = {

        border = {
          enable = true;
          width = 2;
        };
        shadow = {
          enable = false;
          softness = 30;
          spread = 5;

        };
      };
      animations = {
        enable = true;
        slowdown = 3.0;
      };
    };
  };

  home.packages = with pkgs; [

  ];

}
