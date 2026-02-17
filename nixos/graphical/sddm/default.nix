{ pkgs, ... }:
{

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";

  };

  environment.systemPackages = [
    pkgs.where-where-is-my-sddm-theme.override
    {
      themeConfig.General = {
        font = "Terminus-TTF";
        fontSize = "14";
      };
    }
  ];
}
