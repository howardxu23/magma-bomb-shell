local explosion_animations = require("__base__.prototypes.entity.explosion-animations")

-- adding extra effects to nuke
--[[
local atomic_explosion = table.deepcopy(data.raw.projectile["atomic-rocket"].action)

local instant_damage = {
    type = "nested-result",
    action = {
        radius = 35,
        type = "area",
        action_delivery = {
            type = "instant",
            target_effects = {
                {
                    type = "damage",
                    damage = { amount = 6942, type = "poison" },
                },
                {
                    type = "damage",
                    damage = { amount = 6942, type = "physical" },
                }
            },
        },
    },
}
    
table.insert(atomic_explosion.action_delivery.target_effects, 1, instant_damage)
]]--

data:extend({
        {
        type = "artillery-projectile",
        name = "magma-bomb-projectile",
        flags = {"not-on-map"},
        hidden = true,
        reveal_map = true,
        map_color = {1, 1, 0},
        picture =
        {
        filename = "__base__/graphics/entity/artillery-projectile/shell.png",--projectile image
        draw_as_glow = true,
        width = 64,
        height = 64,
        scale = 0.5
        },
        shadow =
        {
        filename = "__base__/graphics/entity/artillery-projectile/shell-shadow.png",
        width = 64,
        height = 64,
        scale = 0.5
        },
        chart_picture =
        {
        filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",--blast wave chart
        flags = { "icon" },
        width = 64,
        height = 64,
        priority = "high",
        scale = 0.25
        },
        --action = atomic_explosion,
        action=
        {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
            {
                type = "nested-result",
                action =
                {
                type = "area",
                radius = 40.0,
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                    {
                        type = "damage",
                        damage = {amount = 1000 , type = "physical"}
                    },
                    {
                        type = "damage",
                        damage = {amount = 6900 , type = "plasma"}
                    }
                    }
                }
                }
            },
            {
                type = "create-trivial-smoke",
                smoke_name = "artillery-smoke",
                initial_height = 0,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.005,
                offset_deviation = {{-4, -4}, {4, 4}},
                max_radius = 3.5,
                repeat_count = 4 * 4 * 15
            },
            {
                type = "create-entity",
                --entity_name = "big-artillery-explosion"
                entity_name = "atomic-rocket"
            },
            {
                type = "show-explosion-on-chart",
                scale = 8/32
            }
            }
        }
        },
        
        final_action =
        {
        type = "direct",
        action_delivery =
        {
            type = "instant",
            target_effects =
            {
            {
                type = "create-entity",
                entity_name = "medium-scorchmark-tintable",
                check_buildability = true
            },
            {
                type = "invoke-tile-trigger",
                repeat_count = 1
            },
            {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 3.5 -- large radius for demostrative purposes
            }
            }
        }
        },
        height_from_ground = 280 / 64
    },
})