plugins = {
  { "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.nix" },
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
  {
    "lewis6991/gitsigns.nvim",
    keys = { { "<leader>gT", "<cmd>Gitsigns toggle_current_line_blame<cr>"}, desc = "Toggle current line blame" },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}

return plugins
