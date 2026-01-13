{ ... }: {
  imports = [ ./nvim-tree.nix ];

  programs.nixvim.plugins = {
    lualine.enable = true;

    which-key.enable = true;

    bufferline.enable = true;
  };
}
