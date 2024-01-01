local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local session_manager = require("session_manager")
local launcher = require("launcher")

local mod = "CTRL|SHIFT"

-- 默认最大化
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {
	wsl_domains = {
		{
			name = "WSL:Arch",
			distribution = "Arch",
			username = "yqwu",
			default_cwd = "/home/yqwu/",
		},
	},
	default_domain = "WSL:Arch",

	window_decorations = "NONE", -- 关闭标题栏

	launch_menu = launcher,

	-- Tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	show_tab_index_in_tab_bar = false,
	tab_max_width = 35,

	window_close_confirmation = "NeverPrompt",
	color_scheme = "tokyonight_moon",
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	window_background_opacity = 1.0,
	inactive_pane_hsb = {
		saturation = 0.85,
		brightness = 0.85,
	},

	-- Padding
	window_padding = { left = 10, right = 10, top = 10, bottom = 10 },

	-- Misc
	adjust_window_size_when_changing_font_size = false,

	-- disable_default_key_bindings = true,
	keys = {
		-- Tab
		{ -- 新建tab
			key = "t",
			mods = mod,
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{ -- 左移tab
			key = "LeftArrow",
			mods = mod,
			action = act.MoveTabRelative(-1),
		},
		{ -- 右移tab
			key = "RightArrow",
			mods = mod,
			action = act.MoveTabRelative(1),
		},
		{ -- 重命名Tab
			key = "r",
			mods = mod,
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		-- Pane
		{ -- Horizontal split
			key = "+",
			mods = mod,
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{ -- Vertical split
			key = "_",
			mods = mod,
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{ -- 关闭Pane
			key = "w",
			mods = mod,
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		-- Resize Pane
		{
			key = "LeftArrow",
			mods = mod,
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "RightArrow",
			mods = mod,
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "UpArrow",
			mods = mod,
			action = act.AdjustPaneSize({ "Up", 3 }),
		},
		{
			key = "DownArrow",
			mods = mod,
			action = act.AdjustPaneSize({ "Down", 3 }),
		},
		-- Move between pane
		{
			key = "H",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "K",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "J",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "!",
			mods = "CTRL|SHIFT",
			action = session_manager,
		},
	},
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

return config
