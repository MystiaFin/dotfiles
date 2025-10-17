local M = {}

M.setup = function()
  require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
      window = {
        mappings = {
          ["<C-n>"] = "add",
          ["<C-d>"] = "delete",
          ["<C-b>"] = "close_window",
          ["<C-r>"] = "rename",
          ["<C-x>"] = "cut_to_clipboard",
          ["h"] = function(state)
            local node = state.tree:get_node()
            local commands = require("neo-tree.sources.filesystem.commands")
            if node.type == "directory" and node:is_expanded() then
              commands.close_node(state)
            else
              local parent_id = node:get_parent_id()
              if parent_id then
                commands.close_node(state, parent_id)
              end
            end
          end,
        },
      },
    },
  })

  -- Smart toggle/focus for Neo-tree using <C-b>
  vim.keymap.set("n", "<C-b>", function()
    local neotree_bufnr = nil

    -- Check if any window currently shows Neo-tree
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "neo-tree" then
        neotree_bufnr = buf
        -- If current window is already Neo-tree → close it
        if win == vim.api.nvim_get_current_win() then
          require("neo-tree.command").execute({ action = "close" })
          return
        else
          -- Otherwise, jump focus to Neo-tree window
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end

    -- If Neo-tree not open → open and focus it
    require("neo-tree.command").execute({
      toggle = true,
      source = "filesystem",
      position = "left",
      reveal = true,
    })
  end, { silent = true, desc = "Neo-tree: smart toggle/focus" })
end

return M
