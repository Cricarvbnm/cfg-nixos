{ ... }: {
  imports = [ ./modules/vfio.nix ];

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.groups = {
    libvirtd.members = [ "alec" ];
    groups.kvm.members = [ "alec" ];
  };

}
