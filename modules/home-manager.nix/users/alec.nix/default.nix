{ ... }: {
  imports = [ ../../modules/de.nix ./modules/tieba-sign.nix ];
  home.file.".icon".source =
    /storage/General/Pictures/Heads/00028-2425649580.png;
}
