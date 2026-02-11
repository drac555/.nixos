{pkgs, ...}:
{
	programs.waybar = {
		enable = true;
		};

	home.packages = with pkgs; [
		font-awesome
		];
}
