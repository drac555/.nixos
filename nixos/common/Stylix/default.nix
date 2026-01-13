{ pkgs, ...}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "light";
    cursor = {
      package = pkgs.catppuccin-cursors.macchiatoRosewater;
      name = "catppuccin-macchiato-rosewater-cursors";
      size = 24;
  };

    image = ./transdeer.png;
    
    fonts = {
        sansSerif = {
          package = pkgs.terminus_font_ttf;
          name = "Terminus (TTF)";
        };
        serif = {
          package = pkgs.terminus_font_ttf;
          name = "Terminus (TTF)";
        };
        monospace = {
          package = pkgs.terminus_font_ttf;
          name = "Terminus (TTF)";
        };
      };


  };



}
