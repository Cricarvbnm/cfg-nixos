{ lib, pkgs, ... }:
{
  lsp.servers.bashls.enable = true;

  plugins.lint = {
    lintersByFt = {
      sh = [ "shellcheck" ];
      bash = [ "shellcheck" ];
    };
    linters.shellcheck = {
      cmd = lib.getExe pkgs.shellcheck;
    };
  };

  plugins.conform-nvim.settings.formatters_by_ft = {
    sh = [ "shfmt" ];
    bash = [ "shfmt" ];
  };
}
