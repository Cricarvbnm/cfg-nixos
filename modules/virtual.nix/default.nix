{ ... }: {
  imports = [ ./modules/vfio.nix ./modules/looking-glass.nix ];

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.groups = {
    libvirtd.members = [ "alec" ];
    kvm.members = [ "alec" ];
  };
}
