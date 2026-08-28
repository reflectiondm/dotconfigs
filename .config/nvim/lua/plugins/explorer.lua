return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- Shows dotfiles (.env, .gitignore, etc.) by default
            ignored = true, -- Shows gitignored files (like node_modules) by default
          },
        },
      },
    },
  },
}
