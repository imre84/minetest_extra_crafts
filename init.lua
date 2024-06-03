local path = minetest.get_modpath('extra_crafts')

local function cdo(moddep)
    if minetest.get_modpath(moddep) then
        dofile(path .. "/" .. moddep .. ".lua")
    end
end

cdo("default")
cdo("pipeworks")
cdo("mesecons")
