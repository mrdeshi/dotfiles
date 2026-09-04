-- ----------------------------------------------------- 
-- Monitor Multiple
-- name: "multiple"
-- ----------------------------------------------------- 


hl.monitor({
    output = "DP-3",
    mode = "1920x1080@144",
    position = "0x0",
    scale = "1",
    transform = 1,
})

hl.monitor({
    output = "DP-2",
    mode = "3840x2160@60",
    position = "1080x0",
    scale = "1.5",
})

hl.monitor({
    output = "",
    mode = "1920x1080",
    position = "auto",
    scale = "1",
})

