{ ... }: {
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes

      max-jobs = auto
    '';

    optimise = {
      automatic = true;
      dates = [ "00:30" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };
  };
}
