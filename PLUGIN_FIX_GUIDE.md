# LazyVim Plugin Fix Guide

## Problem Summary
Your LazyVim configuration is experiencing git timeout issues during plugin installation, causing corrupted plugin downloads and cascade errors.

## Root Cause
- Git clone timeouts during initial plugin installation
- Plugins partially download but fail to checkout properly
- LazyVim tries to configure plugins that aren't properly installed

## Solution Overview
This repository now includes:
1. **Enhanced Lazy Configuration** - Better timeout handling and retry logic
2. **Core Plugin Fixes** - Robust configurations for problematic plugins
3. **Cleanup Script** - Tools to remove corrupted plugins
4. **Step-by-step Recovery Process**

## Step 1: Clean Up Corrupted Plugins

### Option A: Using the Cleanup Script
1. Open Neovim
2. Run the cleanup script:
   ```lua
   :lua require("cleanup_plugins").cleanup_corrupted_plugins()
   ```

### Option B: Manual Cleanup
1. Close Neovim completely
2. Navigate to your LazyVim data directory:
   ```bash
   cd ~/.local/share/nvim/lazy/
   ```
3. Remove the corrupted plugins:
   ```bash
   rm -rf nvim-treesitter-textobjects
   rm -rf lualine.nvim
   rm -rf bufferline.nvim
   rm -rf which-key.nvim
   rm -rf flash.nvim
   rm -rf noice.nvim
   rm -rf trouble.nvim
   rm -rf mason.nvim
   rm -rf nvim-treesitter
   ```

## Step 2: Clear Lazy Cache
```bash
rm -rf ~/.cache/nvim/lazy
```

## Step 3: Restart Neovim
1. Close Neovim completely
2. Start Neovim: `nvim`
3. The enhanced configuration will automatically:
   - Use better git timeout settings (300 seconds)
   - Implement retry logic (3 retries)
   - Use shallow clones for faster installation
   - Provide better error feedback

## Step 4: Monitor Installation
1. Watch the installation progress in the LazyVim UI
2. If any plugins still fail, they will be retried automatically
3. Check plugin status with:
   ```lua
   :lua require("cleanup_plugins").check_plugin_status()
   ```

## Step 5: Force Reinstall (if needed)
If some plugins still fail, force a complete reinstall:
```lua
:lua require("cleanup_plugins").force_reinstall()
```

## Configuration Improvements Made

### Enhanced Git Settings
- **Timeout**: Increased to 300 seconds
- **Retries**: 3 automatic retries
- **Shallow Clones**: Faster initial downloads
- **Better Error Handling**: More informative error messages

### Core Plugin Fixes
The `lua/plugins/core-fixes.lua` file contains robust configurations for:
- `nvim-treesitter` - With proper build commands
- `nvim-treesitter-textobjects` - With dependency management
- `lualine.nvim` - Complete status line configuration
- `bufferline.nvim` - Buffer management
- `which-key.nvim` - Key binding help
- `flash.nvim` - Enhanced navigation
- `noice.nvim` - Better UI components
- `trouble.nvim` - Diagnostic display
- `mason.nvim` - LSP installer

### Better Error Recovery
- Automatic retry logic for failed installations
- Graceful handling of missing plugins
- Fallback configurations for critical plugins

## Troubleshooting

### If Plugins Still Fail
1. Check your internet connection
2. Try using a VPN if you're behind a corporate firewall
3. Increase git timeout further in `lua/config/lazy.lua`:
   ```lua
   git = {
     timeout = 600, -- Increase to 10 minutes
     depth = 1,
     retries = 5,   -- Increase retries
   },
   ```

### If Specific Plugins Continue to Fail
1. Check the plugin's GitHub repository for issues
2. Try installing the plugin manually:
   ```bash
   cd ~/.local/share/nvim/lazy/
   git clone https://github.com/plugin/name.git
   ```

### Network Issues
If you're experiencing network timeouts:
1. Try using a different DNS server
2. Check if your firewall is blocking git operations
3. Consider using a different network connection

## Verification
After successful installation, verify all plugins are working:
```lua
:lua require("cleanup_plugins").check_plugin_status()
```

All plugins should show "✅ Installed" status.

## Prevention
To prevent future issues:
1. Keep your LazyVim configuration updated
2. Monitor plugin updates regularly
3. Use the enhanced configuration settings provided in this repo
4. Consider using a more stable internet connection for initial setup

## Files Modified/Created
- `lua/config/lazy.lua` - Enhanced with better timeout handling
- `lua/plugins/core-fixes.lua` - Robust plugin configurations
- `cleanup_plugins.lua` - Cleanup and diagnostic tools
- `PLUGIN_FIX_GUIDE.md` - This guide

## Support
If you continue to experience issues:
1. Check the LazyVim GitHub issues
2. Verify your Neovim version is up to date
3. Ensure you have sufficient disk space
4. Check system resources during installation 