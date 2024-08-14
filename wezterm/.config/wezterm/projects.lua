local wt = require("wezterm")

local module = {}

local function project_dirs()
	return {
		{ id = "~/Informal/Code/malachite", label = "malachite" },
		{ id = "~/Informal/Code/hermes", label = "hermes" },
		{ id = "~/Informal/Code/tendermint-rs", label = "tendermint-rs" },
		{ id = "~/Informal/Code/ibc-rs", label = "ibc" },
		{ id = "~/Informal/Code/ibc-proto", label = "ibc-proto" },
		{ id = "~/Code/effed", label = "effed" },
		{ id = "~/Code/choreo", label = "choreo" },
		{ id = "~/Code/cmv", label = "cmv-rs" },
	}
end

function module.choose_project()
	return wt.action.InputSelector({
		title = "Projects",
		choices = project_dirs(),
		fuzzy = true,
		action = wt.action_callback(function(child_window, child_pane, id, label)
			if not label or not id then
				return
			end

			local cwd = id:gsub("^~", wt.home_dir)
			wt.log_info(cwd)

			child_window:perform_action(
				wt.action.SwitchToWorkspace({
					name = label,
					spawn = { cwd = cwd },
				}),
				child_pane
			)
		end),
	})
end

return module
