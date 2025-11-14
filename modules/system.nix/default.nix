{ pkgs, ... }: {
  imports = [
    ./snapper.nix
    ./boot.nix
    ./docker.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./samba.nix
    ./ssh.nix
    ./time.nix
    ./users.nix
    ./cachix.nix

    # ./vfio.nix
  ];

  system.autoUpgrade = {
    enable = true;
    persistent = false;
    operation = "boot";
    dates = "00:00";
  };

  services.logind.lidSwitch = "ignore";

  environment.systemPackages = with pkgs; [ ntfs3g ];
}
