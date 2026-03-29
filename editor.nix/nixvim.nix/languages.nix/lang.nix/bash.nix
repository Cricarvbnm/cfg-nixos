{
  lib,
  pkgs,
  config,
  ...
}:
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

  extraFiles = {
    "after/ftplugin/sh.lua".text = ''
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    '';

    "after/ftplugin/bash.lua".text = config.extraFiles."after/ftplugin/sh.lua".text;
  };
}
