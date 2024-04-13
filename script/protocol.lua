Include("\\script\\lib\\objbuffer_head.lua")



ScriptProtocol = {}

ScriptProtocol.KE_SCRIPT_PROTOCOL = 
{
	"emSCRIPT_PROTOCOL_ECHO",
	"emSCRIPT_PROTOCOL_EQUIP_RANK",
	"emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM",
	"emSCRIPT_PROTOCOL_REQUESTTABLE",
	"emSCRIPT_PROTOCOL_BATTLE",
	"emSCRIPT_PROTOCOL_BINGO_MACHINE",
	"emSCRIPT_PROTOCAL_HuoYueDu_Award", --����Ծ�Ƚ���	
	"emSCRIPT_PROTOCOL_COUNT",
	"emSCRIPT_PROTOCOL_BINGO_OPENWINDOW",
	"emSCRIPT_PROTOCOL_BINGO_COIN",
	"emSCRIPT_PROTOCOL_BINGO_GET_AWARD_RESULT",
	"emSCRIPT_PROTOCOL_BINGO_GET_COIN",
	
	"emSCRIPT_PROTOCOL_OPEN_CREDITS_SHOP",
	"emSCRIPT_PROTOCOL_SIGNUP_AREAN",
	"emSCRIPT_PROTOCOL_QIANCHONGLOU",
	-- Begin custom protocol
	"emSCRIPT_PROTOCOL_LUCKY_TURNTABLE",
	-- End custom protocol
	"emSCRIPT_PROTOCOL_KICHCLIENT",
	--"emSCRIPT_PROTOCOL_VERIFY_CLIENT",
	--"emSCRIPT_PROTOCOL_AUTO_CHAT",
	--"emSCRIPT_PROTOCOL_CLIENT_IP",
}

function ScriptProtocol:_InitProtocolEnum()
	for key, v in self.KE_SCRIPT_PROTOCOL do
		self[v] = key
	end
end


function ScriptProtocol:RegProtocol(szProtocolEnum, szFile, szFun, tbParamFormat)
	self.tbProtocolDef = self.tbProtocolDef or {}
	
	
	local nProtocolId =  self[szProtocolEnum]
	
	if type(nProtocolId) ~= "number" then
		print("reg script protocol fail because it's nil"..szProtocolEnum)
		return
	end
	if self.tbProtocolDef[nProtocolId] then
		error("reg script protocol fail because reged "..(self.KE_SCRIPT_PROTOCOL[nProtocolId] or "nil"))
		return
	end
	
	self.tbProtocolDef[nProtocolId] = {szFile, szFun, tbParamFormat}
end

function ScriptProtocol:HandleProcess(nHandle, tbParamFormat)
	
	if type(tbParamFormat) ~= "table" then
		return {nHandle}
	end
	
	local tbParam = {}

	for i=1, getn(tbParamFormat) do
		local var = ObjBuffer:PopByType(nHandle, tbParamFormat[i])
		tinsert(tbParam, var)
	end
	
	return tbParam
end



function ScriptProtocol:ProtocolProcess(nProtolId, nHandle)	
	if type(nProtolId) == "number" and type(self.tbProtocolDef[nProtolId]) == "table" then
		
		local szFile = self.tbProtocolDef[nProtolId][1]
		local szFun = self.tbProtocolDef[nProtolId][2]
		local tbParamFormat = self.tbProtocolDef[nProtolId][3]
		local tbParam = self:HandleProcess(nHandle, tbParamFormat)
		
		if MODEL_GAMESERVER == 1 then
			DynamicExecuteByPlayer(PlayerIndex, szFile, szFun, unpack(tbParam))
		elseif MODEL_GAMECLIENT == 1 then
			if szFile ~= "" then
				Require(szFile);
			end
			DynamicExecute(szFile, szFun, unpack(tbParam))
		end
	end
end

function ScriptProtocol:RegProtocolSet(tbDefSet)
	for i=1, getn(tbDefSet) do 
		local tb = tbDefSet[i]
		if tb then
			self:RegProtocol(unpack(tb))
		end
	end
end




function ScriptProtocol:Echo(nHandle)
end

ScriptProtocol:_InitProtocolEnum()



if MODEL_GAMECLIENT == 1 then
	local Def = 
	{
		{
			"emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM",
			"\\script\\item\\dynamic_shop\\logic_c.lua",
			"DynamicShop:RecvItem",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER, OBJTYPE_TABLE}
		},
		{
			"emSCRIPT_PROTOCOL_BATTLE",
			"\\script\\missions\\battle\\protocol_c.lua",
			"show_battle_select",
			{OBJTYPE_TABLE}
		},
		{
			"emSCRIPT_PROTOCOL_BINGO_MACHINE",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:RecvResult",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
			 OBJTYPE_NUMBER, OBJTYPE_NUMBER},
			
		},
		{
			"emSCRIPT_PROTOCOL_BINGO_OPENWINDOW",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:OpenWindow",
			{ OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
				OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
				OBJTYPE_NUMBER, OBJTYPE_NUMBER },
		},		
		{
			"emSCRIPT_PROTOCOL_BINGO_COIN",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:RecvCoin",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},		
		{
			"emSCRIPT_PROTOCOL_BINGO_GET_AWARD_RESULT",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:GetAwardResult",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},
		{
			"emSCRIPT_PROTOCOL_QIANCHONGLOU",
			"\\script\\missions\\qianchonglou\\ui.lua",
			"process_protocol",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},
		-- Begin custom protocol
		{
			"emSCRIPT_PROTOCOL_LUCKY_TURNTABLE",
			"\\script\\event\\luckyturntable\\client.lua",
			"LuckyTurntable:ProtocolProcess",
			{OBJTYPE_NUMBER, OBJTYPE_TABLE},
		},
		-- End custom protocol
		--{
		--	"emSCRIPT_PROTOCOL_VERIFY_CLIENT",
		--	"\\script\\global\\_verify_client.lua",
		--	"VerifyClient:CallFunc",
		--	{OBJTYPE_STRING, OBJTYPE_STRING},		
		--},		
		--{
		--	"emSCRIPT_PROTOCOL_CLIENT_IP",
		--	"\\script\\global\\_client_ip.lua",
		--	"ClientIP:CallFunc",
		--	{OBJTYPE_STRING, OBJTYPE_STRING},		
		--},
	--{
		--	"emSCRIPT_PROTOCOL_AUTO_CHAT",
		--	"\\script\\global\\_player_auto_chat.lua",
		--	"PlayerAutoChat:CallFunc",
		--	{OBJTYPE_STRING, OBJTYPE_STRING},		
	--},
		
	}
	ScriptProtocol:RegProtocolSet(Def)
end

