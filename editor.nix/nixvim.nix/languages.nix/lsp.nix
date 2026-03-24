{
  lsp = {
    inlayHints.enable = true;
    servers = {
      # lua_ls is now configured in lang.nix/lua.nix
    };
  };
  plugins.lsp = {
    enable = true;
    keymaps = {
      silent = true;
      lspBuf = {
        gd = "definition";
        gD = "declaration";
        gr = "references";
        gi = "implementation";
        gt = "type_definition";
        "<leader>ca" = "code_action";
        "<leader>cr" = "rename";
      };
    };
  };
}
