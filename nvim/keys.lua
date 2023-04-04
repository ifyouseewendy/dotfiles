-- vim.keymap.set ignores noreamp for clarity. Use remap instead.
vim.keymap.set("n", "<F1>", ":Neotree toggle=true<cr>", { remap = False })
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { remap = False })
