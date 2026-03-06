{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./waybar
    ./niri
    ./awww
    ./krita
  ];

}
