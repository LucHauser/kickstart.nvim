-- Debuger for c-sharp

return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    config = function()
      local dap = require 'dap'

      local is_windows = vim.loop.os_uname().sysname:find 'Windows' ~= nil
      local debugger_name = is_windows and 'netcoredbg.exe' or 'netcoredbg'

      -- Build full path to debugger
      local debugger_path = vim.fn.stdpath 'data' .. '/mason/packages/netcoredbg/netcoredbg/' .. debugger_name

      -- Escape the path correctly for Windows
      debugger_path = vim.fn.fnameescape(debugger_path)

      -- Ensure Windows paths are correctly formatted
      if is_windows then
        debugger_path = debugger_path:gsub('/', '\\')
      end

      -- Debugger configuration
      dap.adapters.coreclr = {
        type = 'executable',
        command = debugger_path,
        args = { '--interpreter=vscode' }, -- Keep args simple for now
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch - .NET Core',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }

      -- DAP keymaps
      vim.keymap.set('n', '<F5>', function()
        dap.continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        dap.step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        dap.step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        dap.step_out()
      end)
      vim.keymap.set('n', '<Leader>b', function()
        dap.toggle_breakpoint()
      end)
    end,
  },
}
