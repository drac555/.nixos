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
  programs.wezterm.enable = true;

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
      window-rules = [
        {
          matches = [
            { app-id = "^org\\.wezfurlong\\.wezterm$"; }
          ];
          default-column-width = { };
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          opacity = 1.0;
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "firefox$";
            }
          ];
          opacity = 1.0;
        }
        #generic stuff
        {
          opacity = 1.0;
          draw-border-with-background = false;

          clip-to-geometry = true;

          geometry-corner-radius = {

            bottom-left = 3.0;
            bottom-right = 3.0;
            top-left = 3.0;
            top-right = 3.0;

          };
        }

      ];
      layer-rules = [
        {
          opacity = 0.90;
        }
      ];
    };
  };

  home.packages = with pkgs; [

  ];

}
