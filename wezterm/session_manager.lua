local json = require("json")
local wezterm = require("wezterm")
local act = wezterm.action

function session_name(sesssion) end

wezterm.log_error("Config Dir " .. wezterm.config_dir)
local f = assert(io.open(wezterm.config_dir .. "/sessions.json"))
local content = f:read("*all")
local sessions = json.decode(content)
f:close()

return act.InputSelector({
	action = wezterm.action_callback(function(window, pane, id, label)
		if not id and not label then
			wezterm.log_info("cancelled")
		else
			-- wezterm.log_info("you selected ", id, label)
			-- pane:send_text(id)
		end
	end),
	title = "Select a session",
	choices = {},
})
