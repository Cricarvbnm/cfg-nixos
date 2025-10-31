{ pkgs, ... }: {
  fonts = {
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-cjk-serif
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
