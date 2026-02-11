{ pkgs, ...}:
{
	imports = [

	];
	programs.niri = {
		enable = true;
		package = pkgs.niri-unstable;
	};

	environment.systemPackages = with pkgs; [

		gamescope
		wayland-utils
		wl-clipboard
		xwayland-satellite


	];

}
