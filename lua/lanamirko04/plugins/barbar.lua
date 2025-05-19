return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = true,
        tabpages = true,
        clickable = false,
        hide = {extensions = true},
        highlight_alternate = false,
        highlight_inactive_file_icons = false,
        icons = {
            buffer_index = false,
            buffer_number = false,
            button = "",
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {
                    enabled = true, icon = "ﬀ"
                },
                [vim.diagnostic.severity.WARN] = {enabled = false},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = true},
            },
            gitsigns = {
                added = {enabled = true, icon = "+"},
                changed = {enabled = true, icon = "~"},
                deleted = {enabled = true, icon = "-"},
            },
            filetype = {
                custom_colors = false,
                enabled = true,
            },
            separator = {left = "▎", right = ""},
            modified = {button = "●"},
            pinned = {button = "", filename = true},
            preset = "default",
            alternate = {filetype = {enabled = false}},
            current = {buffer_index = true},
            inactive = {button = "×"},
            visible = {modified = {buffer_number = false}},
          },
          insert_at_end = true,
    },
}
