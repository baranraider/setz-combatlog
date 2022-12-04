--ra1der#2112

QBCore = nil


Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
        Citizen.Wait(200)
    end
end)
local sure = true

RegisterNetEvent('setz_combatlogsend')
AddEventHandler('setz_combatlogsend', function(konum, players, identifier, saat, sebep)
    Citizen.CreateThread(function()
        Wait(Config.Time)
        sure = false
    end)

    Citizen.CreateThread(function()
        sure = true
        while sure do
            local mesafe = #(GetEntityCoords(PlayerPedId()) - konum)
            if mesafe < 15.0 then
                DrawMarker(32, konum.x, konum.y, konum.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 255, 255, 255, 255, 0, 0, 0, 2, 0, 0, 0)
                if mesafe < 3 then
                    DrawText3Ds(konum.x, konum.y, konum.z + 0.5, "~b~ "..players.firstname.." "..players.lastname.."~w~ [ ~y~"..identifier.."  - "..saat.. " ~w~] \n ~g~[Sebep: "..sebep.."]  ~w~")
                end
            end
            Wait(7)
        end
    end)
end)

-- local sure = true
-- KOMUT HALİNİ KULLANMAK İSTEYENLER İÇİN
-- RegisterNetEvent('setz_combatlogsend')
-- AddEventHandler('setz_combatlogsend', function(konum, players, identifier, saat)
--     Citizen.CreateThread(function()
--         Wait(Config.Time)
--         sure = false
--     end)

--     Citizen.CreateThread(function()
--         sure = true
--         while sure do
--             local mesafe = #(GetEntityCoords(PlayerPedId()) - konum)
--             local sebep = "quit kasını kullandı"
--             if mesafe < 15.0 then
--                 DrawMarker(32, konum.x, konum.y, konum.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 255, 255, 255, 255, 0, 0, 0, 2, 0, 0, 0)
--                 if mesafe < 3 then
--                     DrawText3Ds(konum.x, konum.y, konum.z + 0.5, "~b~ "..players.firstname.." "..players.lastname.."~w~ [ ~y~"..identifier.."  - "..saat.. " ~w~] \n ~g~[Sebep: "..sebep.."]  ~w~")
--                 end
--             end
--             Wait(7)
--         end
--     end)
-- end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    -- local factor = (string.len(text)) / 350
    -- DrawRect(_x,_y+0.0125, 0.050+ factor, 0.03, 0, 0, 0, 75)
end
