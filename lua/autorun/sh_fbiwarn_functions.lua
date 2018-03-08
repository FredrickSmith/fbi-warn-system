local ply = FindMetaTable("Player")

include("fbiwarn_config.lua")

function ply:SetWarns(amount)
    self:SetNWInt("Warnings", amount)
end

function ply:AddWarn()
    
    self:SetNWInt("Warnings", self:GetNWInt("Warnings") + 1) // Add warn before we check or we will have 1 less warning.
    
    hook.Call("PlayerWarnsUpdated", GAMEMODE, self)
    
    if (self:GetWarns() == FBIWarn.MaxWarns or self:GetWarns() == FBIWarn.MaxWarns *2) then 
        
        timer.Simple(0.1, function() if IsValid(self) then self:Kick("You've reached the warn limit!") end end)
        
    end

end

function ply:GetWarns()
    return tonumber(self:GetNWInt("Warnings"))
end
