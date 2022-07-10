CreateThread(function()
	
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	while ESX == nil do Wait(0) end

	while not ESX.IsPlayerLoaded() do Wait(5) end
	TriggerServerEvent("pAnnonceJob:Commandes")

end)