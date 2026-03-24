{
  lsp = {
    inlayHints.enable = true;
    servers = {
      # lua_ls is now configured in lang.nix/lua.nix
    };
  };
  plugins.lsp.enable = true;
}
