{ ... }:
let proxyPort = 7890;
in {
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
  networking = {
    proxy = {
      default = "http://localhost:${toString proxyPort}";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
    firewall = {
      allowedTCPPorts = [ proxyPort ];
      allowedUDPPorts = [ proxyPort ];
    };
  };
}
