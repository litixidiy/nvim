return {
  "hedyhli/outline.nvim",
  lazy = false,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>tt", "<cmd>Outline<CR>", desc = "Toggle outline window" },
    { "<leader>t<leader>", "<cmd>Outline!<CR>", desc = "Toggle outline window without focus" },
    { "<leader>tf", "<cmd>OutlineFollow<CR>", desc = "Focus & follow outline window" },
  },
  config = function(_, opts)
      require('outline').setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "Outline",
        callback = function()
          vim.api.nvim_create_autocmd("WinLeave", {
            buffer = 0,
            command = "noh",
          })
        end
      })
  end,
  opts = {
    preview_window = {
      live = true,
      border = 'rounded',
      open_hover_on_preview = false,
        height = 8,
        relative_height = false,
    },
    symbol_folding = {
      auto_unfold = {
        only = 2,
      },
    },
    guides = {
      -- Keep only guides that indicate siblings that might span multiple lines (vertical)
      markers = {
        middle = ' ',
        bottom = ' ',
      }
    },
    keymaps = {
      close = 'q',
      -- unfold_all = {},
      -- fold_all = {},
      -- fold_toggle = {'<tab>', '<space>'},
    },
    outline_window = {
      position = 'left',
        auto_jump = true,
      show_cursorline = 'focus_in_outline',
      -- Beautiful, but not very good in indicating window focus (I don't use a
      -- statusline), plus at the time of writing preview window breaks this
      -- feature... But still beautiful nonetheless!
      hide_cursor = true,
      winhl = "OutlineDetails:LineNr,OutlineLineno:LineNr,OutlineGuides:Comment",
    },
    outline_items = {
      auto_set_cursor = false,
    },
    providers = {
      lsp = { blacklist_clients = {'marksman'} },
      markdown = {filetypes = {'markdown', 'text'}},
      priority = {'lsp', 'markdown', 'asciidoc', 'norg'},
    },
    symbols = {
      filter = {
        lua = { 'String', 'Package', 'Constant', exclude = true },
        python = { 'Function', 'Method', 'Class' },
      },
      icon_fetcher = function(k, buf)
        local ft = vim.api.nvim_buf_get_option(buf, "ft")
        -- There can only be kind String in markdown so... let's not have the
        -- eye candy here
        if ft == 'markdown' and k == 'String' then
          return ""
        end
        return false
      end,
      icon_source = "lspkind",
    },
  },
}
