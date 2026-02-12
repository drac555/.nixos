{ pkgs, ... }:
{
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: FontAwesome, Terminus-TTF;
      font-size: 16px;
    }

    window#waybar {
      border: 2px solid @base02;
      color: @base08
    }
  '';
}
