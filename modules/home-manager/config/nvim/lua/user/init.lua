remember_last_position = function()
  vim.api.nvim_create_autocmd(
    { "BufReadPost" },
    {
      callback = function()
        local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
        if {row, col} ~= {0, 0} then
				  vim.api.nvim_win_set_cursor(0, {row, col})
			  end
      end,
    }
  )
end

local config = {
  options = {
    opt = {
      spell = true,
    },
  },
  colorscheme = "nightfox",
  plugins = {
    { "EdenEast/nightfox.nvim" },
    { "AstroNvim/astrocommunity",
      { import = "astrocommunity.pack.go" },
    },
    { "folke/twilight.nvim",
      keys = { { "<leader>uT", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
      cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    },
    { "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      cmd = { "Trouble", "TroubleToggle"},
    },
    { "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "User AstroFile",
      opts = {},
    },
    { "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    },
    { "folke/zen-mode.nvim",
      opts = {},
      cmd = { "ZenMode" },
      keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode"} },
    },
    { "mbbill/undotree",
      keys = { { "<leader>uU", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" } },
    },
  },

  polish = function()
    remember_last_position()
  end,
}

return config
