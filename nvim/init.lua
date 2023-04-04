vim.opt.termguicolors = true
vim.g.mapleader = ","
vim.opt.shell = '/bin/zsh'

-- Lazy
--
-- Lazy loading is only enabled when:
--   * The plugin only exists as a dependency in your spec
--   * It has an event, cmd, ft or keys key
--   * config.defaults.lazy == true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic config
local conf_files = {"basic.vim", "keys.lua"}
for _, name in ipairs(conf_files) do
  local path = string.format("%s/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end

-- Plugins
require("lazy").setup("plugins")
