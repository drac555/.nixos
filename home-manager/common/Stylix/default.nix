{ pkgs, ... }:
{
  stylix = {
    targets.firefox = {
      enable = true;
      profileNames = [ "evie" ];
      colorTheme.enable = true;
    };
    targets.niri.enable = true;
    image = ./resources/ohhmygsoh.jpg;
  };
}
