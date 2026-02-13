{ ... }:
{
  programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 99.946;
      };
      position = {
        x = 1920;
        y = 0;
      };
      scale = 1.5;
    };
    "DP-2" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1.0;
    };
  };
}
