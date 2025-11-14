{ pkgs, ... }: {
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-dropbox-plugin
        thunar-media-tags-plugin
      ];
    };
    xfconf.enable = true;
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer

    # Archive
    mate.engrampa
    zip
    unzip
    p7zip
    unrar
    xz
  ];
}
