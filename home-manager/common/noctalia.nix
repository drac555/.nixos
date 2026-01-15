{ ... }:
{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      location = {
        name = "Huntsville, Alabama";
        useFahrenheit = true;
        use12hourFormat = true;
      };
      
  };
    plugins = {
      sources = [
        {
        enabled = true;
        name = "Official Noctalia Plugins";
        url = "https://github.com/noctalia-dev/noctalia-plugins";
      }
    ];
    };
     };
}
