{ pkgs, ... }:
{
  imports = [
    ./style.nix
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        width = 1000;
        margin-left = 10;
        margin-right = 10;
        margin-top = 10;

        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [
          #"wlr/taskbar"
          "clock"
          "wireplumber"
          "network"
          "cpu"
          "memory"
          "tray"
        ];
        modules-right = [
        ];
        "cpu" = {
          format = "{usage}% ";
        };
        "memory" = {
          format = "{}% ";
        };
        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        "wireplumber" = {
          format = "{volume}% {icon} {format_source}";
        };

      };
    };
  };

  home.packages = with pkgs; [
    font-awesome
  ];
}
