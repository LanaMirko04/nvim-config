local fn = vim.fn

-- Automatically install lazy
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    -- colorschemes
    "morhetz/gruvbox",

    -- dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup {
                theme = "doom",
                config = {
                    header = {
                        "                                                 ",
                        "                                                 ",
                        "██╗             ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                        "╚██╗            ████╗  ██║██║   ██║██║████╗ ████║",
                        " ╚██╗           ██╔██╗ ██║██║   ██║██║██╔████╔██║",
                        " ██╔╝           ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                        "██╔╝███████╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                        "╚═╝ ╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                        "                                                 ",
                        "                                                 ",
                    },
                    center = {
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Find Files              ",
                            key = "f",
                            key_hl = "Number",
                            key_format = " %s",
                            action = ":Telescope find_files"
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Old Files               ",
                            key = "o",
                            key_hl = "Number",
                            key_format = " %s",
                            action = ":Telescope oldfiles"
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "File Browser           ",
                            key = "b",
                            key_hl = "Number",
                            key_format = " %s",
                            action = ":Telescope file_browser"
                        },
                    },
                    footer = {
                        "                                                   ",
                        "                                                   ",
                        "                                                   ",
                        "Insert joke about not knowing how to get out of Vim",
                    },
                },
            }
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- startup-nvim
    

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<C-t>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
        opts = {
            sort = { sorter = "case_sensitive", },
            view = { width = 30, },
            renderer = { group_empty = true, },
            filters = { dotfiles = true, },
        },
    },

    -- barbar
    {
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
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("user.lualine")
        end
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        }
    }
})
