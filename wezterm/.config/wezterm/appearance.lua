local wt = require("wezterm")

return {
	is_dark = function()
		return wt.gui.get_appearance():find("Dark")
	end,
}
