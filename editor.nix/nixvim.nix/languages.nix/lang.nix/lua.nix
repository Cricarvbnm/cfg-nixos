{ lib, pkgs, ... }:
{
  lsp.servers.lua_ls.enable = true;

  plugins.lint = {
    lintersByFt.lua = [ "luacheck" ];
    linters.luacheck = {
      cmd = lib.getExe pkgs.luaPackages.luacheck;
    };
  };

  plugins.conform-nvim.settings.formatters_by_ft.lua = [ "stylua" ];
}
