{pkgs, ...}: {
  extraPackages = with pkgs; [
    nodePackages.prettier
    prettierd
    alejandra
    black
    isort
    cmake-format
    stylua
  ];
  # TODO: Add more formatters

  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];
      javascript = [["prettierd" "prettier"]];
      javascriptreact = [["prettierd" "prettier"]];
      typescript = [["prettierd" "prettier"]];
      python = [["isort" "black"]];
      cpp = ["clang-format"];
      cmake = ["cmake_format"];
      lua = ["stylua"];
      nix = ["alejandra"];
      markdown = [["prettierd" "prettier"]];
      yaml = [["prettierd" "prettier"]];
      json = [["prettierd" "prettier"]];
      rust = ["rustfmt"];
      java = ["google-java-format"];
      go = [["goimports" "gofmt"]];
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
