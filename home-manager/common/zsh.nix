{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
      ];

    };

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch";

    };
  };
}
