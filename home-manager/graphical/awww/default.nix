{ inputs, pkgs, ... }:

let
  awww = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
  wallpaperDir = ./resources; # folder with your gifs/images

  # Script that picks a random wallpaper from the folder
  cycleWallpaper = pkgs.writeShellScript "cycle-wallpaper" ''
    WALLPAPER=$(${pkgs.findutils}/bin/find ${wallpaperDir} -type f \
      \( -name "*.gif" -o -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) \
      | ${pkgs.coreutils}/bin/shuf -n 1)

    ${awww}/bin/awww img "$WALLPAPER" --transition-type random
  '';
in
{
  home.packages = [ awww ];

  # Daemon service
  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "awww wallpaper daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Service that runs the cycle script
  systemd.user.services.awww-cycle = {
    Unit = {
      Description = "Cycle wallpaper with awww";
      After = [ "awww-daemon.service" ];
      Wants = [ "awww-daemon.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
      ExecStart = "${cycleWallpaper}";
    };
  };

  # Timer that triggers the cycle service every 5 minutes
  systemd.user.timers.awww-cycle = {
    Unit.Description = "Cycle wallpaper every 5 minutes";
    Timer = {
      OnBootSec = "10s"; # first run 10 seconds after login
      OnUnitActiveSec = "5m"; # then every 5 minutes
      Unit = "awww-cycle.service";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
