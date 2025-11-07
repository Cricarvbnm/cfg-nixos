{ pkgs, ... }:
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

  environment = {
    etc."tinyproxy/tinyproxy.conf".text = ''
      Port 7890
      Listen 127.0.0.1
      Listen ::1
      Allow 127.0.0.1
      Allow ::1
    '';
    systemPackages = [ pkgs.tinyproxy ];
  };
}
