-- =============================================================================
-- AMP.NVIM
-- REF: https://github.com/sourcegraph/amp.nvim
-- -----------------------------------------------------------------------------
return {
  'sourcegraph/amp.nvim',
  lazy = true,
  event = { 'BufRead' },
  branch = 'main',
  config = function()
    -- =========================================================================
    -- WHAT: Send a quick message to the agent
    -- NOTE: nargs="*" lets the command accept multi-word arguments
    -- -------------------------------------------------------------------------
    local amp_message = require('amp.message')
    vim.api.nvim_create_user_command('AmpSend', function(cmdopts)
      local message = cmdopts.args or ''
      if message == '' then
        print('Please provide a message to send')
        return
      end
      amp_message.send_message(message)
    end, {
      nargs = '*',
      desc = 'Send a message to Amp',
    })

    -- =========================================================================
    -- WHAT: Send entire buffer contents
    -- NOTE: We use nargs="?" because no args are required
    -- -------------------------------------------------------------------------
    vim.api.nvim_create_user_command('AmpSendBuffer', function()
      local buf = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local content = table.concat(lines, '\n')
      amp_message.send_message(content)
    end, {
      nargs = '?',
      desc = 'Send current buffer contents to Amp',
    })

    -- =========================================================================
    -- WHAT: Add selected text directly to prompt
    -- WHY: Lets you highlight a range and send only that selection
    -- HOW: Use a range command (range = true) so opts.line1/line2 are populated
    -- NOTE: Use <line1-1> because lua index is 0-based for buf_get_lines start
    -- -------------------------------------------------------------------------
    vim.api.nvim_create_user_command('AmpPromptSelection', function(cmdopts)
      local start_line = cmdopts.line1
      local end_line = cmdopts.line2
      if not start_line or not end_line then
        print(
          'Please provide a visual selection or :<start>,<end>AmpPromptSelection'
        )
        return
      end
      local lines =
        vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      local text = table.concat(lines, '\n')
      amp_message.send_message(text)
    end, {
      range = true,
      desc = 'Send selected lines to Amp',
    })
  end,
}
