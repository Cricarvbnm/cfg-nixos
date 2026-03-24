{ lib, pkgs, ... }:
{
  lsp.servers.marksman.enable = true;

  plugins.lint = {
    lintersByFt.markdown = [ "vale" ];
    linters.vale = { cmd = lib.getExe pkgs.vale; };
  };

  plugins = {
    conform-nvim.settings.formatters_by_ft.markdown = [ "prettier" ];
    render-markdown.enable = true;
  };
}