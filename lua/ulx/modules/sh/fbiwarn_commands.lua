CATEGORY_NAME = "Warn System"

function ulx.warn(calling_ply, target_ply, reason)
	if target_ply:IsListenServerHost() then
		ULib.tsayError(calling_ply, "This player is immune to warning", true)
		return
	end

	if reason and reason ~= "" then
		ulx.fancyLogAdmin(calling_ply, "#A warned #T (#s)", target_ply, reason)
	else
		reason = nil
		ulx.fancyLogAdmin(calling_ply, "#A warned #T", target_ply)
	end
	target_ply:AddWarn()
end
local warn = ulx.command(CATEGORY_NAME, "ulx warn", ulx.warn, "!warn")
warn:addParam{ type=ULib.cmds.PlayerArg }
warn:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine}
warn:defaultAccess(ULib.ACCESS_ADMIN)
warn:help("Warns the target.")

function ulx.resetwarns(calling_ply, target_ply)
	if target_ply:IsListenServerHost() then
		ULib.tsayError(calling_ply, "This player is immune to warning", true)
		return
	end

    target_ply:SetWarns(0)
    ulx.fancyLogAdmin(calling_ply, "#A reset #T warns", target_ply)
end

local resetwarns = ulx.command(CATEGORY_NAME, "ulx resetwarns", ulx.resetwarns, "!resetwarns")
resetwarns:addParam{ type=ULib.cmds.PlayerArg }
resetwarns:defaultAccess(ULib.ACCESS_ADMIN)
resetwarns:help("Resets the target's warns.")