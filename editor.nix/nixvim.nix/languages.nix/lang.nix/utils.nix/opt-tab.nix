# Make configuration about tab stop

# Example: extraFiles."after/ftplugin/${filetype}.lua" = import opt-tab.nix;

{
  tab-width ? 4,
  expandtab ? true,
}:
{
  text = ''
    vim.opt_local.tabstop = ${tab-width}
    vim.opt_local.shiftwidth = ${tab-width}
    vim.opt_local.expandtab = ${expandtab}
  '';
}
