local ply = FindMetaTable("Player")

include("fbiwarn_config.lua")

function ply:SetWarns(amount)
    self:SetNWInt("Warnings", amount)
end

function ply:AddWarn()
    if (self:GetWarns() == FBIWarn.MaxWarns or self:GetWarns() == FBIWarn.MaxWarns *2) then 
        self:Kick("You've reached the warn limit!")
    end
    if (self:GetWarns() > 10) then
        self:ChatPrint("BANNED TO MANY WARNS")
        self:Ban(30, true)
    end
    self:SetNWInt("Warnings", self:GetNWInt("Warnings") + 1)
end

function ply:GetWarns()
    return tonumber(self:GetNWInt("Warnings"))
end