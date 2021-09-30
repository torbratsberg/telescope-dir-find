local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local dir_find = {}

dir_find.search_dirs = function()
	require('telescope.builtin').find_files({
		prompt_title = 'Find files in dirs',
		search_dirs = vim.api.nvim_get_var('search_dirs')
	})
end


local getDirTable = function()
	local res = io.popen("fd -H -t d -d 10"):read("*a")
	local sep = '\n'

	local t={}
	for str in string.gmatch(res, "([^"..sep.."]+)") do
		table.insert(t, str)
	end

	return t
end

dir_find.select_dirs = function()
	local result = getDirTable()

	local pick = pickers.new({}, {
		prompt_title = "Select search dirs",
		sorter = conf.generic_sorter(),
		finder = finders.new_table {
			results = result
		},

		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				local picker = action_state.get_current_picker(prompt_bufnr)

				local selected = {}
				for _, entry in ipairs(picker:get_multi_selection()) do
					local text = entry.text
					if not text then
						if type(entry.value) == "table" then
							text = entry.value.text
						else
							text = entry.value
						end
					end
					table.insert(selected, text)
				end
				vim.api.nvim_set_var('search_dirs', selected)

				actions.close(prompt_bufnr)
			end)
			return true
		end,
	}):find()
end

return dir_find
