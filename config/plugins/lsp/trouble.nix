{
  plugins.trouble = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "+diagnostics/quickfix";
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>TroubleToggle<cr>";
      options = {
        silent = true;
        desc = "Open/Close trouble in list(Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xw";
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      options = {
        silent = true;
        desc = "Workspace Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>TroubleToggle todo<cr>";
      options = {
        silent = true;
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble loclist<cr>";
      options = {
        silent = true;
        desc = "Location List (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>Trouble quickfix<cr>";
      options = {
        silent = true;
        desc = "Quickfix List (Trouble)";
      };
    }
  ];
}
