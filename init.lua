local path = minetest.get_modpath('extra_crafts')

dofile(path .. "/unsorted.lua")

if minetest.get_modpath("pipeworks") then
    dofile(path .. "/pipeworks.lua")
end
