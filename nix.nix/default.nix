{
  imports = [ ./nh.nix ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.gc = {
    automatic = true;
  };
}
