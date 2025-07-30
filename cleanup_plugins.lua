-- Cleanup script for corrupted LazyVim plugins
-- Run this in Neovim with :lua require("cleanup_plugins")

local M = {}

function M.cleanup_corrupted_plugins()
  local lazy_dir = vim.fn.stdpath("data") .. "/lazy"
  local plugins_to_clean = {
    "nvim-treesitter-textobjects",
    "lualine.nvim", 
    "bufferline.nvim",
    "which-key.nvim",
    "flash.nvim",
    "noice.nvim",
    "trouble.nvim",
    "mason.nvim",
    "nvim-treesitter"
  }
  
  print("🧹 Starting plugin cleanup...")
  
  for _, plugin in ipairs(plugins_to_clean) do
    local plugin_path = lazy_dir .. "/" .. plugin
    if vim.fn.isdirectory(plugin_path) == 1 then
      print("🗑️  Removing corrupted plugin: " .. plugin)
      vim.fn.delete(plugin_path, "rf")
    else
      print("ℹ️  Plugin not found: " .. plugin)
    end
  end
  
  print("✅ Cleanup complete! Restart Neovim to reinstall plugins.")
end

function M.check_plugin_status()
  local lazy_dir = vim.fn.stdpath("data") .. "/lazy"
  local plugins_to_check = {
    "nvim-treesitter-textobjects",
    "lualine.nvim", 
    "bufferline.nvim",
    "which-key.nvim",
    "flash.nvim",
    "noice.nvim",
    "trouble.nvim",
    "mason.nvim",
    "nvim-treesitter"
  }
  
  print("🔍 Checking plugin installation status...")
  
  for _, plugin in ipairs(plugins_to_check) do
    local plugin_path = lazy_dir .. "/" .. plugin
    if vim.fn.isdirectory(plugin_path) == 1 then
      -- Check if it's a proper git repository
      local git_dir = plugin_path .. "/.git"
      if vim.fn.isdirectory(git_dir) == 1 then
        print("✅ " .. plugin .. " - Installed")
      else
        print("⚠️  " .. plugin .. " - Corrupted (no .git directory)")
      end
    else
      print("❌ " .. plugin .. " - Not installed")
    end
  end
end

function M.force_reinstall()
  print("🔄 Force reinstalling all plugins...")
  
  -- Clear the lazy cache
  local cache_dir = vim.fn.stdpath("cache") .. "/lazy"
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
    print("🗑️  Cleared lazy cache")
  end
  
  -- Restart lazy
  require("lazy").sync({ wait = true })
  
  print("✅ Force reinstall initiated!")
end

return M 