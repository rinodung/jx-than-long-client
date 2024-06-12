-------------------------------------------------------------------------
-- FileName		:	cuiyan.lua - Thóy Yªn
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
	if (GetSkillState(713) ~= -1 ) then		
		--RemoveSkillState(713);
		--RemoveSkillState(109);
		--local msg = format("HiÖu øng Ngù TuyÕt Èn cßn tån t¹i, sö dông tuyÖt ¶nh v« hiÖu ");
		--Msg2Player(msg);
		--KickOutSelf();
		--return 0;
	else
		--local msg = format("HiÖu øng Ngù TuyÕt Èn cßn tån t¹i, sö dông tuyÖt ¶nh v« hiÖu " .. GetSkillState(713));
		--Msg2Player(msg);	
	end
	
end