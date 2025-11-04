{ pkgs, ... }:
let
  winfonts = pkgs.stdenv.mkDerivation {
    pname = "local-windows-fonts";
    version = "1.0";
    src = /storage/General/Fonts/winfonts;
    installPhase = ''
      runHook preInstall

      install -Dm644 $src/{*.ttc,*.ttf} -t $out/share/fonts/winfonts

      runHook postInstall
    '';
  };
in {
  fonts = {
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-cjk-serif
      winfonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans CJK TC" ];
        serif = [ "Noto Serif CJK SC" "Noto Serif CJK TC" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };
}
