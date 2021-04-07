CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(500)
    end

    DecorRegister("gunstyle", 3)

    WarMenu.CreateMenu("weaponstyle", "Weapon style", "Select a weapon style")
    WarMenu.SetMenuTitleBackgroundColor("weaponstyle", 32, 28, 52, 255)
    WarMenu.SetMenuTitleBackgroundSprite("weaponstyle", "commonmenu", "gradient_nav")
    WarMenu.SetMenuTitleColor("weaponstyle", 255, 255, 255)
    WarMenu.SetMenuSubTitleColor("weaponstyle", 255, 255, 255)

    CreateThread(function()
        while true do
            Wait(250)
            local ped, gunstyle = PlayerPedId(), DecorGetInt(PlayerPedId(), "gunstyle")

            if gunstyle and gunstyle > 1 then
                local dict, anim = Config.Shootingstyles[gunstyle][3], Config.Shootingstyles[gunstyle][4]
                if dict and anim and IsPedArmed(ped, 4) then
                    while not HasAnimDictLoaded(dict) do
                        Wait(25)
                        RequestAnimDict(dict)
                    end

                    local _, hash = GetCurrentPedWeapon(ped, 1)
                    if IsPlayerFreeAiming(PlayerId()) or (IsControlPressed(0, 24) and GetAmmoInClip(ped, hash) > 0) then
                        if not IsEntityPlayingAnim(ped, dict, anim, 3) then
                            TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 49, 0, 0, 0, 0)
                            SetEnableHandcuffs(ped, true)
                        end
                    elseif IsEntityPlayingAnim(ped, dict, anim, 3) then
                        ClearPedTasks(ped)
                        SetEnableHandcuffs(ped, false)
                    end
                end
            else
                Wait(750)
            end
        end
    end)

    while true do
        local sleep = 2500

        for _, player in pairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            local gunstyle = DecorGetInt(ped, "gunstyle")

            if gunstyle and gunstyle > 0 and Config.Shootingstyles[gunstyle] then
                SetWeaponAnimationOverride(ped, Config.Shootingstyles[gunstyle][2])
            end
        end

        Wait(2500)
    end
end)