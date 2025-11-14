{ pkgs, lib, ... }:
let proxyPort = 7890;
in {
  networking = {
    hostName = "alec-nixos";

    proxy = {
      default = "http://localhost:${toString proxyPort}";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
    firewall = {
      allowedTCPPorts = [ proxyPort ];
      allowedUDPPorts = [ proxyPort ];
    };

    networkmanager.enable = true;
  };

  # Proxy
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };

  # In case of clash not working. Be like no proxy.
  environment = {
    etc."tinyproxy/tinyproxy.conf".text = ''
      Port ${toString proxyPort}
      Listen 127.0.0.1
      Listen ::1
      Allow 127.0.0.1
      Allow ::1
    '';
    systemPackages = [ pkgs.tinyproxy ];
  };

  # Nix store in CN net
  nix.settings.substituters =
    lib.mkBefore [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
}
