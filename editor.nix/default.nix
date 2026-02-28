{ inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim

    ./languages.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.background.dark = "mocha";
    };

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;

      # Search
      incsearch = true;
      smartcase = true;

      # Show spaces
      list = true;
      listchars = "tab:>-,trail:-,nbsp:+";
    };

    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    keymaps = [
      {
        options.desc = "Quit";
        key = "<Leader>q";
        action = "<Cmd>q<CR>";
        mode = [ "n" ];
      }
      {
        options.desc = "Save and Quit";
        key = "<Leader>Q";
        action = "<Cmd>wq<CR>";
        mode = [ "n" ];
      }

      # Buffer
      {
        options.desc = "Buffer Next";
        key = "<S-l>";
        action = "<Cmd>bnext<CR>";
        mode = [ "n" ];
      }
      {
        options.desc = "Buffer Previous";
        key = "<S-h>";
        action = "<Cmd>bprevious<CR>";
        mode = [ "n" ];
      }
      {
        options.desc = "Buffer Delete";
        key = "<Leader>bc";
        action = "<Cmd>bdelete<CR>";
        mode = [ "n" ];
      }
      {
        options.desc = "Buffer Save";
        key = "<C-s>";
        action = "<Cmd>w<CR>";
        mode = [ "n" ];
      }
    ];
  };

  environment = {
    sessionVariables.EDITOR = "nvim";
  };
}
