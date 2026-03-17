# Searches/Replaces in multiple files
{ ... }:
{
  plugins.grug-far.enable = true;

  keymaps = [
    {
      options.desc = "Search and Replace";
      key = "<leader>sr";
      mode = [
        "n"
        "x"
      ];
      action.__raw = ''
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil
            }
          })
        end
      '';
    }
  ];
}
