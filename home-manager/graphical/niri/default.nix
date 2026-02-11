{ pkgs, ...}:
{
	imports = [

	];

	xdg.configFile."niri/config.kdl".source = ./conf/config.kdl;

	home.packages = with pkgs; [
		alacritty
		
		waybar

		fuzzel

		swaylock

		orca
	];

}
