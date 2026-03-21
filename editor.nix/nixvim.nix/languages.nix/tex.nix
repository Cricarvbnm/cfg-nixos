{ self', ... }:
{
  plugins = {
    vimtex = {
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
  };
}
