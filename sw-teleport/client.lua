local ScreenFade = false -- Set this setting if you want to do ScreenFadeOut and ScreenFadeIn while you are teleporting. Duration is 0.5s

RegisterCommand('tp', function()
    local playerPed = PlayerPedId()

    local input = lib.inputDialog('Teleport yourself', {
        {type = 'input', label = 'X', description = 'Here put coords X', required = false},
        {type = 'input', label = 'Y', description = 'Here put coords Y', required = false},
        {type = 'input', label = 'Z', description = 'Here put coords Z', required = false}
    })

    if not input then return end

    local x = tonumber(input[1])
    local y = tonumber(input[2])
    local z = tonumber(input[3])

    if x and y and z then
        if ScreenFade then
            DoScreenFadeOut(500)
            Wait(500)
            DoScreenFadeIn(500)
        end
        SetEntityCoords(playerPed, x, y, z - 1, true, false, false, false)
    else
        print("The values entered are not valid numbers.")
    end
end)

RegisterCommand('getcoords', function()
    local playerPed = PlayerPedId()

    local PlayerCoords = GetEntityCoords(playerPed)
    local text = string.format("%s, %s, %s", PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)
    lib.setClipboard(text)

    lib.notify({
        title = 'Coords have been saved to your clipboard.',
        description = string.format("Your coords are: %s, %s, %s", PlayerCoords.x, PlayerCoords.y, PlayerCoords.z),
        type = 'success'
    })
end)
