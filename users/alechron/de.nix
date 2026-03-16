{ pkgs, ... }:
{
  imports = [
    ./kde.nix
    ./dev.nix
  ];

  home.packages =
    (with pkgs.kdePackages; [
      sddm-kcm
      discover
      partitionmanager
      kcalc
    ])
    ++ (with pkgs; [
      libreoffice
      wl-clipboard
    ]);

  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "zh-CN" ];
    };
  };
}
