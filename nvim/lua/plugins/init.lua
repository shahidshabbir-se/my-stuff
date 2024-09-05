return {
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre', -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "DaikyXendo/nvim-material-icon",
    lazy = false, -- Ensures the plugin is loaded immediately
  },
  {
    "neoclide/coc.nvim",
    lazy = false, -- Ensures the plugin is loaded immediately
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<A-`>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          javascript = true,
          typescript = true,
          lua = true,
          python = true,
          go = true,
          html = true,
          css = true,
          rust = true,
          markdown = false,
          yaml = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node",
        server_opts_overrides = {
          settings = {
            advanced = {
              listCount = 10,
              inlineSuggestCount = 3,
            },
          },
        },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "v2.*",
    config = function()
      -- Setup indent-blankline with Dracula theme
      require("indent_blankline").setup {
        char = " ",
        space_char = " ",
        char_highlight_list = {
          "IndentLevel1",
          "IndentLevel2",
          "IndentLevel3",
          "IndentLevel4",
          "IndentLevel5",
          "IndentLevel6",
          "IndentLevel7",
        },
        space_char_highlight_list = {
          "IndentLevel1",
          "IndentLevel2",
          "IndentLevel3",
          "IndentLevel4",
          "IndentLevel5",
          "IndentLevel6",
          "IndentLevel7",
        },
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
      }

      -- Define highlight groups with four distinct colors
      vim.cmd [[highlight IndentLevel1 guifg=NONE guibg=#22263D gui=nocombine]] -- Background color for level 1
      vim.cmd [[highlight IndentLevel2 guifg=NONE guibg=#2B263D gui=nocombine]] -- Background color for level 2
      vim.cmd [[highlight IndentLevel3 guifg=NONE guibg=#352A3E gui=nocombine]] -- Background color for level 3
      vim.cmd [[highlight IndentLevel4 guifg=NONE guibg=#3C293C gui=nocombine]] -- Background color for level 4
      vim.cmd [[highlight IndentLevel5 guifg=NONE guibg=#3D3340 gui=nocombine]] -- Background color for level 5
      vim.cmd [[highlight IndentLevel6 guifg=NONE guibg=#332D3E gui=nocombine]] -- Background color for level 6
      vim.cmd [[highlight IndentLevel7 guifg=None guibg=#262537 gui=nocombine]] -- Background color for indent character

      -- Optionally, customize context highlights if needed
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#ff79c6]]
      vim.cmd [[highlight IndentBlanklineContextStart guifg=#ff79c6 gui=bold]]
    end,
    after = "nvim-treesitter",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "tailwind-language-server",
        "typescript-language-server",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },

   {
    "windwp/nvim-ts-autotag",
    ft = {"html","javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
 
  {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
},

 -- - {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
