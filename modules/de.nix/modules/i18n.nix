{ ... }:
let
  deLang = "zh_CN.UTF-8";
  charset = "UTF-8";
in {
  i18n = { extraLocales = [ "${deLang}/${charset}" ]; };

  environment.sessionVariables = { LANG = deLang; };
}
