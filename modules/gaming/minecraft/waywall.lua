-- ==== IMPORTS ====
local waywall = require("waywall")
local helpers = require("waywall.helpers")

-- ==== KEYS ====
local thin = "*-v"
local tall = "*-Alt_L"
local wide = "*-c"

local toggle_ninbot = "*-apostrophe"
local launch_paceman = "Shift-P"
local fullscreen = "Shift-O"

local remapped_kb = {
    ["Tab"] = "F3",
    ["capslock"] = "esc",
}

-- ==== SENSITIVITIES ====
local normal_sens = 6.70270577
local tall_sens = 0.45216052

-- ==== PATHS ====
local home_path = os.getenv("HOME") .. "/"
local pacem_path = home_path .. "config/waywall/resources/paceman-tracker-0.7.0.jar"
local nb_path = home_path .. ".config/waywall/resources/Ninjabrain-Bot-1.5.1.jar"
local overlay_path = home_path .. ".config/waywall/measuring_overlay.png"


-- ==== HELPERS ====
local is_ninb_running = function()
    local handle = io.popen("pgrep -f 'ninjabrain'")
    local result = handle:read("*l")
    handle:close()
    return result ~= nil
end

local is_pacem_running = function()
    local handle = io.popen("pgrep -f 'paceman..*'")
    local result = handle:read("*l")
    handle:close()
    return result ~= nil
end

-- ==== RESIZE HELPER ====
local remaps_active = true

local function resize_helper(mode, run, ingame_only)
    local resize = function()
        if not remaps_active then
            return false
        end
        if mode.f3_safe and waywall.get_key("F3") then
            return false
        end
        return run()
    end

    if ingame_only then
        return helpers.ingame_only(resize)
    end

    return resize
end

-- ==== MIRRORS ====
local make_mirror = function(options)
    local this = nil

    return function(enable)
        if enable and not this then
            this = waywall.mirror(options)
        elseif this and not enable then
            this:close()
            this = nil
        end
    end
end

local mirrors = {
    thin_e = make_mirror({
        src = { x = 0, y = 37, w = 85, h = 9 },
        dst = { x = 1450, y = 747, w = 4 * 85 * 1.5, h = 4 * 9 * 1.5 },
    }),

    tall_e = make_mirror({
        src = { x = 0, y = 37, w = 85, h = 9 },
        dst = { x = 1450, y = 747, w = 4 * 85 * 1.5, h = 4 * 9 * 1.5 },
    }),

    tall_pie = make_mirror({
        src = { x = 0, y = 15958, w = 340, h = 426 },
        dst = { x = 1450, y = 801, w = 340 * 1.5, h = 426 * 1.5 },
    }),

    eye_measure = make_mirror({
        src = { x = 155, y = 7902, w = 30, h = 580 },
        dst = { x = 0, y = 493, w = 1110, h = 624 },
    }),
}

local make_image = function(path, dst)
    local this = nil

    return function(enable)
        if enable and not this then
            this = waywall.image(path, dst)
        elseif this and not enable then
            this:close()
            this = nil
        end
    end
end

local images = {
    measuring_overlay = make_image(overlay_path, {
        dst = { x = 0, y = 493, w = 1110, h = 624 },
    }),
}

local show_mirrors = function(thin, tall, wide)
    mirrors.thin_e(thin)

    mirrors.tall_e(tall)
    mirrors.tall_pie(tall)

    mirrors.eye_measure(tall)
    images.measuring_overlay(tall)
end

local thin_enable = function()
    show_mirrors(true, false, false)
    waywall.set_sensitivity(normal_sens)
end

local tall_enable = function()
    show_mirrors(false, true, false)
    waywall.set_sensitivity(tall_sens)
end

local wide_enable = function()
    show_mirrors(false, false, true)
    waywall.set_sensitivity(normal_sens)
end

local res_disable = function()
    show_mirrors(false, false, false)
    waywall.set_sensitivity(normal_sens)
end

-- ==== RESOLUTIONS ====
local make_res = function(width, height, enable, disable)
    return function()
        local active_width, active_height = waywall.active_res()

        if active_width == width and active_height == height then
            waywall.set_resolution(0, 0)
            disable()
        else
            waywall.set_resolution(width, height)
            enable()
        end
    end
end

local resolutions = {
    thin = make_res(340, 1440, thin_enable, res_disable),
    tall = make_res(340, 16384, tall_enable, res_disable),
    wide = make_res(2560, 400, wide_enable, res_disable),
}

-- ==== CONFIG ====
local config = {
    input = {
        layout = "us",
        repeat_rate = 40,
        repeat_delay = 300,
        remaps = remapped_kb,
        sensitivity = normal_sens,
        confine_pointer = false,
    },
    theme = {
        background = "#282828",
        ninb_anchor = "topright",
        ninb_opacity = 1,
    },
}

config.actions = {

    [thin] = resize_helper(
        {f3_safe = true}, 
        resolutions.thin,
        true              
    ),
    
    [tall] = resize_helper(
        {f3_safe = true}, 
        resolutions.tall,
        true              
    ),
    
    [wide] = resize_helper(
        {f3_safe = true}, 
        resolutions.wide,
        true              
    ),

    [toggle_ninbot] = function()
        if not is_ninb_running() then
            waywall.exec(programs.ninjabrain_bot)
            waywall.show_floating(true)
        else
            helpers.toggle_floating()
        end
    end,

    [launch_paceman] = function()
        if not is_pacem_running() then
            waywall.exec("java -jar " .. pacem_path .. " --nogui")
        end
    end,

    [fullscreen] = waywall.toggle_fullscreen,
}

return config
