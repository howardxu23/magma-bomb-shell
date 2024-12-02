
local science_recipe={}

if mods["space-age"] then --checks if space age is enabled, if so use scince pack recipe
    science_recipe=
    {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"space-science-pack", 2}
    }
else 
    science_recipe=
    {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
    }
end
--for unlocking magma bomb on nauvis
local magma_bomb_navis_unlock=
{
    type = "technology",
    name = "howardxu23-magma-bomb-shell",
    icon = "__Magma-bomb-shell__/graphics/magma-bomb.png",
    icon_size = 256,
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "howardxu23-magma-bomb-shell-recipe"
        }
    },
    prerequisites = {"atomic-bomb", "artillery"},
    unit =
    {
        ingredients = science_recipe,
        --[[
        {
            
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 1},
            {"utility-science-pack", 1},
        },
        ]]--
        time = 30,
        count = 200
    }
}
local magma_bomb_vulcanus_unlock

if mods["space-age"] then
    magma_bomb_vulcanus_unlock=
    {
        type = "technology",
        name = "howardxu23-magma-bomb-shell-vulcanus",
        icon = "__Magma-bomb-shell__/graphics/magma-bomb-casting.png",
        icon_size = 256,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "howardxu23-magma-bomb-shell-recipe-v2"
            }
        },
        prerequisites = {"howardxu23-magma-bomb-shell", "metallurgic-science-pack"},
        unit =
        {
            ingredients = 
            
            {
                
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 2},
                {"metallurgic-science-pack", 1}
            },
            
            time = 30,
            count = 1000
        }
    }
end
--MAIN
data:extend
({
    magma_bomb_navis_unlock,
    magma_bomb_vulcanus_unlock
})






