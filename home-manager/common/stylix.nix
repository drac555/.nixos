{ pkgs, ...}:
{
  stylix = {
    targets.firefox = {
    enable = true;
    profileNames = [ "evie" ];
      colorTheme.enable = true;
  };
  };
}
