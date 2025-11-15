{ pkgs, config, ... }: {
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [ kdePackages.discover ];

  systemd.services.flatpak-update = {
    unitConfig = rec {
      After = "network-online.target";
      Requisite = After;
    };
    serviceConfig = {
      ExecStart =
        "${config.services.flatpak.package}/bin/flatpak update --assumeyes";
      Type = "oneshot";
    };

    startAt = "00:00:00";
  };
}
