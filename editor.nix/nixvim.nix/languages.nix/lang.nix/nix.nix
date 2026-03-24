{ lib, pkgs, ... }:
{
  lsp.servers.nil_ls.enable = true;

  plugins.lint = {
    lintersByFt.nix = [ "deadnix" "statix" ];
    linters = {
      deadnix = { cmd = lib.getExe pkgs.deadnix; };
      statix = { cmd = lib.getExe pkgs.statix; };
    };
  };

  plugins.conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];

  extraFiles."after/ftplugin/nix.lua".text = ''
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  '';
}