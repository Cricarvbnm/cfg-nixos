{ config, ... }:
{
  programs.nixvim = {
    lsp.servers.ruff.enable = true;

    plugins = {
      conform-nvim.settings.formatters_by_ft.python = [ "black" ];

      dap-python.enable = config.programs.nixvim.plugins.dap.enable;
    };
  };
}
