Include("\\script\\lib\\gb_modulefuncs.lua")
IncludeLib("LEAGUE")
MAX_TJL_USE_COUNT = 5
str_endmsg = "Thiªn C¬ LÖnh b¹n sö dông ®· ®¹t giíi h¹n tèi ®a lµ "..MAX_TJL_USE_COUNT.." lÇn, v× thÕ bÞ hñy bá khái hµnh trang!";

function main(nItem)
	local nUsedCount = GetItemParam(nItem, 1);
	if (GetSkillState(707) > 0) then
		Msg2Player("<color=yellow>B¹n ®ang sö dông Thiªn C¬ LÖnh tr­íc ®ã råi. Xin h·y ®îi hÕt thêi gian hiÖn t¹i råi sö dông sau.");
		Say("<color=yellow>B¹n ®ang sö dông Thiªn C¬ LÖnh tr­íc ®ã råi. Xin h·y ®îi hÕt thêi gian hiÖn t¹i råi sö dông sau.")
		return 1;
	else
		Msg2Player("<color=gold>B¹n ®· sö dông 1 Thiªn C¬ LÖnh! Trong vßng 1 giê, b¹n sÏ biÕt ®­îc tin tøc nhÆt vËt phÈm quý ë khu vùc m×nh ®ang ®øng.");
		AddSkillState(707, 1, 1, 18*60*60);
		return 0
	end
	
	--nUsedCount = nUsedCount + 1
	--if (nUsedCount >= MAX_TJL_USE_COUNT) then
	--	Msg2Player(str_endmsg)
	--	return 0
	--else
	--	SetItemMagicLevel(nItem, 1, nUsedCount)
	--end
	--SyncItem(nItem)
	--return 1
end

function GetDesc(nItem)
	--local nUsedCount = GetItemParam(nItem, 1);
	--return "Sè lÇn sö dông cßn l¹i: " ..(MAX_TJL_USE_COUNT - nUsedCount).." / "..MAX_TJL_USE_COUNT
end