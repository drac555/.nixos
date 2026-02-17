{ pkgs, ... }:
{

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";

  };

  environment.systemPackages = [
    pkgs.where-is-my-sddm-theme

  ];
}
