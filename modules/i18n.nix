{ pkgs, ... }: {
  i18n = {
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
    defaultLocale = "zh_CN.UTF-8";

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [ fcitx5-gtk fcitx5-mozc fcitx5-chinese-addons ];
      };
    };
  };
}
