{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cmake-tools-nvim
  ];

  extraConfigLua = ''
    require("cmake-tools").setup {
    cmake_command = "cmake", -- this is used to specify cmake command path
    ctest_command = "ctest", -- this is used to specify ctest command path
    }
  '';
  # TODO: add cmake, vim-gtest, keymaps
  keymaps = [
    {
      mode = "";
      key = "<leader>cg";
      action = ":CMakeGenerate<cr>";
      options = {
        silent = true;
        desc = "generate build system";
      };
    }

    {
      mode = "";
      key = "<leader>cb";
      action = ":CMakeBuild<cr>";
      options = {
        silent = true;
        desc = "compile/link targets";
      };
    }

    {
      mode = "";
      key = "<leader>cr";
      action = ":CMakeRun<cr>";
      options = {
        silent = true;
        desc = "run luanch-able target";
      };
    }

    {
      mode = "";
      key = "<leader>cr";
      action = ":CMakeClose<cr>";
      options = {
        silent = true;
        desc = "close cmake runner/executor window";
      };
    }

    {
      mode = "";
      key = "<leader>cc";
      action = ":CMakeClean<cr>";
      options = {
        silent = true;
        desc = "clean all targets, intermediates, deps";
      };
    }

    {
      mode = "";
      key = "<leader>cp";
      action = ":CMakeDebug<cr>";
      options = {
        silent = true;
        desc = "debug selected luanch-able target";
      };
    }
  ];
}
