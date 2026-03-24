{ lib, pkgs, ... }:
{
  lsp.servers.jsonls.enable = true;

  # JSON validation is provided by LSP (jsonls), no separate linter needed

  plugins.conform-nvim.settings.formatters_by_ft.json = [ "prettier" ];
}