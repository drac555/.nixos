{ pkgs, user, ... }:
{
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
    };
  };
  users.users.${user}.extraGroups = [ "gamemode" ];
}
