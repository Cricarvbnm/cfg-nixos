{ config, ... }:
{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      texlivePackage = config._module.args.texlive;
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
  };

  environment.systemPackages = [
    config.programs.nixvim.plugins.vimtex.mupdfPackage
  ];
}
