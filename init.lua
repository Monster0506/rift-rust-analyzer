-- rift-rust-analyzer/init.lua
--
-- Accepted opts (passed via `opts = { ... }` in your plugin spec):
--   command       string   LSP binary name or path (default: "rust-analyzer")
--   args          table    Extra CLI args (default: {})
--   check_on_save bool     Run clippy on save (default: true)
--   proc_macros   bool     Enable proc-macro expansion (default: true)
--   inlay_hints   bool     Show inlay hints (default: true)

local M = {}

local function apply_rust_settings()
    rift.set_option("tab_width", 4)
    rift.set_option("expand_tabs", true)
end

function M.setup(opts)
    opts = opts or {}

    rift.lsp.register({
        language     = "rust",
        command      = opts.command or "rust-analyzer",
        args         = opts.args or {},
        extensions   = { ".rs" },
        root_markers = { "Cargo.toml", ".git" },
        capabilities = {
            "definition", "references", "hover", "rename",
            "format", "diagnostics", "code_actions",
        },
        initialization_options = {
            checkOnSave = opts.check_on_save ~= false,
            check       = { command = "clippy" },
            procMacro   = { enable = opts.proc_macros ~= false },
            inlayHints  = {
                enable        = opts.inlay_hints ~= false,
                parameterHints = { enable = true },
                typeHints      = { enable = true },
                chainingHints  = { enable = true },
            },
        },
    })

    apply_rust_settings()
end

rift.on("BufEnter", function(_)
    if rift.get_filetype() == "rust" then
        apply_rust_settings()
    end
end)

return M
