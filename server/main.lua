-- Callback

lib.callback.register('smeltingvehicle:server:getOwnedAll', function(source)
	local ownedCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

    local response = MySQL.query.await('SELECT vehicle, plate, garage FROM `owned_vehicles` WHERE `owner` = ?', { -- Get kendaraan kamu di database
        xPlayer.identifier
    })

    for _,v in pairs(response) do
        local vehicle = json.decode(v.vehicle)
        ownedCars[#ownedCars+1] = {vehicle = vehicle, plate = v.plate, garage = v.garage, vehiclename = v.vehiclename} -- Membuat tabel
    end

    return ownedCars -- melemparkan ke client hasil get database itu
end)

lib.callback.register('naufal-garage:server:deletegarages', function(source, plate)
	local src = source
	if not plate then return end

    -- Hapus kendaraan sesuai platenyaa
    exports.oxmysql:execute('DELETE FROM owned_vehicles WHERE plate = ?', {plate})

    -- notifikasi terhapu
    TriggerClientEvent('esx:showNotification', src, 'Plate '..plate..' Berhasil dilebur')
    return true
end)