{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./highlight.nix
    ./globals.nix

    ./plugins/colorscheme
    ./plugins/completion
    ./plugins/debug
    ./plugins/file-explorer
    ./plugins/git
    ./plugins/lsp
    ./plugins/snippets
    ./plugins/statusline
    ./plugins/fuzzyfinder
    ./plugins/syntax
    ./plugins/terminal
    ./plugins/test
    ./plugins/ui
    ./plugins/utils
  ];
}
