# Shows active keybindings
{ ... }:
{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      defaults = { };
      spec.__raw = ''
        {
          mode = { "n", "x" },
          { "<leader>c", group = "code" },

          { "<leader>s", group = "search" },
          {"<leader>sn", group = "noice"},

          { "<leader>g", group = "git" },

          { "[", group = "prev" },
          { "]", group = "next" },

          { "<leader>x", group = "diagnostics/quickfix" },

          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
        }
      '';
    };
  };
}
