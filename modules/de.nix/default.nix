{ pkgs, ... }: {
  imports =
    [ ./modules/hyprland.nix ./modules/display-manager.nix ./modules/kde.nix ];
  environment.systemPackages = with pkgs; [ wl-clipboard ];
}
