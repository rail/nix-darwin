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
  { "mbbill/undotree",
    keys = { { "<leader>uU", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" } },
  },
}

return plugins
