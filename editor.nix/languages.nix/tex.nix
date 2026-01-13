{ pkgs, config, ... }:
let
  tex = pkgs.texliveSmall.withPackages (
    ps: with ps; [
      collection-langchinese
      latexmk
    ]
  );
in
{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = tex;
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
    cmp-vimtex.enable = true;
  };

  environment.systemPackages = [
    tex
    config.programs.nixvim.plugins.vimtex.mupdfPackage
  ];
}
