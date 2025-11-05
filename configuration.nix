{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/network.nix
    ./modules/time.nix
    ./modules/users.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/ssh.nix
    ./modules/de.nix
    ./modules/nixpkgs.nix
    ./modules/keybindings.nix
    ./modules/i18n.nix
    ./modules/fonts.nix
    ./modules/samba.nix
    ./modules/docker.nix
    ./modules/virtual.nix
    ./modules/system.nix
    ./modules/dev.nix
    ./modules/archive.nix
    ./modules/games.nix
    ./modules/flatpak.nix

    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
