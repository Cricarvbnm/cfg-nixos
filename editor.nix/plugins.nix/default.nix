{ ... }:
{
  imports = [
    ./nvim-tree.nix
    ./coding.nix
  ];

  programs.nixvim.plugins = {
    lualine.enable = true;

    which-key.enable = true;

    bufferline.enable = true;
  };
}
