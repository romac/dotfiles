local wt = require("wezterm")
local projects = require("projects")

local function move_pane(key, direction)
	return {
		key = key,
		mods = "CTRL",
		action = wt.action.ActivatePaneDirection(direction),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wt.action.AdjustPaneSize({ direction, 3 }),
	}
end

local function apply(config)
	config.leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	config.keys = {
		-- Move panes
		move_pane("j", "Down"),
		move_pane("k", "Up"),
		move_pane("h", "Left"),
		move_pane("l", "Right"),

		-- Split panes
		{
			key = "Enter",
			mods = "CMD",
			action = wt.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "Enter",
			mods = "CMD|SHIFT",
			action = wt.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},

		-- Edit settings
		{
			key = ",",
			mods = "CMD",
			action = wt.action.SpawnCommandInNewTab({
				cwd = wt.home_dir,
				args = { "nvim", wt.config_dir },
			}),
		},

		-- Projects
		{
			key = "p",
			mods = "LEADER",
			action = projects.choose_project(),
		},

		-- Workspaces
		{
			key = "f",
			mods = "LEADER",
			action = wt.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},

		-- Resize panes
		{
			key = "r",
			mods = "LEADER",
			action = wt.action.ActivateKeyTable({
				name = "resize_panes",
				one_shot = false,
				timeout_milliseconds = 1000,
			}),
		},

		-- Clear scrollback
		{
			key = "k",
			mods = "CMD|SHIFT",
			action = wt.action.Multiple({
				wt.action.ClearScrollback("ScrollbackAndViewport"),
				wt.action.SendKey({ key = "L", mods = "CTRL" }),
			}),
		},

		-- Ctrl-A
		{
			key = "a",
			mods = "LEADER|CTRL",
			action = wt.action.SendKey({ key = "a", mods = "CTRL" }),
		},
	}

	config.key_tables = {
		resize_panes = {
			resize_pane("j", "Down"),
			resize_pane("k", "Up"),
			resize_pane("h", "Left"),
			resize_pane("l", "Right"),
		},
	}
end

return { apply = apply }
