{
  imports = [
    ./networkmanager.nix
    ./proxy.nix
  ];

  networking.hostName = "alec-nixos";
}
