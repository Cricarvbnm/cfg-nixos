# AGENTS.md - NixOS Configuration Repository

This is a NixOS flake-based system configuration using `nixos-25.11` channel.

## Build/Test Commands

### Building the System
```bash
# Build the system configuration (dry-run)
sudo nixos-rebuild dry-build --flake .#alec-nixos

# Build and switch to new configuration
sudo nixos-rebuild switch --flake .#alec-nixos

# Build without switching (for testing)
sudo nixos-rebuild build --flake .#alec-nixos
```

### Testing Changes
```bash
# Test configuration without applying
sudo nixos-rebuild test --flake .#alec-nixos

# Dry build to check for errors
sudo nixos-rebuild dry-build --flake .#alec-nixos
```

### Nix Evaluation
```bash
# Check Nix syntax and evaluate configuration
nix eval .#nixosConfigurations.alec-nixos.pkgs.system

# Check for missing imports or syntax errors
nix-instantiate --parse configuration.nix
```

### NixOS Options
```bash
# Search for options
nix options nixos.some.option.path

# Check current option values
nixos-option <option-path>
```

## Code Style Guidelines

### File Organization
- One module per file (e.g., `shell.nix`, `nix.nix`, `de.nix`)
- Import system modules via `./module.nix` in `configuration.nix`
- User home-manager config in `users/<username>/home.nix`

### Nix Syntax
- Use 2 spaces for indentation
- Always quote strings that could be interpreted as paths: `./file.nix`
- Use `with pkgs;` for package lists in systemPackages
- Prefer attribute sets over lists where appropriate
- Use `lib.mkEnableOption` / `lib.mkOption` for reusable options

### Naming Conventions
- File names: kebab-case (e.g., `shell.nix`, `proxy.nix`)
- Nix attributes: camelCase (e.g., `enable`, `extraSpecialArgs`)
- Options: `enable`, `package`, `settings` suffixes
- Variables: camelCase or snake_case (prefer camelCase for attrs)

### Imports
```nix
{ pkgs, lib, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./editor.nix
  ];
}
```

### Package Declarations
```nix
# System packages
environment.systemPackages = with pkgs; [
  curl
  git
];

# Single package
programs.fish.enable = true;
```

### Option Types
- Booleans: `enable = true;`
- Strings: `defaultLocale = "en_GB.UTF-8";`
- Lists: `extraLocales = [ "zh_CN.UTF-8/UTF-8" ];`
- Attr sets: `settings = { inputMethod = { ... }; };`

### Modules Structure
```nix
{ pkgs, lib, config, ... }:
{
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

### Error Handling
- Use `lib.mkIf` for conditional configuration
- Use `lib.mkMerge` for merging lists/attrs across modules
- Use `lib.asserts` for validation when needed

### Flake Inputs
- Pinned to specific versions in `flake.nix`
- Follows `nixos-25.11` release channel
- Use `inputs.nixpkgs.follows = "nixpkgs"` for input synchronization

### Home Manager
- State version: `home.stateVersion = "25.11";`
- User configs in `users/<username>/home.nix`
- Imports user-specific modules (e.g., `de.nix`)

### Common Patterns

```nix
# Package with config
programs = {
  git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user = {
        name = "username";
        email = "user@example.com";
      };
    };
  };
};

# List with conditional items
fonts.packages = with pkgs; [
  noto-fonts
] ++ lib.optionals config.someFeature [ extra-package ];

# Conditional config
lib.mkIf config.services.something.enable {
  # config
};
```

## Useful Commands

```bash
# Update flake inputs
sudo nix flake update

# Enter dev shell (if defined)
nix develop

# Format nix files
nixfmt .

# Clean up old generations
sudo nix-collect-garbage -d
sudo nix-env --delete-generations +10
```

## Architecture

```
/etc/nixos/
├── flake.nix              # Flake entry point
├── configuration.nix     # Main system config
├── hardware-configuration.nix
├── shell.nix             # Shell configuration
├── nix.nix               # Nix settings
├── de.nix                # Desktop environment
├── proxy.nix             # Proxy settings
├── editor.nix            # Editor config
├── winboat.nix           # Winboat config
└── users/
    └── alechron/
        ├── home.nix      # Home manager config
        ├── de.nix        # User DE config
        ├── kde.nix       # KDE config
        └── dev.nix       # Dev environment
```
