{ pkgs, ...}:
{
	imports = [

	];

	programs.niri.enable = true;

	environment.systemPackages = with pkgs; [
		kitty

		fnott

		wofi
	];

}
