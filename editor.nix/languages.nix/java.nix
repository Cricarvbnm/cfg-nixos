{ ... }:
{
  programs.nixvim = {
    lsp.servers.jdtls.enable = true;
    plugins.none-ls.sources.formatting.google_java_format.enable = true;
  };
}
