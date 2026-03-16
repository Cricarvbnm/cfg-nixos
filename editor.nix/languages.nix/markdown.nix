{ ... }:
{
  programs.nixvim = {
    lsp.servers = {
      marksman.enable = true;
    };
    plugins = {
      none-ls.sources.formatting.prettier.enable = true;
      render-markdown.enable = true;
    };
  };
}
