# Naufal Information Player
Delete Vehicle Player ESX

QBCORE and QBX Soon

## Features ESX

- Menghapus kendaraan kamu di database sesuai plate dan model kendaraan
- Easy Config
- Bisa Menggunakan target dann interaksi E
- Pemberitahuan sebelum menghapus kendaraan
- Optimize

## Features Qb-Core
Soon

# Config settings
```lua
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

```

## Usage

- open the menu information player is "o"
- menu keybind can be customized inside settings and Fivem keybinds

## Previews Penggunaan

![preview1](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/1.png)
![preview2](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/2.png)
![preview3](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/3.png)
![preview4](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/4.png)

# Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core) -- if using qbcore
- [esx](https://github.com/esx-framework/esx_core) -- if using esx
- [qb-menu](https://github.com/qbcore-framework/qb-menu) -- soon
- [ox_lib](https://github.com/overextended/ox_lib) -- if using context
