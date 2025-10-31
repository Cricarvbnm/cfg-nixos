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

    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
