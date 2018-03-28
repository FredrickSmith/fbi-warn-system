local function InitializePlayerData(ply)
	
	-- Check if the PData doesn't exist
		
	if (ply:GetPData("Warnings") == nil) then
			
        -- Create the PData and NWInt
			
		ply:SetPData("Warnings", 0)
		ply:SetNWInt("Warnings", 0)
			
	-- Else, if it does exist..
				
	else
				
		-- Just create the NWInt
				
        ply:SetNWInt("Warnings", ply:GetPData("Warnings"))
	end
end
hook.Add("PlayerInitialSpawn", "InitializePlayerData", InitializePlayerData)

local function SaveDisconnectedPlayerData(ply)
			
	-- Update the player's warn PData
		
	if not IsValid(ply) then return end // Something went wrong
	
    ply:SetPData("Warnings", ply:GetNWInt("Warnings"))
end
hook.Add("PlayerDisconnected", "WARN:SaveDisconnectedPlayerData", SaveDisconnectedPlayerData)
hook.Add("PlayerWarnsUpdated", "WARN:SaveWarnsOnUpdated", SaveDisconnectedPlayerData)
	
local function SaveAllPlayerData(ply)
			
	-- Loop through every player
			
	for k, v in pairs(player.GetAll()) do
				
		-- Update their warnings
				
 		v:SetPData("Warnings", v:GetNWInt("Warnings"))
	end
end
		
hook.Add("ShutDown", "WARN:SaveAllPlayerData", SaveAllPlayerData)
