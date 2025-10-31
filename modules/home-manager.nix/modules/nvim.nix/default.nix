{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      luarocks
      gnutar
      gnumake
      unzip
      gcc
      cargo
      go
      python3
      nodejs_24
    ];
  };

  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${./nvim}";
}
