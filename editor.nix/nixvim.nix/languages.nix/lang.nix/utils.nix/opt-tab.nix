# Make configuration about tab stop

# Example: extraFiles."after/ftplugin/${filetype}.lua" = import opt-tab.nix;

{
  tab-width ? 4,
  expandtab ? true,
}:
let
  tab-width-str = builtins.toString tab-width;
in
{
  text = ''
    vim.opt_local.tabstop = ${tab-width-str}
    vim.opt_local.shiftwidth = ${tab-width-str}
    vim.opt_local.expandtab = ${if expandtab then "true" else "false"}
  '';
}
