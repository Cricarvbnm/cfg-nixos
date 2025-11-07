{ pkgs, config, lib, ... }: {
  imports = [
    ./modules/display-manager.nix
    ./modules/hyprland.nix

    ./modules/vm.nix
    ./modules/file-manager.nix
    ./modules/flatpak.nix
    ./modules/fonts.nix
    ./modules/games.nix
    ./modules/im.nix
  ];

  environment.systemPackages = with pkgs; [ wl-clipboard wireshark ];

  # wireshark
  programs.wireshark.enable = true;
  users.groups.wireshark.members = [ config.mine.users.users.mainUser ];

  # Blueman
  services.blueman.enable = lib.mkDefault config.hardware.bluetooth.enable;
}
