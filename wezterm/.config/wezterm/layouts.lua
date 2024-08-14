local wt = require("wezterm")

local M = {}

local function layouts()
	return {
		{ id = "grid", label = "grid" },
		{ id = "fat", label = "fat" },
	}
end

function M.choose_layout()
	return wt.action.InputSelector({
		title = "Layouts",
		choices = layouts(),
		fuzzy = true,
		action = wt.action_callback(function(_child_window, _child_pane, id, label)
			if not label or not id then
				return
			end

			local cwd = id:gsub("^~", wt.home_dir)
			wt.log_info(cwd)

			-- child_window:perform_action(
			-- 	wt.action.SwitchToWorkspace({
			-- 		name = label, -- label:match("([^/]+)$"),
			-- 		spawn = {
			-- 			cwd = cwd,
			-- 			set_environment_variables = {
			-- 				PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
			-- 			},
			-- 		},
			-- 	}),
			-- 	child_pane
			-- )
		end),
	})
end

return M
