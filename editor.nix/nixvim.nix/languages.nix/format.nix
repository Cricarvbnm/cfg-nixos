{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings.format_on_save = {
      timeout_ms = 1000;
      lsp_format = "fallback";
    };
  };

  keymaps = [
    {
      options.desc = "Format";
      key = "<Leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
    }
  ];
}
