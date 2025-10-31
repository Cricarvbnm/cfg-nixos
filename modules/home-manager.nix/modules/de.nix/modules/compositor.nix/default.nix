{ config, pkgs, ... }: {
  home.packages = with pkgs; [ hyprshot ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enableXdgAutostart = true;
    extraConfig = ''
      $hyprDir = ${config.xdg.configHome}/hypr
      $configDir = $hyprDir/hyprland.conf.d

      source = $configDir/*.hypr
    '';
  };

  xdg.configFile."hypr/hyprland.conf.d".source =
    config.lib.file.mkOutOfStoreSymlink ./hypr/hyprland.conf.d;

  services = {
    # Hyprpolkit
    hyprpolkitagent.enable = true;

    # Wallpaper
    hyprpaper = {
      enable = true;
      settings =
        let wallpaper = "/storage/General/Pictures/Wallpaper/133666467_p0.png";
        in {
          preload = [ wallpaper ];
          wallpaper = [ ", ${wallpaper}" ];

          ipc = "on";
          splash = false;
        };
    };
  };
}
