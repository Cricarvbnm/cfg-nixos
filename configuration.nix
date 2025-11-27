{ config, ... }:
let
  inputs = {
    nixpkgs-stable = import <nixos-stable> { config = config.nixpkgs.config; };
  };
in {
  imports = [
    ./hardware-configuration.nix

    ./modules/de.nix
    ./modules/shell.nix
    ./modules/system.nix

    ./modules/hm.nix

    ./cachix.nix
  ];

  _module.args = { inherit inputs; };

  system.stateVersion = "25.05";
}
