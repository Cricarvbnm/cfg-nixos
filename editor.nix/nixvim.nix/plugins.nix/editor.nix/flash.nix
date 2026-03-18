# Enhanced seach functionality
{ ... }:
{
  plugins.flash.enable = true;

  keymaps = [
    {
      options.desc = "Flash";
      key = "s";
      mode = [
        "n"
        "x"
        "o"
      ];
      action = "<cmd>lua require('flash').jump()<cr>";
    }
  ];
}
