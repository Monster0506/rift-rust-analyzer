# rift-rust-analyzer

Integrates an already-installed `rust-analyzer` with [rift](https://github.com/Monster0506/rift/).
Lazy-loads when a `.rs` buffer opens.

## Requirements

`rust-analyzer` must be on your `PATH`.

## Installation

Add to `~/.config/rift/plugins.lua`:

```lua
{
    "Monster0506/rift-rust-analyzer",
    ft   = "rust",
    opts = {
        -- check_on_save = true,   -- run clippy on save (default: true)
        -- proc_macros   = true,   -- enable proc-macro expansion (default: true)
        -- command       = "rust-analyzer",   -- binary name or full path
    },
},
```

Then run `:PluginSync` to install, or `:PluginInstall rift-rust-analyzer` if you added it later.

Rift installs plugins to:
- **Windows**: `%LOCALAPPDATA%\rift\plugins\`
- **Linux/Mac**: `~/.local/share/rift/plugins/`

## Features

Registers rust-analyzer for Rust files with:

- Go to definition, references, hover docs
- Rename symbol
- Format on demand
- Diagnostics (shown inline)
- Code actions
- Clippy checks on save
- Proc-macro expansion
- Inlay hints (parameter names, types, chaining)
- Forces `tabwidth=4`, `expand_tabs=true` for all Rust buffers
