{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Zip
    zip
    unzip

    # 7z
    p7zip

    # RAR
    rar
    unrar

    # XZ
    xz
  ];
}
