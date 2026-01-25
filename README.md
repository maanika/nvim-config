# nvim-config

My personal **Neovim configuration** — a custom, Lua-based setup built with **Lazy.nvim** plugins to maximize productivity.

This repo contains my Neovim setup so I can quickly bootstrap a new machine and keep my workflow consistent.

## Features
- Lua-first configuration for Neovim
- Plugin management via **Lazy.nvim**
- Language Server Protocol (LSP) and autocompletion
- Useful key mappings and IDE-style enhancements
- Modular configuration under `lua/`

> This is a personal config — modify it to suit your workflow!

## Requirements
- Neovim (v0.12.0-dev)
- Utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  [fd-find](https://github.com/sharkdp/fd#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional
- Language Setup: `npm`

## Installation

### Clone
```bash
git clone https://github.com/maanika/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Start Neovim
```bash
nvim
```

