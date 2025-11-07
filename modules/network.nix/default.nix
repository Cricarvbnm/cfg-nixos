{ ... }: {
  imports = [ ./modules/proxy.nix ];

  networking = {
    hostName = "alec-nixos";
    networkmanager.enable = true;
  };

  services.resolved.enable = true;
}
