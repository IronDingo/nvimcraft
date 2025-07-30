-- Add any custom plugin specs here
return {
  -- Customize or add your own plugins
  -- Example: Add a specific colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },


  -- FIX: Ping nvim-treesitter to working version
    {
    "nvim-treesitter/nvim-treesitter",
    commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16", -- This commit has the query_predicates module
    build = ":TSUpdate",
  },
  
  -- Add GitHub Copilot for AI assistance (optional - comment out if not needed)
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Customize Copilot settings here
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
    end,
  },
  
  -- Add database client
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
