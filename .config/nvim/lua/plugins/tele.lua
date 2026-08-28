return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "bottom",
          height = 0.3,
          width = 0,
        },
      },
      -- snacks.terminal merges the `terminal` opts above into every terminal it
      -- spawns, including lazygit, so the float geometry must be restated here.
      lazygit = {
        win = {
          position = "float",
          height = 0.9,
          width = 0.9,
        },
      },
    },
  },
}
