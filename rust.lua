rift.lsp.register({
    language     = "rust",
    command      = "rust-analyzer",
    args         = {},
    extensions   = { ".rs" },
    root_markers = { "Cargo.toml", ".git" },
    capabilities = { "definition", "references", "hover", "rename", "format", "diagnostics", "code_actions" },
    initialization_options = {
        checkOnSave = true,
        check = { command = "clippy" },
        procMacro = { enable = true },
    },
})

rift.on("BufEnter", function(ev)
    if rift.get_filetype() == "rust" then
        rift.set_option("tab_width", 4)
        rift.set_option("expand_tabs", true)
    end
end)
