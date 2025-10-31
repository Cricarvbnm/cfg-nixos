{ ... }: {
  networking = {
    hostName = "alec-nixos";
    networkmanager = { enable = true; };
    proxy = {
      default = "http://localhost:7890";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };

  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
}
