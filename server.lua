TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

-- Annonce jobs

RegisterServerEvent("pAnnonceJob:Commandes")
AddEventHandler("pAnnonceJob:Commandes", function()
	for k, v in pairs(Commades) do
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		local xPlayers = ESX.GetPlayers()

		if v.JobActif == true then
			RegisterCommand(v.Commandes, function(source, args)
				local JobDuJoueur = xPlayer.getJob().name

				if JobDuJoueur == v.JobNom then
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						TriggerClientEvent("esx:showAdvancedNotification", xPlayers[i], v.TitreAnnonce, v.SousTitreAnnonce, table.concat(args, " "), v.Image, v.ImageBis)
					end
				else
					TriggerClientEvent("esx:showNotification", xPlayer.source, "~r~Vous n'avez pas le job requis.")
				end
			end)
		else
			RegisterCommand(v.Commandes, function(source, args)
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					TriggerClientEvent("esx:showAdvancedNotification", xPlayers[i], v.TitreAnnonce, v.SousTitreAnnonce, table.concat(args, " "), v.Image, v.ImageBis)
				end
			end)
		end
	end
end)