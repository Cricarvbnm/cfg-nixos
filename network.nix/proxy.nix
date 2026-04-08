{ pkgs, lib, ... }:
let
  port = 7890;
  inherit (builtins) toString;
in
{
  programs = {
    clash-verge = {
      enable = true;
      autoStart = true;
      serviceMode = true;
    };

    # Proxy for SSH clients
    ssh.extraConfig = ''
      Host !*.local *
        ProxyCommand ${lib.getExe pkgs.netcat} -Xconnect -x localhost:${toString port} %h %p
    '';
  };

  networking.proxy = {
    default = "http://localhost:${toString port}";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
