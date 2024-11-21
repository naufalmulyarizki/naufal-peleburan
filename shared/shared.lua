Config = {}

Config.Location = { -- Edit the various interaction points for players or create new ones
	["peleburankendaraan"] = {
		[1] = { -- Federal
            name = 'peleburan',
            coords = vec3(-470.2190, -1721.9048, 18.6892),
            size = vec3(2.0, 3.0, 5.85),
            debug = false,
            radius = 1,
            rotation = 50,
            label = 'Lebur Kendaraan',
            icon = "fa fa-car-burst",
			groups = nil,
            blip = {
                name    = "Peleburan Kendaraan",
                sprite  = 380,
                scale   = 0.7,
                color   = 1
            },
        },
    }
}

Config.Target = false
