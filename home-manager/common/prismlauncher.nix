{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (prismlauncher.overide {
      jdks = [
        zulu25
      ];
    })
  ];
}
