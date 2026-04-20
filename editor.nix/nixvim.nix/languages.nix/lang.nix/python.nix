{
  lib,
  pkgs,
  config,
  ...
}:
{
  lsp.servers.pyright.enable = true;

  plugins.lint = {
    lintersByFt.python = [ "pylint" ];
    linters.pylint = {
      cmd = lib.getExe pkgs.pylint;
    };
  };

  plugins = {
    conform-nvim.settings.formatters_by_ft.python = [ "black" ];

    dap-python.enable = config.plugins.dap.enable;
  };
}
