{
  lsp.servers.fish_lsp.enable = true;

  plugins.conform-nvim.settings.formatters_by_ft = {
    fish = [ "fish_indent" ];
  };

  extraFiles = {
    "after/ftplugin/fish.lua".text = ''
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    '';
  };
}
