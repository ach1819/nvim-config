local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')


local function get_windows()
    local windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local bufname = vim.api.nvim_buf_get_name(buf)
        local win_id = tostring(win)
        local line = vim.api.nvim_win_get_cursor(win)[1]
        local col = vim.api.nvim_win_get_cursor(win)[2]
        table.insert(windows, {win_id, bufname, line, col})
    end
    return windows
end

local function windows_picker()
    pickers.new({}, {
        prompt_title = 'Windows',
        finder = finders.new_table({
            results = get_windows(),
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry[2] .. " [Window ID: " .. entry[1] .. "]",
                    ordinal = entry[2],
                    win_id = entry[1]
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.api.nvim_set_current_win(tonumber(selection.win_id))
            end)
            return true
        end,
    }):find()
end



vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>w', windows_picker, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
