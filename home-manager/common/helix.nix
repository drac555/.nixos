{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor.lsp = {
        enable = true;
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
  };

  home.packages = with pkgs; [
    nixd
    clang
    clang-tools
    lldb
    cmake
    cmake-format
    cmake-language-server
    sdl3
    sdl3-image
    sdl3-ttf
    sdl3-shadercross
  ];
}
