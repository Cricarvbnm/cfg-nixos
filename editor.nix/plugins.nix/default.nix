{ ... }:
{
  programs.nixvim = {
    imports = [
      ./nvim-tree.nix
      ./coding.nix
      ./editor.nix
    ];

    plugins = {
      lualine.enable = true;

      bufferline.enable = true;
    };
  };
}
