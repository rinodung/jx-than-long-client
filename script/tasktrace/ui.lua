if MODEL_GAMECLIENT ~= 1 then
	return
end
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_c.lua")

TaskTrace = {}

function TaskTrace:OpenUI(nTaskID)
	local szInfo1 = ""
	local id1=0
	if nTaskID == 0 then
		szInfo1 = "HiÖn ch­a chän nhiÖm vô cÇn theo dâi."
	elseif nTaskID < 10 then
		id1 = nTaskID
		szInfo1 = self:GetTaskInfo(id1) 
		
	else 
		szInfo1 = "Ch­a xö lÝ ®­îc hai nhiÖm vô."
	end
	self:PushInfo(szInfo1, "", "", "", id1)
end

function TaskTrace:GetTaskInfo(nID) 
	local tbTaskName = {"D· TÈu", "TÝn Sø"}
	local szInfo = ""
	if tbTaskName[nID] then
		szInfo = format("<color=green>NhiÖm vô %s<color>", tbTaskName[nID])
	else
		szInfo = "HiÖn ch­a cã th«ng tin vÒ nhiÖm vô nµy."
	end
	if nID == 1 then
		szInfo = szInfo.."<enter>"..self:GetTaskDescription()--tu dinh nghia ham lay mo ta nhiem vu
	end
	return szInfo
end
function TaskTrace:GetTaskDescription()
	taskDescription = "M« t¶ nhiÖm vô 1 b­íc 1."
	return taskDescription
end
function TaskTrace:PushInfo(str1, str2, str3, str4, id1)
	OpenBattleSelect()
	local nCurRow = 2
	local nMaxRow = 3 -- chi can 1< nCurRow < nMaxRow de su dung duoc 2 nut Prev, Next
	SetBattleSelectPage(nCurRow, nMaxRow)
	SetBattleSelectInfo(0, str1, id1)
	SetBattleSelectInfo(1, str2)
	SetBattleSelectInfo(2, str3)
	SetBattleSelectInfo(3, str4)
end

function on_select(nId)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 1)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nId)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_TASKTRACE", nHandle)
	OB_Release(nHandle)
end

function prev_page(nCurRow, nMaxRow)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 2)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 1)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_TASKTRACE", nHandle)
	OB_Release(nHandle)
end

function next_page(nCurRow, nMaxRow)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 3)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_TASKTRACE", nHandle)
	OB_Release(nHandle)
end

function mouse_wheel(nRow)
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 4)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nRow)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_TASKTRACE", nHandle)
	OB_Release(nHandle)
end
