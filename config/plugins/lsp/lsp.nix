{
  plugins = {
    lsp-format = {
      enable = false; # Enable if you want lsp-format integration for none-ls
    };
    lsp = {
      enable = true;
      capabilities = "offsetEncoding = 'utf-16'";
      servers = {
        bashls = { enable = true; };
        # clangd = { enable = true; }; # installed via clang tools
        # cmake = { enable = true; };
        # csharp_ls = { enable = true; };
        # cssls = { enable = true; };
        dockerls = { enable = true; };
        emmet_ls = { enable = true; };
        gopls = { enable = true; };
        # graphql = { enable = true; };
        # hls = {
        #   enable = true;
        #   installGhc = true; # Automatically install GHC with HLS
        #   # ghcPackage = "ghc8107"; # Optional: specify GHC version
        # };
        html = { enable = true; };
        java_language_server = { enable = true; };
        jsonls = { enable = true; };
        lua_ls = { enable = true; };
        marksman = { enable = true; };
        nil_ls = { enable = true; };
        # prismals = { enable = true; };
        pyright = { enable = true; };
        ruff = {
        enable = true;
        package = null; 
         };

        # rust_analyzer = {
        #   enable = true;
        #   installCargo = true;
        #   installRustc = true;
        #   settings = {
        #     cargo.features = "all";
        #     procMacro = {
        #       enable = true;
        #     };
        #     checkOnSave = true;
        #     check = {
        #       command = "clippy";
        #     };
        #   };
        # };
        svelte = { enable = true; };
        tailwindcss = { enable = true; };
        taplo = { enable = true; };
        terraformls = { enable = true; };
        ts_ls = { enable = true; };
        yamlls = { enable = true; };
        zls = { enable = true; };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
          # Uncomment if you want signature help keybinding
          # "<C-k>" = {
          #   action = "signature_help";
          #   desc = "Signature Help";
          # };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    local lspconfig = require("lspconfig")
    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  '';
}

