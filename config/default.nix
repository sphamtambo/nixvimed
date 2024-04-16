{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./highlight.nix
    ./globals.nix

    ./plugins/colorscheme
    ./plugins/completion
    ./plugins/debug
    ./plugins/filetrees
    ./plugins/git
    ./plugins/lsp
    ./plugins/snippets
    ./plugins/statusline
    ./plugins/telescope
    ./plugins/treesitter
    ./plugins/ui
    ./plugins/utils
  ];
}
