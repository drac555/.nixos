{ pkgs, ...}:
{
	imports = [

	];
	programs.niri = {
		enable = true;

		xdg.configFile."niri/conf/config.kdl".source = ./config.kdl;
		};

	home.packages = with pkgs; [
		alacritty
		
		waybar

		fuzzel

		swaylock

		orca

}
