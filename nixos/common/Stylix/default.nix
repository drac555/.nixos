{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/macintosh.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.apple-cursor;
      name = "Apple-Cursor";
    };

    image = ./resources/ohhmygsoh.jpg;

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
