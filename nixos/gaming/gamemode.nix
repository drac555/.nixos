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
  users.user.${user} = {
    extraGroups = [
      "gamemode"
    ];
  };
}
