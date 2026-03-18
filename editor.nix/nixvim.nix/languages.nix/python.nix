{ config, ... }:
{
  lsp.servers.ruff.enable = true;

  plugins = {
    conform-nvim.settings.formatters_by_ft.python = [ "black" ];

    dap-python.enable = config.plugins.dap.enable;
  };
}
