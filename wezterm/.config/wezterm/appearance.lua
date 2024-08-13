local wt = require("wezterm")

local function is_dark()
	if wt.gui then
		-- wt.log_info(wt.gui.get_appearance())
		return wt.gui.get_appearance():find("Dark")
	end
	return true
end

return {
	is_dark = is_dark,
}
