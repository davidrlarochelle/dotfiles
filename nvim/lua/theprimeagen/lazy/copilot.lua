return {
  {
    'github/copilot.vim',
    config = false,
    event = 'VeryLazy',
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    event = 'VeryLazy',
    dependencies = {'github/copilot.vim', 'nvim-lua/plenary.nvim'},
    opts = {
      debug = false,
    },
  },
}
