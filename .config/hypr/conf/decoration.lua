-- See https://wiki.hyprland.org/Configuring/Variables/ for more
-- hyprglass plugin (Lua API, see https://github.com/hyprnux/HyprGlass)
-- NOTE: colors are Hyprland-style 0xAARRGGBB; rgb(000000) -> 0xff000000
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass
    hg.config({
        tint_color           = 0xff000000,
        brightness           = 1,
        contrast             = 1.0,
        saturation           = 1.0,
        vibrancy             = 1.0,
        chromatic_aberration = 2,
        fresnel_strength     = 0.0,
        blur_strength        = 0.0,
        blur_iterations      = 0,
        layers               = { enabled = true },
    })
    -- was: layers.namespaces = bar, dock, bezel, notifications
    hg.layer("bar")
    hg.layer("dock")
    hg.layer("bezel")
    hg.layer("notifications")
    -- was: layers.exclude_namespaces = some-debug-panel
    hg.layer("some-debug-panel", { exclude = true })
    -- was: layers.namespace_mask_thresholds = quickshell:bezel=0.3, background=0.0
    -- Bezel: glass only on solid content (alpha >= 0.3), shadows pass through
    hg.layer("quickshell:bezel", { mask_threshold = 0.3 })
    -- "background" was not in the old namespaces whitelist, so its threshold had no effect.
    -- Uncomment to enable full-area glass on the background layer:
    -- hg.layer("background", { mask_threshold = 0.0 })
end

hl.config({
    decoration = {
        rounding = 0, --20
        blur = {
            enabled = true,
            size = 3,
            passes = 0,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 2,
            color = "rgba(00000000)",
        },
    },
})

