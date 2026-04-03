{
  lsp.servers.jsonls.enable = true;

  plugins.conform-nvim.settings.formatters_by_ft.json = [ "prettier" ];

  extraFiles."after/ftplugin/json.lua" = import ./utils.nix/opt-tab.nix;
}
