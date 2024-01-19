function ExportColorsZathura()
    local zrc = "$HOME/.config/zathura/zathurarc"
    local fn = vim.fn
    local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
    local bg = fn.synIDattr(fn.hlID("Normal"), "bg")

    -- replace certain lines using | as delimiter for sed
    local s = 'set default-fg "\\' .. fg .. '"'
    vim.cmd("!sed -i '1s|.*|" .. s .. "|' " .. zrc)
    s = 'set recolor-darkcolor "\\' .. fg .. '"'
    vim.cmd("!sed -i '2s|.*|" .. s .. "|' " .. zrc)
    s = 'set default-bg "\\' .. bg .. '"'

    vim.cmd("!sed -i '3s|.*|" .. s .. "|' " .. zrc)
    s = 'set recolor-lightcolor "\\' .. bg .. '"'
    vim.cmd("!sed -i '4s|.*|" .. s .. "|' " .. zrc)

end

function ExportColorsKitty()
    local fn = vim.fn
    local filename = os.getenv("HOME") .. "/.config/kitty/nvim_export.conf"
    local file = io.open(filename, "w")
    io.output(file)
    io.write("# vim:ft=kitty" .. "\n\n")
    io.write("# exported from " .. vim.g.colors_name .. "\n\n")
    local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
    local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
    io.write("foreground " .. fg .. "\n")
    io.write("background " .. bg .. "\n")
    io.write("selection_foreground " .. bg .. "\n")
    io.write("selection_background " .. fg .. "\n")
    for i = 0,15 do
        local var = "g:terminal_color_" .. tostring(i)
        if fn.exists(var) == 1 then
            local tc = fn.eval(var)
            io.write("color" .. tostring(i) .. " " .. tc .. "\n")
            if i == 2 then
                io.write("cursor " .. tc .. "\n")
            end
        end
    end
    io.close(file)
    print("Colors exported to " .. filename)
end

local function hex2rgb(hex)
    hex = hex:gsub("#","")
    local r = tonumber("0x"..hex:sub(1,2))/255
    local g = tonumber("0x"..hex:sub(3,4))/255
    local b = tonumber("0x"..hex:sub(5,6))/255
    return r, g, b
end

function ExportColorsSioyek()
    local filename = os.getenv("HOME") .. "/.config/sioyek/prefs_user.config"
    local fn = vim.fn
    local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
    local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
    -- replace certain lines using | as delimiter for sed
    -- sed -i '' <-- zero length extension on macOS meaning no backup file
    local r, g, b = hex2rgb(bg)
    local s = "custom_background_color" .. string.format("%7.4f", r) .. string.format("%7.4f", g) .. string.format("%7.4f", b)
    vim.cmd("!sed -i '' '1s|.*|" .. s .. "|' " .. filename)
    r, g, b = hex2rgb(fg)
    s = "custom_text_color      " .. string.format("%7.4f", r) .. string.format("%7.4f", g) .. string.format("%7.4f", b)
    vim.cmd("!sed -i '' '2s|.*|" .. s .. "|' " .. filename)
end
