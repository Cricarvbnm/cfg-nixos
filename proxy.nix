{ ... }:
{
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    serviceMode = true;
  };
  networking = {
    proxy = {
      # default = "http://alechron:10b05022@[2001:19f0:1000:e6b5:5400:05ff:fec8:e7d4]:80";
      default = "http://localhost:7890";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };
}
