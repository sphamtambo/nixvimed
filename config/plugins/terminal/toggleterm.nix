{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = 15;
      open_mapping = "[[<c-\>]]"; # clr backslash
      hideNumbers = true;
      shadeTerminals = true;
      shading_factor = 2;
      startInInsert = true;
      terminalMappings = true;
      persistMode = true;
      insertMappings = true;
      closeOnExit = true;
      direction = "horizontal";
      autoScroll = true;
      shell = "zsh";
      floatOpts = {
        border = "curved";
        width = 80;
        height = 20;
        winblend = 0;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tm";
      action = "<CMD>ToggleTerm()<CR>";
      options = {
        desc = "Open/Close Toggleterm";
      };
    }
  ];

  extraConfigLua = ''
        require("toggleterm")
        -- termimal window mapping
    local keymap = vim.keymap

    function _G.set_terminal_keymaps()
    	-- keybind options
    	local opts = { noremap = true, silent = true, buffer = 0 }

    	-- keybinds
    	keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    	keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    	keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    	keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    	keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    	keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    	keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  '';
}
