-------------------------------------------------------------------------
-- FileName		:	cuiyan.lua - Th�y Y�n
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/cuiyan.lua
-------------------------------------------------------------------------
Include("\\script\\skill\\cuiyan.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)

	local nPlayerIndex = NpcIdx2PIdx(nLauncherNpcIndex)
	
	if nPlayerIndex <= 0 then
		return
	end	
	PlayerIndex = nPlayerIndex;
	-- day la skill ngu tuyet an 713, neu co 109, remove 109
	if (GetSkillState(109) ~= -1 ) then
		--RemoveSkillState(713);
		--RemoveSkillState(109);
		--local msg = format("Hi�u �ng Tuy�t �nh c�n t�n t�i, s� d�ng Ng� Tuy�t �n v� hi�u ");
		--Msg2Player(msg);
		--KickOutSelf();
		--return 0;
	else
		
	end
	
end