local SaySapped = CreateFrame("Frame")
SaySapped.playername = UnitName("player")

SaySapped:SetScript("OnEvent", function()
	local _,event, _,_,sourceName, _,_,_,destName, _,_,spellId = CombatLogGetCurrentEventInfo()

	if ((spellId == 6770 or spellId == 2070 or spellId == 11297 or spellId == 51724)
	and (destName == SaySapped.playername)
	and (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH"))
	then
		SendChatMessage("Sapped","SAY")
		DEFAULT_CHAT_FRAME:AddMessage("Sapped by: "..(sourceName or "(unknown)"))
	end
end)

SaySapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
DEFAULT_CHAT_FRAME:AddMessage("SaySapped loaded")
