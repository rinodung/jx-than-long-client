Include("\\script\\skill\\cuiyan.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)

	local nPlayerIndex = NpcIdx2PIdx(nLauncherNpcIndex)
	
	if nPlayerIndex <= 0 then
		return
	end	
	PlayerIndex = nPlayerIndex;
	--day la skill tuyet anh 109, neu co 713 remove 713
	if (GetSkillState(713) ~= -1 ) then		
		RemoveSkillState(713);
		local msg = format("Hi�u �ng Ng� Tuy�t �n c�n t�n t�i, s� d�ng tuy�t �nh v� hi�u ");
		Msg2Player(msg);
		return 0;
		
	end
	
end