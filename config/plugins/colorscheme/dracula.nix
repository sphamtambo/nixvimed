{pkgs, ...}: {
  colorschemes.dracula = {
    enable = true;
    package = pkgs.vimPlugins.dracula-nvim;
  };
}
