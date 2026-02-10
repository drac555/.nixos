{ config, pkgs, nixpkgs, ... }:
{
	programs.firefox = {
		enable = true;
		profiles.evie = {
			isDefault = true;
			extensions = {
				force = true;
				packages = with pkgs.nur.repos.rycee.firefox-addons; [
					ublock-origin
					bitwarden
					unpaywall
					violentmonkey	
					seventv
					firefox-color
					duckduckgo-privacy-essentials
					sidebery
					auto-tab-discard
				];
			};
		};
	};
}
