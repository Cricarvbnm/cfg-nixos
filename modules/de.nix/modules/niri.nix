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

  # For default config
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    xwayland-satellite
  ];
  security.polkit.enable = true;
}
