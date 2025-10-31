{ ... }: {
  networking = {
    hostName = "alec-nixos";
    networkmanager = { enable = true; };
    # proxy = {
    #  default = "http://192.168.122.1:7890";
    #  noProxy = "127.0.0.1,localhost,internal.domain";
    #};
  };

  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
}
