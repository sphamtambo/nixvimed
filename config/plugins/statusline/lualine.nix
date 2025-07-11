{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        icons_enabled = true;
        globalstatus = true;
        theme = "dracula";
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = ["dashboard" "alpha"];
        };
        refresh = {
          statusline = 1000;
          tabline = 1000;
          winbar = 1000;
        };
      };

      extensions = ["neo-tree" "nvim-dap-ui" "toggleterm" "quickfix" "fzf"];

      sections = {
        lualine_c = ["filename"];
        lualine_x = ["location"];
      };

      tabline = {};
      winbar = {};
      inactive_winbar = {};
    };
  };
}
