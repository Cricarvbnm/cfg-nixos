{ pkgs, options, ... }: {
  # uv
  environment.systemPackages = with pkgs; [ uv ];
  programs.nix-ld = {
    enable = true;
    libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [
      dbus # libdbus-1.so.3
      fontconfig # libfontconfig.so.1
      freetype # libfreetype.so.6
      glib # libglib-2.0.so.0
      libGL # libGL.so.1
      libxkbcommon # libxkbcommon.so.0
      xorg.libX11 # libX11.so.6
      wayland
    ]);
  };
}
