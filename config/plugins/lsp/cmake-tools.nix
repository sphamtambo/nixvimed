{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    cmake-tools-nvim
  ];

  extraConfigLua = ''
    require("cmake-tools").setup {
    cmake_command = "cmake", -- this is used to specify cmake command path
    ctest_command = "ctest", -- this is used to specify ctest command path
    cmake_build_directory = "build",
    cmake_build_options = { "-j4" },
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_console_size = 10, -- cmake output window height
    cmake_show_console = "always", -- "always", "only_on_error"
    cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "lldb",
        request = "launch",
        },
    cmake_dap_open_command = function()
        return require("dap").repl.open()
    end,
    }
  '';

  keymaps = [
    {
      mode = "";
      key = "<leader>cg";
      action = ":CMakeGenerate<cr>";
      options = {
        silent = true;
        desc = "configure and generate build system";
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
      key = "<leader>cx";
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

    {
      mode = "";
      key = "<leader>ct";
      action = ":CMakeRunTest<cr>";
      options = {
        silent = true;
        desc = "run ctest";
      };
    }
  ];
}
