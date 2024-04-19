{
  plugins.todo-comments = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>t]";
      action = "<CMD>lua require('todo-comments').jump_next()<CR>";
      options = {desc = "Next Todo Comment";};
    }
    {
      mode = "n";
      key = "<leader>t[";
      action = "<CMD>lua require('todo-comments').jump_prev()<CR>";
      options = {desc = "Previous Todo Comment";};
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<CMD>TodoTelescope<CR>";
      options = {desc = "Show ToDos";};
    }
  ];
}
