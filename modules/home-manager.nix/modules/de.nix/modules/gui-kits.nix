{ config, pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      name = "Noto Serif CJK SC";
      package = pkgs.noto-fonts-cjk-serif;
    };
    cursorTheme = { inherit (config.home.pointerCursor) name package; };
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Catppuccin Macchiato Blue";
    package = pkgs.catppuccin-cursors.macchiatoBlue;

    gtk.enable = true;
  };
}
