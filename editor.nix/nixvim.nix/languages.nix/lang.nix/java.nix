{ lib, pkgs, ... }:
{
  lsp.servers.jdtls.enable = true;

  plugins.lint = {
    lintersByFt.java = [ "pmd" ];
    linters.pmd = {
      cmd = lib.getExe' pkgs.pmd "pmd";
    };
  };

  plugins.conform-nvim.settings.formatters_by_ft.java = [ "google-java-format" ];
}
