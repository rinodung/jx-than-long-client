Include("\\script\\lib\\gb_modulefuncs.lua")
IncludeLib("LEAGUE")
MAX_TJL_USE_COUNT = 5
str_endmsg = "Thi�n C� L�nh b�n s� d�ng �� ��t gi�i h�n t�i �a l� "..MAX_TJL_USE_COUNT.." l�n, v� th� b� h�y b� kh�i h�nh trang!";

function main(nItem)
	local nUsedCount = GetItemParam(nItem, 1);
	if (GetSkillState(707) > 0) then
		Msg2Player("<color=yellow>B�n �ang s� d�ng Thi�n C� L�nh tr��c �� r�i. Xin h�y ��i h�t th�i gian hi�n t�i r�i s� d�ng sau.");
		Say("<color=yellow>B�n �ang s� d�ng Thi�n C� L�nh tr��c �� r�i. Xin h�y ��i h�t th�i gian hi�n t�i r�i s� d�ng sau.")
		return 1;
	else
		Msg2Player("<color=gold>B�n �� s� d�ng 1 Thi�n C� L�nh! Trong v�ng 1 gi�, b�n s� bi�t ���c tin t�c nh�t v�t ph�m qu� � khu v�c m�nh �ang ��ng.");
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
	--return "S� l�n s� d�ng c�n l�i: " ..(MAX_TJL_USE_COUNT - nUsedCount).." / "..MAX_TJL_USE_COUNT
end