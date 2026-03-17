{ ... }:
{
  imports = [ ./snacks.nix ];

  plugins = {
    bufferline.enable = true;
    lualine.enable = true;
    noice.enable = true;
  };
}
