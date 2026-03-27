# AGENTS.md - NixOS Configuration Repository

NixOS flake-based system configuration using `nixos-25.11` channel with home-manager, nixvim, and KDE Plasma.

## Build Commands

```bash
# Dry build - check for errors without applying
sudo nixos-rebuild dry-build --flake .#alec-nixos

# Test configuration (boots in VM if available)
sudo nixos-rebuild test --flake .#alec-nixos

# Build configuration
sudo nixos-rebuild build --flake .#alec-nixos

# Apply configuration (switch to new config)
sudo nixos-rebuild switch --flake .#alec-nixos
```

## Nix Validation

```bash
# Evaluate configuration
nix eval .#nixosConfigurations.alec-nixos.pkgs.system

# Check syntax
nix-instantiate --parse configuration.nix

# Format nix files
nixfmt .

# Update flake inputs
sudo nix flake update
```

## Code Style

### File Organization
- One module per file, imported in parent `default.nix`
- System modules in root: `shell.nix`, `nix.nix`, `de.nix`, `proxy.nix`, `dev.nix`, `editor.nix`
- User config in `users/<username>/`
- Nixvim: `editor.nix/nixvim.nix/` with subdirs for `languages/`, `plugins/`, `ui.nix`

### Nix Syntax
- 2 spaces indentation
- Quote paths: `./module.nix` not `./module.nix`
- Use `with pkgs;` for package lists
- Prefer attr sets over lists

### Naming
- Files: kebab-case (`shell.nix`, `proxy.nix`)
- Attrs: camelCase (`enable`, `extraSpecialArgs`)
- Options: `enable`, `package`, `settings` suffixes

### Module Pattern
```nix
{ pkgs, lib, config, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  options = {
    myOption = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable something";
    };
  };

  config = lib.mkIf config.myOption {
    # configuration
  };
}
```

### Package Declarations
```nix
# System packages
environment.systemPackages = with pkgs; [ curl git ];

# Conditional packages
environment.systemPackages = with pkgs; [
  curl
] ++ lib.optionals config.someFeature [ extra-package ];
```

### Option Types
- Booleans: `enable = true;`
- Strings: `defaultLocale = "en_GB.UTF-8";`
- Lists: `extraLocales = [ "zh_CN.UTF-8/UTF-8" ];`
- Attr sets: `settings = { inputMethod = { ... }; };`

### Error Handling
- `lib.mkIf` - conditional config
- `lib.mkMerge` - merge lists/attrs across modules
- `lib.asserts` - validation

### Flake Structure
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      # perSystem and flake definitions
    };
}
```

### Home Manager
- State version: `home.stateVersion = "25.11";`
- User config in `users/<username>/home.nix`

## Architecture

```
/etc/nixos/
├── flake.nix                  # Flake entry point
├── configuration.nix          # Main NixOS config
├── hardware-configuration.nix # Hardware-specific
├── shell.nix                  # Shell (fish)
├── nix.nix                    # Nix settings
├── de.nix                     # Desktop environment
├── proxy.nix                  # Proxy settings
├── dev.nix                    # Dev environment
├── editor.nix/                # Editor (nixvim)
│   └── nixvim.nix/
│       ├── default.nix        # Main nixvim module
│       ├── plugins.nix/       # Plugins config
│       ├── languages.nix/     # LSP, linters, formatters
│       │   ├── lsp.nix
│       │   ├── lint.nix
│       │   ├── format.nix
│       │   └── lang.nix/      # Language-specific
│       └── ui.nix/            # UI (snacks, noice)
└── users/
    └── alechron/
        ├── home.nix           # Home manager
        ├── de.nix             # User DE config
        ├── kde.nix            # KDE config
        └── dev.nix            # User dev tools
```

## Useful Commands

```bash
# Clean up
sudo nix-collect-garbage -d

# Enter dev shell
nix develop
```
