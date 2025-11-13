{ ... }: {
  imports = [
    ./hardware-configuration.nix

    ./modules/de.nix
    ./modules/shell.nix
    ./modules/system.nix

    ./modules/hm.nix

    ./cachix.nix
  ];

  system.stateVersion = "25.05";
}
