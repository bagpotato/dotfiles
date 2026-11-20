hl.monitor({ output = "DP-2", mode = "2560x1440@240", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "2560x1440@240", position = "2560x0", scale = 1 })

local mod = "SUPER"
local terminal = "kitty"

hl.config({
  input = {
    kb_layout = "es",
  },
})

hl.on("hyprland.start", function()
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("serpantinumd start")
end)

hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())

hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("serpantinum msg toggle launcher"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("serpantinum msg toggle clipboard"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("serpantinum msg toggle wallpaper"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("serpantinum lock"))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
  hl.bind(mod .. " + " .. (i % 10), hl.dsp.exec_cmd("serpantinum msg workspace " .. i))
  hl.bind(mod .. " + SHIFT + " .. (i % 10), hl.dsp.exec_cmd("serpantinum msg workspace " .. i .. " move"))
end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
