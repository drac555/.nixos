{pkgs, ...}:
{
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato-rosewater";
    wayland.enable = true;
  };

  services.xserver.updateDbusEnvironment = true;

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    grim
    grimblast
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprlauncher
    ashell
    kitty

    wlsunset
    colord
    wlr-randr
    displaycal

  ];
}
