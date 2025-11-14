{ pkgs, config, lib, ... }: {
  imports = [
    ./display-manager.nix
    # ./hyprland.nix
    ./niri.nix

    ./sunshine.nix
    ./waydroid.nix
    ./vm.nix
    ./file-manager.nix
    ./flatpak.nix
    ./fonts.nix
    ./games.nix
    ./im.nix
  ];

  environment.systemPackages = with pkgs; [ wl-clipboard wireshark ];

  # wireshark
  programs.wireshark.enable = true;
  users.groups.wireshark.members = [ config.mine.users.users.mainUser ];

  # Blueman
  services.blueman.enable = lib.mkDefault config.hardware.bluetooth.enable;
}
