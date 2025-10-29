{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/network.nix
    ./modules/time.nix
    ./modules/i18n.nix
    ./modules/users.nix
    ./modules/git.nix
    ./modules/shell.nix

    ./modules/home-manager.nix
  ];

  environment.systemPackages = with pkgs; [ kitty ];

  services.openssh = {
    enable = true;
    settings = { PermitRootLogin = "yes"; };
  };

  system.stateVersion = "25.05";
}
