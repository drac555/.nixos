{ pkgs, ...}:
{
	imports = [
		./prism.nix
	];

	home.packages = with pkgs; [
		ckan
		];

}
