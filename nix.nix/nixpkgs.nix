{ pkgs, inputs, ... }:
let
  callNixpkgs =
    nixpkgs: extraArgs:
    import nixpkgs {
      inherit (pkgs.stdenv.hostPlatform) system;
    }
    // extraArgs;
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays = [
      (_: _: rec {
        # Add nixpkgs branches{{{
        branches = {
          unstable = callNixpkgs inputs.nixpkgs-unstable { };
        };
        inherit (branches) unstable;
        # }}}
      })
    ];
  };
}
