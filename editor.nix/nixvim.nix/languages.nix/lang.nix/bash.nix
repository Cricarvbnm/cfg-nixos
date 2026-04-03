{
  lib,
  pkgs,
  ...
}:
rec {
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
    "after/ftplugin/sh.lua" = import ./utils.nix/opt-tab.nix { };
    "after/ftplugin/bash.lua" = extraFiles."after/ftplugin/sh.lua";
  };
}
