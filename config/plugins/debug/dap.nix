{pkgs, ...}: {
  extraPackages = with pkgs; [
    lldb_17
    netcoredbg
  ];
  # FIX: fix c# dap

  # Explicitly enable web-devicons to avoid deprecation warning
  plugins.web-devicons.enable = true;

  plugins.dap = {
    enable = true;
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    # adapters.executables.lldb.command = "lldb-vscode";
  };

  # Use the new plugin names (no longer under dap.extensions)
  plugins.dap-go = {
    enable = true;
    settings.delve.path = "${pkgs.delve}/bin/dlv";
  };

  plugins.dap-python.enable = true;
  plugins.dap-virtual-text.enable = true;

  plugins.dap-ui = {
    enable = true;
    settings.floating.mappings = {
      close = ["<ESC>" "q"];
    };
  };

  # TODO: use codelldb adapter to activate cmake dap config
  extraConfigLua = ''

    local dap = require('dap')
    dap.set_log_level('DEBUG')

    dap.adapters.lldb = {
      type = 'executable',
      -- command = '${pkgs.lldb}/bin/lldb-vscode',
      command = 'lldb-vscode',
      name = 'lldb'
    }

    dap.adapters.coreclr = {
      type = 'executable',
      -- command = '${pkgs.netcoredbg}/bin/netcoredbg',
      command = 'netcoredbg',
      name = 'coreclr',
      args = {'--interpreter=vdcode'},
    }

    dap.configurations.cpp = {
     {
       name = "Launch",
       type = "lldb",
       request = "launch",
       program = function()
         -- return vim.fn.input('Path of the executable: ', vim.fn.getcwd() .. '/', 'file')
          return vim.fn.input('program: ', vim.fn.getcwd() .. '/' .. vim.fn.expand('%:t:r'), 'file')
       end,
       cwd = "''${workspaceFolder}",
       terminal = 'integrated',
       console = 'integratedTerminal',
       stopOnEntry = false,
       args = {},
     },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    dap.configurations.zig = dap.configurations.cpp

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to the executable: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
       cwd = "''${workspaceFolder}",
       stopOnEntry = false,
       args = {},
      },
    }


  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>dB";
      action = "
        <cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
      ";
      options = {
        silent = true;
        desc = "Breakpoint Condition";
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = "<cmd>lua require('dap').run_to_cursor()<cr>";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = "<cmd>lua require('dap').goto_()<cr>";
      options = {
        silent = true;
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = "
        <cmd>lua require('dap').down()<cr>
      ";
      options = {
        silent = true;
        desc = "Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = "<cmd>lua require('dap').up()<cr>";
      options = {
        silent = true;
        desc = "Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "<cmd>lua require('dap').run_last()<cr>";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = "<cmd>lua require('dap').pause()<cr>";
      options = {
        silent = true;
        desc = "Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":DapToggleRepl<cr>";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<cmd>lua require('dap').session()<cr>";
      options = {
        silent = true;
        desc = "Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options = {
        silent = true;
        desc = "Dap UI";
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
      options = {
        silent = true;
        desc = "Widgets";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>de";
      action = "<cmd>lua require('dapui').eval()<cr>";
      options = {
        silent = true;
        desc = "Eval";
      };
    }
  ];
}
