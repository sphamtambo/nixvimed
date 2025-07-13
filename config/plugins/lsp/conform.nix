{pkgs, ...}: {
  extraPackages = with pkgs; [
    alejandra
    black
    #cmake-format
    #gofumpt
    # golines
    # google-java-format
    # gotools
    isort
    nodePackages.prettier
    prettierd
    #rustfmt
    #shfmt
    stylua
    taplo
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_options = {
        lsp_format = "fallback";
      };

      notify_on_error = true;

      formatters_by_ft = {
        # c = ["clang-format"];
        # cmake = ["cmake_format"];
        # cpp = ["clang-format"];
        css = [["prettierd" "prettier"]];
        # go = ["goimports" "gofumpt" "golines"];
        html = [["prettierd" "prettier"]];
        java = ["google-java-format"];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        json = [["prettierd" "prettier"]];
        lua = ["stylua"];
        markdown = [["prettierd" "prettier"]];
        nix = ["alejandra"];
        python = [["isort" "black"]];
        rust = ["rustfmt"];
        # sh = ["shfmt"];
        # toml = ["taplo"];
        typescript = [["prettierd" "prettier"]];
        typescriptreact = [["prettierd" "prettier"]];
        yaml = [["prettierd" "prettier"]];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }
    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];
}
