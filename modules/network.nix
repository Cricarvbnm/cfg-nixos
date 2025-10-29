{ ... }: {
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking = {
    hostName = "nixos";
    networkmanager = { enable = true; };
    proxy = {
      default = "http://192.168.122.1:7890";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };
}
