{ ... }:
{
  programs.nixvim = {
    lsp.servers.nil_ls.enable = true;

    plugins.none-ls.sources.formatting.nixfmt.enable = true;

    extraFiles."after/ftplugin/nix.lua".text = ''
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    '';
  };
}
