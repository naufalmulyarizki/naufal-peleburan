CreateThread(function()
    -- Create Target System
    for k,v in ipairs(Config.Location['peleburankendaraan']) do

        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipScale(blip, v.blip.scale)
        SetBlipColour(blip, v.blip.color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.blip.name)
        -- EndTextCommandSetBlipName(blip)

        if Config.Target then
            exports.ox_target:addBoxZone({
                name = v.name .. k,
                radius = v.radius,
                coords = v.coords,
                size = v.size,
                debug = v.debug,
                rotation = v.rotation,
                options = {
                    {
                        label = v.label,
                        icon = v.icon,
                        onSelect = function()
                            GarasiLebur()
                        end
                    }
                },
            })
        else
            local point = lib.points.new({
                coords = v.coords,
                distance = 2,
                onEnter = function(self)
                    -- print('entered range of point', self.id)
                    lib.showTextUI('[E] - Lebur Kendaraaan', {
                        icon = v.icon,
                        position = 'left-center'
                    })
                end,
                onExit = function(self)
                    lib.hideTextUI()
                end,
                nearby = function(self)
                    DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 50, false, true, 2, false, nil, nil, false)
    
                    if self.currentDistance < 2 and IsControlJustReleased(0, 38) then
                        GarasiLebur()
                    end
                end,
            })
        end
    end
end)

function GarasiLebur()
	lib.callback('smeltingvehicle:server:getOwnedAll', false, function(garage)	-- Callback Mendapatkan kendaraan
        if #garage > 0 then -- Validasi Apakah memiliki kendaraan lebih dari satu
			local garagelebur = {}

			for k,v in ipairs(garage) do -- Loop untuk mendapatkan garage
				local hashVehicule = v.vehicle.model -- Get Vehicle Model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule) -- Mendapatkan nama model kendaraan
				vehicleName = GetLabelText(aheadVehName) -- Mendapatkan nama label kendaran yang sudah terdaftarkan di server kamu
				garagelebur[#garagelebur+1] = {
					title = vehicleName, -- title
					description = 'Plate: ' ..v.plate, -- description
					image = 'https://imgur.com/x6WHm7f.png', -- image vehicle
                    icon = 'car-burst', -- icon kendaraan
					progress = 100,
					colorScheme = 'blue',
					arrow = true,
					metadata = {
						{label = 'Plate', value = v.plate},
					},
					onSelect = function()
                        -- Send peringatan 
						local alert = lib.alertDialog({
							header = 'Hey Temanku...',
							content = 'Apakah kamu mau yakin mau lebur plate ' .. v.plate,
							centered = true,
							cancel = true
						})
						if alert == 'confirm' then -- ketika klik confirm
							lib.callback('naufal-garage:server:deletegarages', false, function()
								GarasiLebur()
							end, v.plate)
						else -- ketika klik tidak
							GarasiLebur()
						end
					end,	
				}
			end
            
            -- Register context menggunakan oxlib
			lib.registerContext({
				id = "garagelebur",
				title = "Garage Menu (" .. #garage .. ") ",
				options = garagelebur
			})
			lib.showContext("garagelebur")
		else
            -- Notif ketikaa kamu tidak memiliki kendaraan di asuransi
			ESX.ShowNotification('Tidak Mempunyai Kendaraan')
		end
	end)
end
