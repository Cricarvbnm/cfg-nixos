{ ... }: {
  nix = {
    settings.substituters =
      [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
