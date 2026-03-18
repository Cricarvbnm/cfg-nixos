{ ... }:
{
  imports = [
    ./nix.nix
    ./tex.nix
    ./markdown.nix
    ./python.nix
    ./java.nix
  ];

  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;
      servers = {
        lua_ls.enable = true;
      };
    };

    plugins = {
      lsp.enable = true;

      dap.enable = true;

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
    ];
  };
}
