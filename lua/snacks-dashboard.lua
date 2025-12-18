-- =============================================================================
-- WHAT: Dashboard configuration for snacks.nvim
-- WHY: Extracted from snacks.lua to follow KISSME principle (Modularize Everything)
-- HOW: Returns a table with dashboard preset, header, and dynamic sections
-- NOTE: This keeps snacks.lua focused on plugin setup; dashboard logic lives here
-- -----------------------------------------------------------------------------
return {
  -- stylua: ignore start
  header = [[
    ▄ ▄                                                            ▄ ▄    
  █ ▀ ▀ █   ██  ██ ██  ██ █████▄ ██████ █████▄  ▄▄▄▄▄ ▄▄ ▄▄ ▄▄   █ ▀ ▀ █  
 █       █  ██████  ▀██▀  ██▄▄█▀ ██▄▄   ██▄▄██▄ ██▄▄  ██ ▀█▄█▀  █       █ 
█  ▄▄▄▄▄  █ ██  ██   ██   ██     ██▄▄▄▄ ██   ██ ██    ██ ██ ██ █  ▄▄▄▄▄  █]],
  -- stylua: ignore end
  -- ===========================================================================
  -- WHAT: Dashboard sections with tiered terminal animation support
  -- WHY: Gracefully handle optional dependencies (cbonsai, fortune, cowsay, bat, lolcat)
  -- HOW: Try cbonsai first, then fall back to shell command chains if available
  -- NOTE: vim.fn.executable returns 1 if found, 0 if not (Lua treats 0 as false)
  -- ---------------------------------------------------------------------------
  formats = {
    key = function(item)
      return {
        { '[', hl = 'special' },
        { item.key, hl = 'key' },
        { ']', hl = 'special' },
      }
    end,
  },
  sections = (function()
    local sections = {}

    -- =========================================================================
    -- PRIORITY 1: Include cbonsai animation (best visual experience)
    -- -------------------------------------------------------------------------
    if vim.fn.executable('cbonsai') == 1 then
      table.insert(sections, {
        section = 'terminal',
        cmd = 'cbonsai -li -b 3 -M 3 -L 16',
        height = 12,
        padding = 0,
      })
    else
      -- =======================================================================
      -- PRIORITY 2: Fall back to alternative terminal commands
      --             (fortune + cowsay/bat/lolcat)
      -- WHAT: Build a command based on available utilities
      -- WHY: Create visually interesting terminal output
      --      with what the user has installed
      -- HOW: Check for fortune, cowsay, bat, lolcat in priority order
      -- -----------------------------------------------------------------------
      local has_fortune = vim.fn.executable('fortune') == 1
      local has_cowsay = vim.fn.executable('cowsay') == 1
      local has_bat = vim.fn.executable('bat') == 1
      local has_lolcat = vim.fn.executable('lolcat') == 1

      -- Only include terminal section if user has at least one alternative package
      if has_fortune or has_cowsay or has_bat or has_lolcat then
        -- Start with fortune if available, otherwise a thank you message
        local cmd = has_fortune and 'fortune -s'
          or 'echo "Thank you for using HYPERfix.nvim!"'

        -- Add cowsay if available (converts output to ASCII art speech bubble)
        if has_cowsay then cmd = cmd .. ' | cowsay' end

        -- Add color: prefer bat (syntax highlighting), fall back to lolcat
        if has_bat then
          cmd = cmd .. ' | bat -pp -l ps1'
        elseif has_lolcat then
          cmd = cmd .. ' | lolcat'
        end

        table.insert(sections, {
          section = 'terminal',
          cmd = cmd,
          height = 12,
          padding = 0,
        })
      end
      -- If none of the above packages are available, skip terminal section entirely
    end

    -- Core dashboard sections (always included)
    table.insert(sections, {
      section = 'header',
      padding = 1,
    })
    table.insert(sections, {
      icon = '🧚',
      title = 'Bookmarks',
      section = 'keys',
      indent = 3,
    })
    table.insert(sections, {
      icon = '🧚‍♀️',
      title = 'Recent Files',
      section = 'recent_files',
      limit = 3,
      indent = 3,
    })
    table.insert(sections, { section = 'startup' })

    return sections
  end)(),
}
