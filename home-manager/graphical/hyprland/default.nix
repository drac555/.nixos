{ ... }:
{
  wayland.windowManager.hyprland = {
	enable = true;
	extraConfig = builtins.readFile ./hyprland.conf;
	};

programs = {
	kitty.enable = true;
	wofi.enable = true;
	btop.enable = true;
  ashell.enable = true;
	};
}
