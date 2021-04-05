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

    while true do
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