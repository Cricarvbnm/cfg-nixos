{ ... }: {
  imports = [
    ./modules/compositor.nix
    ./modules/terminal.nix
    ./modules/notification.nix
    ./modules/file-manager.nix
    ./modules/browser.nix
    ./modules/menu.nix
    ./modules/clipboard.nix
    ./modules/torrent.nix
    ./modules/gui-kits.nix
  ];
}
