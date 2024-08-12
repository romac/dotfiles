local wt = require("wezterm")

local function apply(config)
	config.keys = {
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
		{
			key = ",",
			mods = "CMD",
			action = wt.action.SpawnCommandInNewTab({
				cwd = wt.home_dir,
				args = { "nvim", wt.config_file },
			}),
		},
		-- {
		-- 	key = "K",
		-- 	mods = "CMD",
		-- 	action = wt.action.Multiple({
		-- 		wt.action.ClearScrollback("ScrollbackAndViewport"),
		-- 		wt.action.SendKey({ key = "L", mods = "CTRL" }),
		-- 	}),
		-- },
	}
end

return { apply = apply }
