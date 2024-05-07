{...}: {
  plugins = {
    codeium-nvim = {
      enable = true;
      extraOptions = {
        enable_chat = true;
      };
    };
  };

  keymaps = [
    {
      mode = "i";
      key = "<leader>a";
      action = "+codeium";
      options = {
        silent = true;
        desc = "codeium";
      };
    }
    {
      mode = "i";
      key = "<leader>ae";
      action = "<cmd>codeium#Accept()<cr>";
      options = {
        silent = true;
        desc = "Insert suggestion";
      };
    }
    {
      mode = "i";
      key = "<leader>af";
      action = "<cmd>codeium#CycleCompletions(1)<cr>";
      options = {
        silent = true;
        desc = "Next suggestion";
      };
    }
    {
      mode = "i";
      key = "<leader>ad";
      action = "<cmd>codeium#CycleCompletions(-1)<cr>";
      options = {
        silent = true;
        desc = "Previous suggestion";
      };
    }
    {
      mode = "i";
      key = "<leader>ac";
      action = "<cmd>codeium#Clear()<cr>";
      options = {
        silent = true;
        desc = "Clear current suggestion";
      };
    }
    {
      mode = "i";
      key = "<leader>ad";
      action = "<cmd>codeium#Complete()<cr>";
      options = {
        silent = true;
        desc = "Manually trigger suggestion";
      };
    }
  ];
}
