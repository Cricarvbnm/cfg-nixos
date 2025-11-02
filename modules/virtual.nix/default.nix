{ ... }: {
  imports = [ ./modules/vfio.nix ];

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "alec" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
