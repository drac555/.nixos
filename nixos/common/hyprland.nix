{pkgs, ...}:
{
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    wayland.enable = true;
    extraPackages = with pkgs; [ sddm-astronaut];

     };

  services.xserver.updateDbusEnvironment = true;

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "12";
      background = "${./Stylix/transdeer.png}";
      loginBackground = true;
    })
    sddm-astronaut
    
    grim
    grimblast
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprlauncher
    ashell
    kitty
    fnott
    
    wlr-randr
    libdisplay-info
    colord


  ];
}
