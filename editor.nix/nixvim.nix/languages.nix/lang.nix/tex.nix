{ self', ... }:
{
  # LSP: texlab (补全 + 诊断 + chktex linter)
  lsp.servers.texlab.enable = true;

  # Formatter: latexindent
  plugins.conform-nvim.settings.formatters_by_ft.tex = [ "latexindent" ];

  # Linter: chktex (通过 texlab 内置支持)

  plugins.vimtex = {
    enable = true;
    texlivePackage = self'.packages.texlive;
    settings = {
      compiler_method = "latexmk";
      compiler_latexmk = {
        options = [
          "-pdf"
          "-xelatex"
          "-shell-escape"
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
        ];
        callback = 1;
        continuous = 1;
        executable = "latexmk";
      };
      view_method = "mupdf";
    };
  };
}