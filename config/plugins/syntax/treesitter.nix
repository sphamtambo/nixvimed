{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    settings = {
      indent = {
        enable = true;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          node_decremental = "<bs>";
        };
      };
    };
    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
