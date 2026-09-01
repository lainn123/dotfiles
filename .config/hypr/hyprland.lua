-- ==============================================================================
-- HYPRLAND - CONFIGURAÇÃO ADAPTADA DO MANGO WM
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- FUNÇÃO AUXILIAR DO PYWAL
-- ------------------------------------------------------------------------------
local function get_wal_color(line_num, default)
    local home = os.getenv("HOME") or ""
    local file = io.open(home .. "/.cache/wal/colors", "r")
    if not file then return default end

    local count = 0
    for line in file:lines() do
        if count == line_num then
            file:close()
            local hex = line:gsub("#", "")
            return "rgba(" .. hex .. "ff)"
        end
        count = count + 1
    end
    file:close()
    return default
end

-- Pega a cor principal/destaque (linha 4) e fundo (linha 0)
local wal_active = get_wal_color(4, "rgba(c9b890ff)")
local wal_inactive = get_wal_color(0, "rgba(444444ff)")

-- ------------------------------------------------------------------------------
-- 1. MONITORES
-- ------------------------------------------------------------------------------

hl.monitor({
    output = "DP-1",
    mode = "1920x1080@165",
    position = "0x0",
    scale = "1",
})

-- ------------------------------------------------------------------------------
-- 2. AUTOSTART / EXECUTÁVEIS
-- ------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------
-- 3. ENTRADA E TECLADO
-- ------------------------------------------------------------------------------

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3.5,
    bezier = "myBezier",
    style = "slide",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3.5,
    bezier = "myBezier",
    style = "slide",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "default",
    style = "slide",
})

hl.window_rule({
    match = {
        title = "^(Wallpaper Sidebar)$",
    },
    float = true,
})

hl.layer_rule({
    match = { namespace = "rofi" },
    animation = "popin",
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("/home/bocchi/.local/bin/wallpaper-selector"))
hl.bind(mainMod .." + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("sh -c 'cliphist list | rofi -dmenu -p \"Clipboard\" | cliphist decode | wl-copy -t image/png 2>/dev/null || cliphist list | rofi -dmenu -p \"Clipboard\" | cliphist decode | wl-copy'"))
hl.bind(mainMod .. " + L ", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker"))
hl.bind(mainMod .. " + minus", hl.dsp.exec_cmd("~/.local/bin/volume.sh down"))
hl.bind(mainMod ..  "  + equal", hl.dsp.exec_cmd("~/.local/bin/volume.sh up"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.local/bin/volume.sh mute"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next({ next = true }))

hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("mpc volume -5"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("mpc volume +5"))
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("mpc toggle"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("mpc prev"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("mpc next"))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.config({
    input = {
        kb_layout = "br",
        repeat_rate = 25,
        repeat_delay = 600,
        follow_mouse = 1,
        touchpad = {
            tap_to_click = true,
            tap_and_drag = true,
            disable_while_typing = true,
        },
    },
    -- ------------------------------------------------------------------------------
    -- 4. ASPECTO VISUAL E ANIMAÇÕES
    -- ------------------------------------------------------------------------------
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 3,
        col = {
            active_border = wal_active,
            inactive_border = wal_inactive,
        },
    },
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
        },
        shadow = {
            enabled = false,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = false,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("wal -R")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
end)

env = XCURSOR_SIZE,24
env = XCURSOR_THEME,Adwaita

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = false,
})


