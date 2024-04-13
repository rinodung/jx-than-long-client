if MODEL_GAMECLIENT ~= 1 then
	return
end

Include("\\script\\event\\luckyturntable\\head.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_c.lua")

function LuckyTurntable:SendDataToGS(nId, tbData)
	local handle = OB_Create()
	if tbData == nil then
		tbData = {}
	end
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, GetSelfName())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nId)
	ObjBuffer:PushByType(handle, OBJTYPE_TABLE, tbData)
	ScriptProtocol:SendData(self.Protocol, handle)
	OB_Release(handle)
end

function LuckyTurntable:ProtocolProcess(nId, tbParam)
	if nId == self.tbProtocol.PLAY then
		self:OnPlay(tbParam)
	elseif nId == self.tbProtocol.SYNC_AWARD then
		self:OnSyncAward(tbParam)
	elseif nId == self.tbProtocol.GET_AWARD then
		self:OnGetAward(tbParam)
	elseif nId == self.tbProtocol.OPEN_WINDOW then
		self:OpenWindow()
	end
end

function LuckyTurntable:InquiryAward()
	self:SendDataToGS(self.tbProtocol.INQUIRY_AWARD)
end

function LuckyTurntable:RequestPlay()
	self:SendDataToGS(self.tbProtocol.PLAY)
end

function LuckyTurntable:GetAward()
	self:SendDataToGS(self.tbProtocol.GET_AWARD)
end

function LuckyTurntable:OnPlay(tbParam)
	LuckyTurntable_Play(tbParam.nResult or 0)
end

function LuckyTurntable:OnGetAward(tbParam)
	LuckyTurntable_Award(tbParam.nResult or 0)
end

function LuckyTurntable:OnSyncAward(tbParam)
	LuckyTurntable_SyncAward(tbParam.nResult or 0)
end

function LuckyTurntable:OnClickTimesAwardButton(Id)
	self:SendDataToGS(self.tbProtocol.GET_TIMES_AWARD, {nId=Id})
end

function LuckyTurntable:GetTimesAwardState()
	local nTotalCount = GetTask(self.TASK_TOTAL_COUNT)
	for k, v in self.TimesAwardCount do
		local nGot = GetBitTask(self.TASK_TOTAL_AWARD, k, 1)
		if v <= nTotalCount and nGot ~= 1 then
			LuckyTurntable_SetButtonTimesAwardState(k, 1)
		else
			LuckyTurntable_SetButtonTimesAwardState(k, 0)
		end
	end
end

function LuckyTurntable:GetButtonNameAndTips(nId)
	local nCount = self.TimesAwardCount[nId]
	LuckyTurntable_SetButtonNameAndTips(nId, nCount, nCount)
end

function LuckyTurntable:GetTimesTips()
	local nTotalCount = GetTask(self.TASK_TOTAL_COUNT)
	LuckyTurntable_SetTimeTips(nTotalCount)
end

function LuckyTurntable:OpenWindow()
	LuckyTurntable_Open()
end
