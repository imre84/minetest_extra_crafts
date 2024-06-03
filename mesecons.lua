-- taken from mods/technic/extranodes/extramesecons.lua from https://lifomaps.de/mods-2021-02-03.tar.gz
-- license: as per mods/technic/README.md from same archive: "licensed under the LGPL, V2 or later"
-- keys got moved fromd default to keys mod, therefore default_key.png got replaced by keys_key.png

local S = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end

mesecon.register_node("extra_crafts:mesecon_switch_protected", {
    paramtype2="facedir",
    description="Switch (protected)",
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    after_place_node = function(pos, placer, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        meta:set_string("owner", placer:get_player_name() or "")
    end,
    on_rightclick = function (pos, node, player)
        local meta = minetest.get_meta(pos)
        local owner = meta:get_string("owner")
        local pname = player:get_player_name();
        if owner ~= pname then
            minetest.chat_send_player(pname, "This switch can only be used by " .. owner)
            return
        end
        if(mesecon.flipstate(pos, node) == "on") then
            mesecon.receptor_on(pos)
        else
            mesecon.receptor_off(pos)
        end
        minetest.sound_play("mesecons_switch", {pos=pos})
    end
},{
    groups = {dig_immediate=2},
    tiles = {   "mesecons_switch_side.png",
                "mesecons_switch_side.png",
                "mesecons_switch_side.png^keys_key.png^[transformR180",
                "mesecons_switch_side.png^keys_key.png^[transformR180FX",
                "mesecons_switch_side.png",
                "mesecons_switch_off.png^mesecons_switch_locked_frame.png"},
    mesecons = {receptor = { state = mesecon.state.off }}
},{
    groups = {dig_immediate=2, not_in_creative_inventory=1},
    tiles = {   "mesecons_switch_side.png",
                "mesecons_switch_side.png",
                "mesecons_switch_side.png^keys_key.png^[transformR180",
                "mesecons_switch_side.png^keys_key.png^[transformR180FX",
                "mesecons_switch_side.png",
                "mesecons_switch_on.png^mesecons_switch_locked_frame.png"},
    mesecons = {receptor = { state = mesecon.state.on }}
})

minetest.register_craft({
    output = "extra_crafts:mesecon_switch_protected_off 2",
    recipe = {
        {"default:steel_ingot", "default:cobble", "default:steel_ingot"},
        {"group:mesecon_conductor_craftable","default:skeleton_key", "group:mesecon_conductor_craftable"},
    }
})

minetest.register_craft({
    output = "extra_crafts:mesecon_switch_protected_off",
    type = "shapeless",
    recipe = {"default:skeleton_key", "mesecons_switch:mesecon_switch_off"}
})
