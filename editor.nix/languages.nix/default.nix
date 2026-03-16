{ ... }:
{
  imports = [
    ./nix.nix
    ./tex.nix
    ./markdown.nix
    ./python.nix
  ];

  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;
      keymaps = [
        {
          key = "<Leader>cf";
          lspBufAction = "format";
        }
      ];
      servers = {
        lua_ls.enable = true;
      };
    };

    plugins = {
      lsp.enable = true;

      none-ls = {
        enable = true;
        luaConfig.pre = "local augroup = vim.api.nvim_create_augroup('LspFormatting', {})";
        settings = {
          on_attach = ''
            function(client, bufnr)
              if client.supports_method("textDocument/formatting") then
                  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                  vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
                  })
              end
            end
          '';
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "async_path"; }
            { name = "nvim_lsp_signature_help"; }
          ];
          mapping = {
            __raw = ''
                cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-S-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping.confirm({select=true}),
              })
            '';
          };
        };
      };
    };
  };
}
