{ lib, pkgs, ... }:
{
  lsp.servers.jsonls.enable = true;

  plugins.lint = {
    lintersByFt.json = [ "jsonlint" ];
    linters.jsonlint = { cmd = lib.getExe pkgs.nodePackages.jsonlint; };
  };

  plugins.conform-nvim.settings.formatters_by_ft.json = [ "prettier" ];
}