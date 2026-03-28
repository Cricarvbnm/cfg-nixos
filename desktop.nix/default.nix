{
  imports = [
    ./kde.nix
    ./winboat.nix
  ];

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    scx = {
      enable = true;
    };
  };
}
