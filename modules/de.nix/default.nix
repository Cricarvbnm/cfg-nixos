{ pkgs, ... }: {
  imports =
    [ ./modules/hyprland.nix ./modules/display-manager.nix ./modules/kde.nix ];
  environment.systemPackages = with pkgs; [ wl-clipboard wireshark ];

  programs.wireshark.enable = true;
  users.groups.wireshark.members = [ "alec" ];
}
