--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--
-- -----------------------------------------------------
-- Full documentation https://wiki.hypr.land

-- Device selection by hostname: turing = laptop, jarvis = desktop.
local DEVICES = { turing = "laptop", jarvis = "desktop" }

local hostname = (io.open("/etc/hostname"):read("l") or ""):gsub("%s+$", "")
local device = DEVICES[hostname] or "desktop"
if not DEVICES[hostname] then
    hl.notification.create({ text = "hyprland.lua: hostname '" .. hostname .. "' sconosciuto, uso il profilo desktop", timeout = 8000 })
end

-- On "hyprctl reload" Lua keeps required modules cached in package.loaded,
-- so edits to conf/*.lua would be ignored. Drop the cache so they are re-read.
for name in pairs(package.loaded) do
    if name:match("^conf%.") then package.loaded[name] = nil end
end

require("conf.monitor-" .. device)
require("conf.autostart-" .. device)
require("conf.cursor")
require("conf.environments-" .. device)
require("conf.input")
require("conf.general")
require("conf.decoration")
require("conf.animations")
require("conf.layouts")
require("conf.gestures")
require("conf.misc")
require("conf.windowrules")
require("conf.binds")

-- Notify systemd that the graphical session is up (required for xdg-desktop-portal → screen sharing)
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user start hyprland-session.target")
end)
