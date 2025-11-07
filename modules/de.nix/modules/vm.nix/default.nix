{ config, ... }: {
  imports = [ ./modules/looking-glass.nix ];

  # Libvirtd
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.groups = {
    libvirtd.members = [ config.mine.users.users.mainUser ];
    kvm.members = [ config.mine.users.users.mainUser ];
  };
}
