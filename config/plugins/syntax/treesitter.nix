{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    incrementalSelection = {
      enable = true;
      keymaps = {
        initSelection = {key = "<C-space>";};
        nodeIncremental = {key = "<C-space>";};
        nodeDecremental = {key = "<bs>";};
      };
    };
  };
}
