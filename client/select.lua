-- CRED TO VALENTINO FOR BASE SCRIPT & IDEA

function WeaponStyle()
	WarMenu.CloseMenu()
	WarMenu.OpenMenu("weaponstyle")
	while WarMenu.Begin("weaponstyle") do
		Wait(0)

		for k, v in pairs(Config.Shootingstyles) do
			if WarMenu.Button(v[1]) then
				DecorSetInt(PlayerPedId(), "gunstyle", k)
				SetWeaponAnimationOverride(PlayerPedId(), GetHashKey(v[2]))
			end
		end

		WarMenu.End()
	end
end

RegisterCommand("gunstyle", WeaponStyle)
RegisterKeyMapping("gunstyle", "Select shooting style", "keyboard", "F5")