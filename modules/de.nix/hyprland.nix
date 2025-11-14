{ pkgs, ... }: {
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
