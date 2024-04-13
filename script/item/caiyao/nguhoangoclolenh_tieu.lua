--�������
Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	-- 1 tuan
	["6,1,4985"] = {szName="H�i thi�n t�i t�o ��n", tbProp={1, 8, 0, 4, 0, 0}, nBindState=-2},
}

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount >= 1200 then
		Say("�� r�t h�t to�n b� thu�c trong �� r�i, c� th� v�t �i.", 0)
		return 0
	end
	SetTaskTemp(115, nItemIndex)
	AskClientForNumber("huitianjinlang_getpotion", 0,(1200-nCount), "Xin m�i nh�p s� c�n r�t")
	
	return 1
end
function huitianjinlang_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount then
		nPickCount = nFreeItemCellCount
	end
	local nItemIndex = GetTaskTemp(115)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --�ǲ����������
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		local nLastCount = 1200 - nCount;
		if nPickCount > nLastCount then
			nPickCount = nLastCount
		end
		
		
		%tbItem[szItemId].nCount = nPickCount
		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "Ng� hoa ngoc lo lenh (Ti�u)") == 1 then
			nCount = nCount + nPickCount
			if nCount >= 1200 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
			end
		end
	else
		print("V�t ph�m kh�ng � tr�n ng��i")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("C�n d�:  <color=yellow>%d<color>",(1200 - nCount))
end