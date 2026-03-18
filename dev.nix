{ pkgs, ... }:
let
  tex = pkgs.texliveSmall.withPackages (
    ps: with ps; [
      collection-langchinese
      latexmk
    ]
  );
in
{
  _module.args = {
    texlive = tex;
  };

  environment.systemPackages = with pkgs; [
    # Java
    jetbrains.idea
    jetbrains.jdk

    # Tex
    tex
  ];
}
