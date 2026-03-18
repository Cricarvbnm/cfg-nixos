{
  imports = [
    ./snacks.nix
    ./noice.nix
  ];

  plugins = {
    bufferline.enable = true;
    lualine.enable = true;
  };
}
