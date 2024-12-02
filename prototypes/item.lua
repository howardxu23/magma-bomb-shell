local item_sounds = require("__base__.prototypes.item_sounds")

 --recipes

 --standard navuis recipe
local recipes=
 
{
    type = "recipe",
    name = "howardxu23-magma-bomb-shell-recipe",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
        {type = "item", name = "artillery-shell", amount = 1},
        {type = "item", name = "uranium-235", amount = 150},
        {type = "item", name = "advanced-circuit", amount = 4}
    },
    results = {{type="item", name="howardxu23-magma-bomb-shell", amount=1}}
}

--for when space age is up, add an alternative crafting for magma bombs on vulcanus
local vulcanus_recipe

if mods["space-age"] then
    vulcanus_recipe=
    {
        type = "recipe",
        name = "howardxu23-magma-bomb-shell-recipe-v2",
        category = "crafting-with-fluid",
        energy_required = 30,
        enabled = false,
        ingredients =
        {
            {type = "item", name = "tungsten-plate", amount = 20},
            {type = "fluid", name = "lava", amount = 200},
            {type = "item", name = "advanced-circuit", amount = 4}
        },
        results = {{type="item", name="howardxu23-magma-bomb-shell", amount=1}}
    }
end
data:extend(
	{

        --magma bomb shell ammo class
		{
            type = "ammo",
            name = "howardxu23-magma-bomb-shell",
            icon = "__Magma-bomb-shell__/graphics/magma-bomb.png",
            icon_size=64,
            
            ammo_category = "artillery-shell",
            ammo_type =
            {
                range_modifier = 1,
                target_type = "position",
                action =
                {
                    type = "direct",
                    action_delivery =--this spawns the muzzle flash
                    {
                        type = "artillery",
                        projectile = "magma-bomb-projectile",--fires this projectile
                        starting_speed = 1,
                        direction_deviation = 0,
                        range_deviation = 0,
                        source_effects =
                        {
                            type = "create-explosion",
                            entity_name = "artillery-cannon-muzzle-flash"
                        }
                    }
                }
            },
            subgroup = "ammo",
            order = "d[explosive-cannon-shell]-d[artillery]",
            inventory_move_sound = item_sounds.artillery_large_inventory_move,
            pick_sound = item_sounds.artillery_large_inventory_pickup,
            drop_sound = item_sounds.artillery_large_inventory_move,
            stack_size = 20,
            weight = 100*kg
        },

        recipes,
        vulcanus_recipe
        

    }
)
    