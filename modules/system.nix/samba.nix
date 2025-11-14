{ ... }: {
  services = {
    samba = {
      enable = true;
      openFirewall = true;

      smbd.enable = true;
      settings = let
        yes = "yes";
        no = "no";
      in {
        global = {
          "invalid users" = [ "root" ];
          "passwd program" = "/run/wrappers/bin/passwd %u";
          security = "user";

          browsable = yes;
          "dns proxy" = no;

          logging = "systemd";
          "syslog only" = yes;
          "max log size" = 50;

          "aio read size" = 0;
          "aio write size" = 0;
          "load printers" = no;
        };

        homes = { "read only" = no; };

        storage = {
          path = "/storage";
          "guest ok" = yes;
          "browsable" = yes;
          "write list" = "alec";
        };
      };
    };
  };
}
