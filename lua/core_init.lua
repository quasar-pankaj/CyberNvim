local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

for _, source in ipairs({
  "core.main-options",
  "core.plugins",
  "core.keybindings",
  "core.utils.utils",
  "core.utils.notify",
  "core.autocommands",
}) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end

if require("core.utils.utils").plugin_loaded("notify") then
  vim.notify = require("notify")
end

vim.api.nvim_create_user_command("CyberUpdate", function()
  require("core.utils.utils").updateAll()
end, { desc = "Updates plugins, mason packages, treesitter parsers" })

local conf = require("user.user_config")
if conf.user_conf then
  conf.user_conf()
end

local colorscheme = "onedark"
if conf.general_opts and conf.general_opts.colorscheme then
  colorscheme = conf.general_opts.colorscheme
end
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!", "error")
  return
end
