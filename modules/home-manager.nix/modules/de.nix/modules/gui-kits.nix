{ config, pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    name = "Catppuccin Macchiato Blue";
    package = pkgs.catppuccin-cursors.macchiatoBlue;

    gtk.enable = true;
  };

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

  home.packages = with pkgs; [ qt6ct catppuccin-kvantum ];
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
      # package = pkgs.qtstyleplugin-kvantum; # Auto Detect
    };
  };
}
