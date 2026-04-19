{
  imports = [
    ./nixpkgs.nix
    ./nh.nix
  ];

  nix.gc = {
    automatic = true;
  };
}
