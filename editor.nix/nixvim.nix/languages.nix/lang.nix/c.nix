{ lib, pkgs, ... }:
{
  lsp.servers.clangd.enable = true;

  plugins.lint = {
    lintersByFt = {
      c = [ "cppcheck" ];
      cpp = [ "cppcheck" ];
    };
    linters.cppcheck = {
      cmd = lib.getExe' pkgs.cppcheck "cppcheck";
    };
  };

  plugins.conform-nvim = {
    settings.formatters_by_ft = {
      c = [ "clang-format" ];
      cpp = [ "clang-format" ];
    };
    settings.formatters = {
      clang-format = {
        command = lib.getExe' pkgs.clang-tools "clang-format";
      };
    };
  };
}
