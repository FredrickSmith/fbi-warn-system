include("fbiwarn_config.lua")
    
if CLIENT then 
    function WarnMenu()
        local f = vgui.Create( "DFrame" )
        f:SetSize(ScrW()*0.277,ScrH()*0.138)
        f:SetTitle("Nocool's Warn Menu")
        f:SetVisible(true)
        f:SetDraggable(true)
        f:ShowCloseButton(true)
        f:Center()
        f:MakePopup()
    
        local WarnList = vgui.Create( "DListView", f )
        WarnList:Dock( FILL )
        WarnList:SetMultiSelect( false )
        WarnList:AddColumn( "Player" )
        WarnList:AddColumn( "Warns" )

    
        for k,v in pairs(player.GetAll()) do
            WarnList:AddLine(v:Nick(), v:GetWarns())
        end
    
        WarnList.OnRowSelected = function( lst, index, pnl )
	        print( "Selected " .. pnl:GetColumnText( 1 ) .. " ( " .. pnl:GetColumnText( 2 ) .. " ) at index " .. index )
	        local playerName = pnl:GetColumnText(1)
        end
end
hook.Add( "OnPlayerChat", "NocoolWarns", function(ply, text) if (string.lower(text) == "!warns" ) then if CLIENT and table.HasValue(AccessToMenu, ply:GetNWString("usergroup")) then WarnMenu() end end end) 
end
