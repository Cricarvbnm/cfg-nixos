{ pkgs, ... }: {
  imports = [
    ./modules/snapper.nix
    ./modules/boot.nix
    ./modules/docker.nix
    ./modules/i18n.nix
    ./modules/networking.nix
    ./modules/nix.nix
    ./modules/nixpkgs.nix
    ./modules/samba.nix
    ./modules/ssh.nix
    ./modules/time.nix
    ./modules/users.nix
    ./modules/cachix.nix

    # ./modules/vfio.nix
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
