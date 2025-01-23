function sprite(image_name)
    base_file_name="__Magma-bomb-shell-dev__"--REMEMBER TO REMOVE DEV

    img_Location=base_file_name.."/graphics/"
    img_Location=img_Location..image_name

    return img_Location
end

require("prototypes.technology")
require("prototypes.item")
require("prototypes.entity.projectiles")
require("prototypes.damage-types")