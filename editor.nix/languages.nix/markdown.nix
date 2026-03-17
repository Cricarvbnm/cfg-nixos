{ ... }:
{
  programs.nixvim = {
    lsp.servers = {
      marksman.enable = true;
    };
    plugins = {
      conform-nvim.settings.formatters_by_ft.markdown = [ "prettier" ];
      render-markdown.enable = true;
    };
  };
}
