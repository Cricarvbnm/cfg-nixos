{ ... }:
{
  programs.nixvim = {
    imports = [
      ./nvim-tree.nix
      ./coding.nix
      ./editor.nix
      ./treesitter.nix
      ./ui.nix
    ];
  };
}
