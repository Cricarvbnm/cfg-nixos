{
  imports = [
    ./nix.nix
    ./tex.nix
    ./markdown.nix
    ./python.nix
    ./java.nix
  ];

  lsp = {
    inlayHints.enable = true;
    servers = {
      lua_ls.enable = true;
    };
  };

  plugins = {
    lsp.enable = true;

    dap.enable = true;
    dap-ui.enable = true;

    conform-nvim = {
      enable = true;
      autoInstall.enable = true;
      settings.format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
    };

    blink-cmp = {
      enable = true;
      settings = {
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
        snippets = {
          preset = "default";
        };
        keymap = {
          preset = "super-tab";
          "<c-'>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
        };
      };
    };
    blink-cmp-copilot.enable = true;
  };

  keymaps = [
    {
      options.desc = "Format";
      key = "<Leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
    }

    {
      options.desc = "Run/Continue";
      key = "<leader>dc";
      action.__raw = ''
        function() require('dap').continue() end
      '';
    }
    {
      options.desc = "Run Last";
      key = "<leader>dl";
      action.__raw = ''
        function() require('dap').run_last() end
      '';
    }
    {
      options.desc = "Run with Args";
      key = "<leader>da";
      action.__raw = ''
        function() require('dap').continue({ before = get_args }) end
      '';
    }
    {
      options.desc = "Terminate";
      key = "<leader>dt";
      action.__raw = ''
        function() require('dap').terminate() end
      '';
    }
    {
      options.desc = "Pause";
      key = "<leader>dP";
      action.__raw = ''
        function() require('dap').pause() end
      '';
    }

    {
      options.desc = "Run to Cursor";
      key = "<leader>dC";
      action.__raw = ''
        function() require('dap').run_to_cursor() end
      '';
    }
    {
      options.desc = "Go to Line (No Execute)";
      key = "<leader>dg";
      action.__raw = ''
        function() require('dap').goto_() end
      '';
    }

    {
      options.desc = "Step Into";
      key = "<leader>di";
      action.__raw = ''
        function() require('dap').step_into() end
      '';
    }
    {
      options.desc = "Step Out";
      key = "<leader>do";
      action.__raw = ''
        function() require('dap').step_out() end
      '';
    }
    {
      options.desc = "Step Over";
      key = "<leader>dO";
      action.__raw = ''
        function() require('dap').step_over() end
      '';
    }

    {
      options.desc = "Down";
      key = "<leader>dj";
      action.__raw = ''
        function() require('dap').down() end
      '';
    }
    {
      options.desc = "Up";
      key = "<leader>dk";
      action.__raw = ''
        function() require('dap').up() end
      '';
    }

    {
      options.desc = "Breakpoint Condition";
      key = "<leader>dB";
      action.__raw = ''
        function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end
      '';
    }
    {
      options.desc = "Toggle Breakpoint";
      key = "<leader>db";
      action.__raw = ''
        function() require('dap').toggle_breakpoint() end
      '';
    }

    {
      options.desc = "Toggle REPL";
      key = "<leader>dr";
      action.__raw = ''
        function() require('dap').repl.toggle() end
      '';
    }
    {
      options.desc = "Session";
      key = "<leader>ds";
      action.__raw = ''
        function() require('dap').session() end
      '';
    }

    {
      options.desc = "Widgets";
      key = "<leader>dw";
      action.__raw = ''
        function() require('dap.ui.widgets').hover() end
      '';
    }
    {
      options.desc = "Dap UI";
      key = "<leader>du";
      action.__raw = ''
        function() require('dapui').toggle() end
      '';
    }
    {
      options.desc = "Eval";
      key = "<leader>de";
      action.__raw = ''
        function() require('dapui').eval() end
      '';
    }
  ];
}
