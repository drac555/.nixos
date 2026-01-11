{ pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    settings = {
      sort_by = "natural";
      sort_sensitive = true;
      linemode = "none";
      show_hidden = true;
      show_symlink = true;
  };
  };

}
