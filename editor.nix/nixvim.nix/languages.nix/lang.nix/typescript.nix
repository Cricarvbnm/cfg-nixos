{
  lsp.servers = {
    ts_ls.enable = true;
    biome.enable = true;
  };

  plugins.conform-nvim.settings.formatters_by_ft = {
    typescript = [ "prettier" ];
    typescriptreact = [ "prettier" ];
    javascript = [ "prettier" ];
    javascriptreact = [ "prettier" ];
  };
}
