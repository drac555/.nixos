{ pkgs, ... }:
{
  programs.niri.settings = {

    input.keyboard.xkb.layout = "us";

    binds = {
      "Mod+T".action.spawn = "alacritty";
      "Mod+Q".action.close-window = [ ];
      "Mod+D".action.spawn = "fuzzel";
      "Mod+Shift+F".action.fullscreen-window = { };
      "Mod+F".action.maximize-column = { };
    };
  };
}
