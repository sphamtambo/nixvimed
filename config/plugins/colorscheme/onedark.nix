{pkgs, ...}: {
  colorschemes.onedark = {
    enable = true;
    package = pkgs.vimPlugins.onedark-nvim;
  };
}
