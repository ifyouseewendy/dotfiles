return {
  "nvim-neo-tree/neo-tree.nvim",
  event = {"VimEnter"},
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require("neo-tree").setup({
      window = {
        mappings = {
          ["x"] = {
            "toggle_node",
            nowait = false -- disable `nowait` if you have existing combos starting with this char that you want to use 
          },
          ["o"] = "open"
        }
      }
    })
  end
}
