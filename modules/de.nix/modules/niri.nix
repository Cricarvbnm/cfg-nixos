{ config, pkgs, ... }: {
  programs = {
    niri.enable = true;
    uwsm.waylandCompositors = {
      niri = {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = "${config.programs.niri.package}/bin/niri-session";
      };
    };
  };

  environment.systemPackages = with pkgs; [ xwayland-satellite ];
}
