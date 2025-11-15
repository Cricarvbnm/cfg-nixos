{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.tldr ];

  # Daily Update
  systemd = {
    services.update-tldr = {
      unitConfig = {
        After = "network-online.target";
        Requisite = "network-online.target";
      };
      serviceConfig = {
        ExecStart = "${pkgs.tldr}/bin/tldr --update";
        Type = "oneshot";
      };

      startAt = "00:00:00";
    };
  };
}
