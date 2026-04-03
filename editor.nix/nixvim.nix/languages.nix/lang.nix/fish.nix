{
  lsp.servers.fish_lsp.enable = true;

  plugins.conform-nvim.settings.formatters_by_ft = {
    fish = [ "fish_indent" ];
  };

  extraFiles = {
    "after/ftplugin/fish.lua" = import ./utils.nix/opt-tab.nix { };
  };
}
