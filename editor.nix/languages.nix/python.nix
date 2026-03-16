{ ... }:
{
  programs.nixvim = {
    lsp.servers = {
      pyright.enable = true;
      ruff.enable = true;
    };

    plugins = {
      dap.enable = true;
      dap-python.enable = true;
    };
  };
}
