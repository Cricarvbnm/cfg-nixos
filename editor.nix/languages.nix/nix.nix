{ ... }:
{
  programs.nixvim = {
    lsp.servers.nil_ls.enable = true;

    plugins.conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];

    extraFiles."after/ftplugin/nix.lua".text = ''
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    '';
  };
}
