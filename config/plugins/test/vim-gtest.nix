{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-gtest";
      src = pkgs.fetchFromGitHub {
        owner = "alepez";
        repo = "vim-gtest";
        rev = "41e299172401cd5549a3dc3542b9d4d9ffc8b50d";
        hash = "sha256-89bCMumhlUZN/+wJjcixqSxzOr6dv4pcF0cJHIXnv+M=";
      };
    })
  ];

  # FIX: fix an error when running vim-gtest
  extraConfigLua = ''
    vim.g['gtest#gtest_command'] = '../Debug/tests'
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>tg";
      action = ":GTestRunUnderCursor<cr>";
      options = {
        silent = true;
        desc = "Gtest run under cursor";
      };
    }
  ];
}
