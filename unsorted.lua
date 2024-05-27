minetest.register_craft({
    output = 'default:marram_grass_1 1',
    recipe = {
        {'bucket:bucket_water', 'bucket:bucket_water', 'bucket:bucket_water'},
        {'bonemeal:bonemeal', 'default:dry_shrub', 'bonemeal:bonemeal'},
        {'default:sand', 'default:sand', 'default:sand'},
    },
    replacements = {
        {"bucket:bucket_water", "bucket:bucket_water"},
        {"bucket:bucket_water", "bucket:bucket_water"},
        {"bucket:bucket_water", "bucket:bucket_water"},
        {"bonemeal:bonemeal", "bonemeal:bonemeal"},
        {"bonemeal:bonemeal", "bonemeal:bonemeal"},
        {"default:sand", "default:sand"},
        {"default:sand", "default:sand"},
        {"default:sand", "default:sand"},
    },
})
