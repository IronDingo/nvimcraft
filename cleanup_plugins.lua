-- Cleanup script for corrupted LazyVim plugins
-- Run this in Neovim with :lua require("cleanup_plugins")

local M = {}

function M.cleanup_corrupted_plugins()
  local lazy_dir = vim.fn.stdpath("data") .. "/lazy"
  local cache_dir = vim.fn.stdpath("cache") .. "/lazy"
  
  print("🧹 Starting aggressive plugin cleanup...")
  
  -- Remove the entire lazy directory to start fresh
  if vim.fn.isdirectory(lazy_dir) == 1 then
    print("🗑️  Removing entire lazy directory...")
    vim.fn.delete(lazy_dir, "rf")
  end
  
  -- Clear the cache directory
  if vim.fn.isdirectory(cache_dir) == 1 then
    print("🗑️  Clearing lazy cache...")
    vim.fn.delete(cache_dir, "rf")
  end
  
  -- Remove treesitter cache specifically
  local treesitter_cache = vim.fn.stdpath("cache") .. "/nvim-treesitter"
  if vim.fn.isdirectory(treesitter_cache) == 1 then
    print("🗑️  Clearing treesitter cache...")
    vim.fn.delete(treesitter_cache, "rf")
  end
  
  print("✅ Aggressive cleanup complete! Restart Neovim to reinstall plugins.")
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
  
  if vim.fn.isdirectory(lazy_dir) == 0 then
    print("❌ Lazy directory doesn't exist - plugins not installed")
    return
  end
  
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

function M.remove_treesitter_parsers()
  print("🗑️  Removing all treesitter parsers...")
  
  local parsers_dir = vim.fn.stdpath("data") .. "/nvim-treesitter"
  if vim.fn.isdirectory(parsers_dir) == 1 then
    vim.fn.delete(parsers_dir, "rf")
    print("✅ Removed treesitter parsers directory")
  else
    print("ℹ️  Treesitter parsers directory not found")
  end
end

return M 