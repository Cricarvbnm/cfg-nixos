{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    desktopManager.plasma6 = {
      enable = true;
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    flatpak.enable = true;
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
    okular
  ];
}
