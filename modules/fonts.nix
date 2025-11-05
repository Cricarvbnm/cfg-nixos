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
  sarasa-term-sc-nerd = pkgs.stdenv.mkDerivation {
    pname = "test";
    version = "1";
    src = /storage/General/Fonts/SarasaTermSCNerd;
    installPhase =
      "install -Dm644 *.ttf -t $out/share/fonts/truetype/NerdFonts/SarasaTermSCNerd";
  };
in {
  fonts = {
    packages = [
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-cjk-serif
      winfonts
      sarasa-term-sc-nerd
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans CJK TC" ];
        serif = [ "Noto Serif CJK SC" "Noto Serif CJK TC" ];
        monospace = [ "Sarasa Term SC Nerd" ];
      };
    };
  };
}
