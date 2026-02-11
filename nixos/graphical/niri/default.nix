{ pkgs, ...}:
{
	imports = [

	];
	programs.niri.enable = true;

	environment.systemPackages = with pkgs; [


	];

}
