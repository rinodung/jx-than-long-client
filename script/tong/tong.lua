function DefFun1(n1)
	return 1
end
function DefFun2(n1, n2)
	return 1
end
if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\workshop\\workshop_setting.lua")
Include("\\script\\tong\\log.lua")
if MODEL_RELAY == 1 then
	Include("\\script\\gb_taskfuncs.lua")
else
	Include("\\script\\tong\\map\\map_management.lua")
end

--帮会初始化
function INIT_R(nTongID)
	if (nTongID == 0 or TONG_GetDay(nTongID) ~= 0)then
		return 0
	end
	return MAINTAIN_R(nTongID)
end
INIT_G_1 = DefFun1
INIT_G_2 = DefFun1

function ADD_R(nTongID, nMasterID)
	-- 帮会历史/事件记录、通知
	local szRecord = "T筼 bang h閕";
	local szRecordPlus;
	local szMasterName = TONGM_GetName(nTongID, nMasterID);
	if (szMasterName ~= "") then
		szRecordPlus = szMasterName.." "..szRecord;
	else
		szMasterName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	
	cTongLog:WriteInfTB("TONG", "build", nTongID, {master = szMasterName})
		
	return INIT_R(nTongID)
end
ADD_G_1 = DefFun2
ADD_G_2 = DefFun2

function REMOVE_R(nTongID)
	local tbMsg = {
		membercount	= TONG_GetMemberCount(nTongID),
		retirecount	= TONG_GetMemberCount(nTongID, 4),
		day			= TONG_GetDay(nTongID),
		buildfund	= TONG_GetBuildFund(nTongID),
		warbuildfund= TONG_GetWarBuildFund(nTongID),
	}
	cTongLog:WriteInfTB("TONG", "dismiss", nTongID, tbMsg)
	return 1
end
REMOVE_G_1 = DefFun1
REMOVE_G_2 = DefFun1

aszTongLogXPFileHead = {	
	"Ng祔","S� tu莕","Bang h閕","Ъng c蕄 ki課 thi誸","Ng﹏ s竎h ki課 thi誸","Ng﹏ s竎h chi課 b�","N筽 甶觤 c鑞g hi課","S� ngi",
	"S� ngi tho竔 萵","Ng﹏ s竎h ki課 thi誸 h祅g tu莕","Ng﹏ s竎h ki課 thi誸 ti猽 hao","Ng﹏ s竎h chi課 b� h祅g tu莕","Ng﹏ s竎h chi課 b� ti猽 hao","Ng﹏ qu� th祅h ki課 thi誸","G鉷 ti襫 th祅h ki課 thi誸","Ki課 thi誸 th祅h chi課 b�",
	"T竎 phng s秐 xu蕋","T鎛g s� T竎 Phng","Khu Binh gi竝 ","Khu Thi猲 C玭g ","Khu M苩 n� ","Th� luy謓 phng","Khu Thi猲 � ","Khu L� v藅 ",
	"Khu ho箃 ng ","C蕄 T竎 Phng cao nh蕋","ч kh� m鬰 ti猽 tu莕","Ho祅 th祅h m鬰 ti猽 tu莕","H� th鑞g m鬰 ti猽 tu莕",
}
TongLogXPRecords = 0
function WriteXPLog(nTongID)
	if not tongLogFile then
		--文件不存在
		if not openfile("Logs/tong/tonglog_xp.log", "r")then
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
			if (tongLogFile == nil)then
				return
			end
			local size = getn(aszTongLogXPFileHead);
			for i=1,size-1 do
				write(tongLogFile,aszTongLogXPFileHead[i],'\t')
			end
			write(tongLogFile,aszTongLogXPFileHead[size],'\n')
		else
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
		end
	end	
	local aszData = GetTongLogData(nTongID)
	if (not tongLogFile or not aszData)then
		print("errererer\n")
		return	
	end
	write(tongLogFile,date("%Y-%m-%d %H:%M:%S"),'\t')
	local size = getn(aszData);
	for i=1,size-1 do
		write(tongLogFile,aszData[i],'\t')
	end
	write(tongLogFile,aszData[size],'\n')
	TongLogXPRecords = TongLogXPRecords + 1
	if TongLogXPRecords > 20 then
		TongLogXPRecords = 0
		flush(tongLogFile)
	end
end

function WEEKLY_MAINTAIN_R(nTongID)
	WriteXPLog(nTongID)	--记一周的Log
	
	--清除Log任务变量
	for i = TONGTSK_WEEK_BFADD,TONGTSK_BF2WF do
		TONG_ApplySetTaskValue(nTongID, i, 0)
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_HEROLING, 0);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_USEHEROLING, 0);
	
	--计算周目标奖励
	local nWeekGoalEvent = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalLevel = TONG_GetWeekGoalLevel(nTongID)
	local nWeekGoalValue = TONG_GetWeekGoalValue(nTongID)
	local nWeekGoalTotal = TONG_GetWeekGoalTotal(nTongID)
	local nWeekGoalPlayer = TONG_GetWeekGoalPlayer(nTongID)
	local nWeekGoalPriceTong = TONG_GetWeekGoalPriceTong(nTongID)
	local nWeekGoalPricePlayer = TONG_GetWeekGoalPricePlayer(nTongID)
	--周目标内容移到上周
	TONG_ApplySetLWeekGoalEvent(nTongID, nWeekGoalEvent)
	TONG_ApplySetLWeekGoalLevel(nTongID, nWeekGoalLevel)
	TONG_ApplySetLWeekGoalValue(nTongID, nWeekGoalValue)
	TONG_ApplySetLWeekGoalTotal(nTongID, nWeekGoalTotal)
	TONG_ApplySetLWeekGoalPlayer(nTongID, nWeekGoalPlayer)
	TONG_ApplySetLWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	TONG_ApplySetLWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
	--判断帮会周目标是否完成
	if (nWeekGoalTotal > 0 and nWeekGoalValue >= nWeekGoalTotal) then		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 1)
		TONG_ApplyAddEventRecord(nTongID, "M鬰 ti猽 bang h閕 tu莕 trc  ho祅 th祅h, bang ch� ho芻 trng l穙 c� th萴 quy襫 c� th� n T� Уn c馻 bang  nh薾 thng");	-- 帮会事件记录
		Msg2Tong(nTongID, "M鬰 ti猽 bang h閕 tu莕 n祔  ho祅 th祅h, bang ch� ho芻 trng l穙 c� th萴 quy襫 c� th� n T� Уn c馻 bang  nh薾 thng, bang ch髇g n祇 ho祅 th祅h m鬰 ti猽 tu莕 c� nh﹏ c騨g c� th� n T� Уn  nh薾 ph莕 thng c� nh﹏. Th阨 h筺 l� 1 tu莕!")
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 0)
	end		
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nBuildLevel = TONG_GetBuildLevel(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, nBuildLevel)
	--如果周累积建设基金未到上限
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--差多少到上限
		local nDec = nWeekBuildUpper - nTongWeekBuildFund
		--有多少储备
		local nStored = TONG_GetStoredBuildFund(nTongID)
		if (nStored < nDec) then
			nDec = nStored
		end
		if (TONG_ApplyAddStoredBuildFund(nTongID, -nDec) == 1) then
			TONG_ApplyAddBuildFund(nTongID, nDec)
			local szMsg = "Ng﹏ s竎h ki課 thi誸 nh薾 頲 trong tu莕 n祔 ch璦 t gi韎 h筺, ng﹏ s竎h ki課 thi誸 d� tr� chuy觧"..nDec.." v筺 v祇 ng﹏ s竎h ki誸 thi誸"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end
	TONG_ApplySetWeekBuildFund(nTongID, 0) --周累积建设基金清0
	TONG_ApplySetWeekGoalValue(nTongID, 0)	--周目标累积贡献度清0
	TONG_ApplyAddWeek(nTongID, 1)			--帮会周数加1
	
	local nMembers = TONG_GetMemberCount(nTongID, -1)		
	cTongLog:WriteInfTB("TONG", "weeklymaintain", nTongID,
						{
						week = TONG_GetWeek(nTongID),
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = nBuildLevel,
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						weekbuildfund = nTongWeekBuildFund,
--						weekgoalevent = nWeekGoalEvent,
						weekgoalvalue = nWeekGoalValue,
						weekgoaltotal = nWeekGoalTotal,
						}	)
	
			--特技新一周期 初始化
	if (nBuildLevel >= 4) then
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		-- 关闭灵参力
		if (nStuntID == 6) then
			nStuntID = 0
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		end
	
		if (nStuntID ~= 0) then
			local nNextStunt = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
			if (nNextStunt ~= 0 and nNextStunt ~= nStuntID) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nNextStunt)
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, 0)
				nStuntID = nNextStunt
				local szMsg = "K� n╪g bang h閕 chuy觧 th祅h"..TB_STUNTID_INFO[nStuntID].name
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)	-- 帮会事件记录
			end
			--应该在周期维护时
			Maintain_Stunt(nTongID, nStuntID)	--以战备基金维护特技
			if (nBuildLevel == 5) then
				local nCitySTID = tong_GetCityStuntID(nTongID)
				if (nCitySTID ~= 0 and TB_STUNTID_INFO[nCitySTID].right == 1) then
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
				else
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, 0)
				end
			end
		end
	end
	
	--设定帮会周目标
	if nMembers < MIN_WEEKGOAL_MEMBER then
		local szMsg = "Nh﹏ s� 輙 h琻 "..MIN_WEEKGOAL_MEMBER.." ngi, m鬰 ti猽 tu莕 kh玭g th� b総 u!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg);
--		TONG_ApplySetWeekGoalEvent(nTongID, 0)
--		TONG_ApplySetWeekGoalLevel(nTongID, 0)
--		TONG_ApplySetWeekGoalPlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalTotal(nTongID, 0)
--		TONG_ApplySetWeekGoalPricePlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalPriceTong(nTongID, 0)
	else
		local nType = random(getn(TB_WEEKGOAL_TYPE_ID))
		local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
		if (nLevel <= 0) then nLevel = 1 end --开始时周目标难度默认为1
		if (nLevel > 2) then
			nLevel = 2
			TONG_ApplySetCurWeekGoalLevel(nTongID, 2)
		end
		local nHourValue = random(150, 170)
		nWeekGoalPlayer = TB_WEEKGOAL_CHANGE[nLevel] * nHourValue --确定玩家周目标贡献度
		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer) --确定帮会周目标贡献度
		nWeekGoalPricePlayer = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue) --确定玩家周目标奖励
		nWeekGoalPriceTong = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue * 0.4 * nMembers) --确定帮会周目标奖励
--		nWeekGoalPlayer = WEEKGOAL_VALUE_PERSON;
--		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer); --确定帮会周目标贡献度
--		nWeekGoalPricePlayer = WEEKGOAL_PRICE_PERSON;
--		nWeekGoalPriceTong = WEEKGOAL_PRICE_TONG;
--		TONG_ApplySetWeekGoalEvent(nTongID, TB_WEEKGOAL_TYPE_ID[nType])
		TONG_ApplySetWeekGoalEvent(nTongID, nType)
		TONG_ApplySetWeekGoalLevel(nTongID, nLevel)
		TONG_ApplySetWeekGoalPlayer(nTongID, nWeekGoalPlayer)
		TONG_ApplySetWeekGoalTotal(nTongID, nWeekGoalTotal)
		TONG_ApplySetWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
		TONG_ApplySetWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	
		TONG_ApplyAddEventRecord(nTongID, "M鬰 ti猽 tu莕 n祔: "..TB_WEEKGOAL_TYPE_NAME[nType]);	-- 帮会事件记录
		Msg2Tong(nTongID, "M鬰 ti猽 trong tu莕 c馻 bang: <color=green>"..TB_WEEKGOAL_TYPE_NAME[nType])
	end
	return 1
end

function Maintain_Stunt(nTongID, nStuntID)
	if (nStuntID == 0) then
		return
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 0)
	--TONGTSK_MONEYBOX_DROPMAX
	if (TB_STUNTID_INFO[nStuntID].right == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, 0)
	end
	local nStuntState = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	if (TB_STUNT_PAUSESTATE[nStuntState][4] == 3 or TB_STUNT_PAUSESTATE[nStuntState][4] == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (nCurFund < TB_STUNTID_INFO[nStuntID].consume) then
			local szMsg = "Ng﹏ s竎h chi課 b� kh玭g   b秓 tr� Bang h閕 c k�. Tu莕 n祔 t筸 ng ch鴆 n╪g c k�!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 0)
		else
			TONG_ApplyAddWarBuildFund(nTongID, -TB_STUNTID_INFO[nStuntID].consume)
			if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
				local szMsg = "Ng﹏ s竎h chi課 b�   b� v祇 chi ph� b秓 tr�, bang h閕 c k� s� ti誴 t鬰 ho箃 ng!"
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)
			else
				if (nStuntState == TB_STUNT_PAUSESTATE[nStuntState][4]) then
					Msg2Tong(nTongID, "Bang h閕 c k� ti誴 t鬰 b秓 tr�"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr筺g th竔 ")
					TONG_ApplyAddEventRecord(nTongID, "Bang h閕 c k� ti誴 t鬰 b秓 tr�"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr筺g th竔 ")
				else
					Msg2Tong(nTongID, "B秓 tr� bang h閕 c k�"..TB_STUNT_PAUSESTATE[nStuntState][2])
					TONG_ApplyAddEventRecord(nTongID, "B秓 tr� bang h閕 c k�"..TB_STUNT_PAUSESTATE[nStuntState][2])
				end
			end
		end
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
	end
end

WEEKLY_MAINTAIN_G_1 = DefFun1
--WEEKLY_MAINTAIN_G_2 = DefFun1

function WEEKLY_MAINTAIN_G_2(nTongID)
	--每周维护时清除图腾NPC头顶效果，重新AddSkill，以保证在切换特技后图腾的效果亦切换
	local nMapID = TONG_GetTongMap(nTongID)
	local nMapIdx = SubWorldID2Idx(nMapID)
	if (nMapIdx < 0) then
		return 1
	end
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nStuntID > 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function MAINTAIN_R(nTongID)
	local nDay = TONG_GetDay(nTongID)
	local nWeek = TONG_GetWeek(nTongID)
	local nexweek = nil
	if (nDay == 0 or tonumber(date("%w")) == 1 or 
		nDay >= TONG_GetTaskValue(nTongID, TONGTSK_LAST_WM_DAY) + 7) then
		nexweek = 1
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_WM_DAY, nDay)
	end
	Msg2Tong(nTongID, "Bang h閕 bc v祇 ng祔 th� <color=white>"..(nDay+1).."<color>, ng﹏ s竎h ki課 thi誸 trc m総: <color=gold>"..
		TONG_GetBuildFund(nTongID).."<color> v筺, ng﹏ s竎h chi課 b�: <color=gold>"..TONG_GetWarBuildFund(nTongID)..
		"<color> v筺")
	cTongLog:WriteInfTB("TONG", "maintain", nTongID,
						{
						day = nDay,
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = TONG_GetBuildLevel(nTongID),
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						}	)
	--帮会0级时不消耗
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel > 0)then
		--作坊维护
		local nWS = TWS_GetFirstWorkshop(nTongID)
		while (nWS ~= 0)do
			if (nexweek)then --每周清空产出
				TWS_ApplySetDayOutput(nTongID, nWS, 0)			
				local nUseLevelSet = TWS_GetUseLevelSet(nTongID, nWS)
				local nCurUseLevel = TWS_GetUseLevel(nTongID, nWS)
				if nUseLevelSet > 0 and nUseLevelSet ~= nCurUseLevel and nUseLevelSet <= TWS_GetLevel(nTongID, nWS) 
					and nUseLevelSet <= tongGetWorkshopUpperLevel(nTongID, nTongLevel) then
					TWS_ApplySetUseLevel(nTongID, nWS, nUseLevelSet)
					local nType = TWS_GetType(nTongID, nWS)
					Msg2Tong(nTongID, "<color=green>"..wsGetName(nType).."<color>Ъng c蕄 s� d鬾g 甶襲 ch豱h th祅h c蕄<color=blue>"..nUseLevelSet..
						"<color>")
				end
			end
			TWS_ApplyMaintain(nTongID, nWS)
			nWS = TWS_GetNextWorkshop(nTongID, nWS)
		end
		--判断暂停状态
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 0)then
			if (nCurFund >= TONG_GetStandFund(nTongID))then
				TONG_ApplySetPauseState(nTongID, 0)
				TONG_ApplyAddEventRecord(nTongID, "Ng﹏ s竎h chi課 b�  t y猽 c莡 ng﹏ s竎h chi課 b� b秓 tr� h祅g tu莕, tr筺g th竔 t筸 ng鮪g c馻 bang h閕 頲 x鉧 b�!");	-- 帮会事件记录
				Msg2Tong(nTongID, "Ng﹏ s竎h chi課 b�  t y猽 c莡 ng﹏ s竎h chi課 b� b秓 tr� h祅g tu莕, tr筺g th竔 t筸 ng鮪g c馻 bang h閕 頲 x鉧 b�!")
				cTongLog:WriteInfTB("TONG", "unpause", nTongID, {})
			end
		elseif (nCurFund < TONG_GetStandFund(nTongID)) then
			TONG_ApplySetPauseState(nTongID, 1)
			TONG_ApplyAddEventRecord(nTongID, "T竎 phng c馻 bang b� t筸 d鮪g do ng﹏ s竎h chi課 b� kh玭g  chi ph� b秓 tr� h祅g tu莕");	-- 帮会事件记录
			Msg2Tong(nTongID, "Ng﹏ s竎h chi課 b� th蕄 h琻 ng﹏ s竎h chi課 b� b秓 tr� h祅g tu莕, tr筺g th竔 c馻 bang h閕 l� <color=red>T筸 d鮪g!")
			cTongLog:WriteInfTB("TONG", "pause", nTongID, {})
		end	
		
		local nConsume = TONG_GetMaintainFund(nTongID)
		TONG_ApplyAddWarBuildFund(nTongID, -nConsume)		
		TONG_ApplyAddEventRecord(nTongID, "B秓 tr� bang h閕 ng祔 h玬 nay, ti猽 hao"..nConsume.." v筺 ng﹏ s竎h chi課 b�");	-- 帮会事件记录
		Msg2Tong(nTongID, "B秓 tr� bang h閕 ng祔 h玬 nay, ti猽 hao ng﹏ s竎h chi課 b� bang h閕: <color=gold>"..nConsume.."<color> v筺")
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFCONSUME, nConsume)
		nConsume = wsGetAllDayConsume(nTongID)
		nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
		Msg2Tong(nTongID, "Ng﹏ s竎h chi課 b� b秓 tr� h祅g ng祔 c馻 bang hi謓 t筰 l�:  <color=gold>"..nConsume.." v筺")
		Msg2Tong(nTongID, "Ng﹏ s竎h chi課 b� b秓 tr� h祅g tu莕 c馻 bang h閕 hi謓 t筰 l�: <color=gold>"..(nConsume * 7).." v筺")
		local nWarBuildFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 1 and nWarBuildFund < nConsume * 7)then
			local szMsg = "Ng﹏ s竎h chi課 b� th蕄 h琻 ng﹏ s竎h chi課 b� b秓 tr� h祅g tu莕, trc l莕 b秓 tr� sau s� kh玭g c� thay i, t竎 phng bang h閕 b� t筸 d鮪g!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)-- 帮会事件记录
		end
		TONG_ApplySetMaintainFund(nTongID, nConsume)
		local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
		TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
		--战备基金为0时判断降级
--		if (nWarBuildFund == 0)then
--		local nLastDegradeDay = TONG_GetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY)
--			if (nDay - nLastDegradeDay > 7)then
--				if TONG_ApplyDegrade(nTongID) == 1 then
--					TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY, nDay)
--					local szMsg = "帮会战备基金已降至0，建设等级下降一级！并且在一周内帮会不会再降级。"
--					Msg2Tong(nTongID, szMsg)
--					TONG_ApplyAddEventRecord(nTongID, szMsg)	-- 帮会事件记录
--				end	
--			end	
--		end
	else	--建设等级为0
		if (TONG_GetMaintainFund(nTongID) > 0) then
			TONG_ApplySetMaintainFund(nTongID, 0)
		end	
		if (TONG_GetPerStandFund(nTongID) > 0) then
			TONG_ApplySetPerStandFund(nTongID, 0)
		end	
	end
	

	-- 帮主自荐维护
	Master_SelfCommend_Maintain(nTongID);
	
	--每7天进行周维护
	--当某次的周维护由于异常没有正常进行，第二天会继续触发周维护
	if (nexweek) then
		TONG_ApplyWeeklyMaintain(nTongID)
		Msg2Tong(nTongID, "Ki課 thi誸 bang bc sang tu莕 th� <color=white>"..(nWeek+1).."<color>.")
	end
	
	--特技维护
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nenabled = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED)
	local ndifday = tonumber(date("%w"))
	local nCitySTID = tong_GetCityStuntID(nTongID)
	
	-- 关闭灵参力
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
		
	--若特技为领导层领取，则TB_STUNTID_INFO[nStuntID].memper是为0的
	if (nCitySTID ~= 0 and (ndifday >= 1 and ndifday <= 4)) then
		if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) + TB_STUNTID_INFO[nCitySTID].memper <= TB_STUNTID_INFO[nCitySTID].maxmem) then
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
		end
	end
	if (nTongLevel >= 4) then
		if (nStuntID ~= 0 and nenabled ~= 0) then 
			--周期1、2、3、4天分批次给与特技
			if (ndifday <= 4 and ndifday >= 1) then
				if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) + TB_STUNTID_INFO[nStuntID].memper <= TB_STUNTID_INFO[nStuntID].maxmem) then
					TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].memper)
				end
			end
		end
	end
	TONG_ApplyAddDay(nTongID, 1)
	return 1
end
MAINTAIN_G_1 = DefFun1
MAINTAIN_G_2 = DefFun1



function logicTongLevelUp(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel >= 5)then
		return 5
	end	
	local nWsCount = TWS_GetWorkshopCount(nTongID)
	local nWsDemand = tongGetUpgradeWorkshopDemand(nTongID, nCurLevel)
	if (nWsCount < nWsDemand)then
		return 1, nWsDemand
	end
	local nLevelHi = tongGetUpgradeHighWorkshopsLevel(nTongID, nCurLevel)
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nHiNum = 0
	while (nWorkshop > 0) do
		if (TWS_GetLevel(nTongID, nWorkshop) >= nLevelHi)then
			nHiNum = nHiNum + 1
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	local nHighDemand = tongGetUpgradeHighWorkshopsDemand(nTongID, nCurLevel)
	if (nHiNum < nHighDemand)then
		return 2, nHighDemand, nLevelHi
	end
	local nBFund = TONG_GetBuildFund(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (nBFund < nCost)then
		return 3, nCost
	end
	local nLastUpgradeDay = TONG_GetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY)
	if (nLastUpgradeDay  > TONG_GetDay(nTongID))then
		return 4, nLastUpgradeDay
	end
	if (nCurLevel == 2)then
			if (nLastUpgradeDay  > TONG_GetDay(nTongID))then
		return 6, nLastUpgradeDay
			
		end
	elseif (nCurLevel == 4)then
		local nCityDay = TONG_GetOccupyCityDay(nTongID)
		if (nLastUpgradeDay  > TONG_GetDay(nTongID))then
		return 7, nLastUpgradeDay
		end
	end	
	return 0
end

function UPGRADE_R(nTongID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (logicTongLevelUp(nTongID) ~= 0)then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng bang h閕")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end

		return 0
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1)then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	TONG_ApplySetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY, TONG_GetDay(nTongID))

	-- 帮会历史/事件记录、通知
	local szRecord = "Ъng c蕄 ki課 thi誸 bang h閕 t╪g l猲 "..(nCurLevel + 1).."c蕄";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." l祄 cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- 帮会事件记录
	Msg2Tong(nTongID, szRecordPlus);
	cTongLog:WriteInfTB("TONG", "upgrade", nTongID, {buildlevel = (nCurLevel + 1), day = TONG_GetDay(nTongID)})
	--0级升到一级时提示
	if (nCurLevel == 0)then
		local szMsg = "Ъng c蕄 ki課 thi誸 c馻 bang h閕 th╪g l猲 c蕄 1, ch鴆 n╪g T� Уn ph﹏ ph竧 甶觤 c鑞g hi課 頲 m� ra.";
		Msg2Tong(nTongID, szMsg);
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	end
	if (nCurLevel == 4) then
		local nCitySTID = tong_GetCityStuntID(nTongID)
		local nday = getRelativeDay(nTongID)
		OutputMsg("UPGRade,"..nCitySTID..","..nday)
		if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) < TONG_GetWeek(nTongID)) then
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		end
		if (nCitySTID ~= 0) then
			if (TB_STUNTID_INFO[nCitySTID].right == 2) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
			else
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
			end
		end
	end
	--升级帮会名次记录
	local nNowLevel = nCurLevel + 1;
	if (nNowLevel == 2 or nNowLevel == 4) then
		local nOrder = gb_GetTask("TONG_LVL_UP_ORDER", nNowLevel) + 1
		gb_SetTask("TONG_LVL_UP_ORDER", nNowLevel, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_ORDER, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, -1)	
	end;
	return 1
end

function UPGRADE_G_1(nTongID)
	local nRet, rt_1, rt_2 = logicTongLevelUp(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
		Msg2Player("в n﹏g l猲 c蕄 k� ti誴 c莕 ph秈 x﹜ d鵱g <color=yellow> "..rt_1.."<color> T竎 Phng")
	elseif (nRet == 2)then
		Msg2Player("Ъng c蕄 ki課 th誸 n﹏g l猲 c蕄 ti誴 theo c莕 T竎 Phng c� <color=yellow>"..rt_1.."<color> t <color=green>"..rt_2.."<color>")
	elseif (nRet == 3)then
		Msg2Player("Ъng c蕄 ki課 thi誸 n﹏g l猲 c蕄 ti誴 theo c莕 ng﹏ s竎h ki課 thi誸<color=gold>: "..rt_1.." v筺")
	elseif (nRet == 4)then
		Msg2Player("N﹏g c蕄 ng c蕄 ki課 thi誸 c莕 ph秈 c竎h nhau 1 tu莕!")
	elseif (nRet == 5)then
		Msg2Player("Ъng c蕄 ki課 thi誸  t n c蕄 cao nh蕋!")
	elseif (nRet == 6)then
		Msg2Player("Ъng c蕄 ki課 thi誸 t c蕄 3 c莕 ph秈 c� khu v鵦 bang h閕 ri猲g!")		
	elseif (nRet == 7)then
		Msg2Player("Ъng c蕄 ki課 thi誸 t c蕄 5 c莕 chi誱 l躰h 1 th祅h th�!")				
	end	
	return 0	
end
--UPGRADE_G_2 = DefFun1
--//////////////////
--升级后建设等级达到4、5级，帮会拥有图腾之柱
--//////////////////
function UPGRADE_G_2(nTongID)
--此时获得的建设等级？升级前？升级后？此处暂以升级后处理
	local nCurLevel = TONG_GetBuildLevel(nTongID) + 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nCurLevel < 4) then
		return 0
	else
		if (nMapIndex < 0) then
			return 0
		end
		if (nCurLevel == 4) then
			ClearMapNpcWithName(nMap, "C閠 bi觰 tng bang h閕");	--删除某个地图ID上的，某个名字的NPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng bang h閕")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			ClearMapNpcWithName(nMap, "C閠 bi觰 tng bang h閕");	--删除某个地图ID上的，某个名字的NPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng th祅h th")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nCitySTID ~= 0) then
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function logicTongDegrade(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel < 1)then
		return 1, nCurLevel
	end	
	return 0, nCurLevel
end
function DEGRADE_R(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet ~= 0)then
		return 0
	end	
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nWsUpperLevel = tongGetWorkshopUpperLevel(nTongID, nCurLevel - 1)
	--调整所有作坊使用等级
	while(nWorkshop ~= 0)do
		if (TWS_GetUseLevel(nTongID, nWorkshop) > nWsUpperLevel)then
			TWS_ApplySetUseLevel(nTongID, nWorkshop, nWsUpperLevel)
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	-- 帮会历史/事件记录、通知
	local szRecord = "Ъng c蕄 ki課 thi誸 gi秏 xu鑞g "..(nCurLevel - 1).."c蕄";
	TONG_ApplyAddHistoryRecord(nTongID, szRecord);		-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szRecord);		-- 帮会事件记录
	cTongLog:WriteInfTB("TONG", "degrade", nTongID, {buildlevel = (nCurLevel - 1), day = TONG_GetDay(nTongID)})
	return 1
end
function DEGRADE_G_1(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
	end
	return 0
end
--DEGRADE_G_2 = DefFun1
function DEGRADE_G_2(nTongID)
--此时获得的建设等级？升级前？升级后？此处暂以升级后处理
	local nCurLevel = TONG_GetBuildLevel(nTongID) - 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nMapIndex < 0) then
		return 1
	end
	if (nCurLevel == 4) then	--5级降至4级时，图腾要变身的
		ClearMapNpcWithName(nMap, "C閠 bi觰 tng bang h閕");	--删除某个地图ID上的，某个名字的NPC
		ClearMapNpcWithName(nMap, "C閠 bi觰 tng th祅h th");	--删除某个地图ID上的，某个名字的NPC
		local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C閠 bi觰 tng bang h閕")--右

		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
		SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
		local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C閠 bi觰 tng bang h閕")--左
		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
		SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		if (nStuntID ~= 0) then
			AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
		end
	elseif (nCurLevel == 3) then	--降至3级时，就没有图腾了
		ClearMapNpcWithName(nMap, "C閠 bi觰 tng bang h閕");	--删除某个地图ID上的，某个名字的NPC
	end
	return 1
end


function TONGCLAIMWAR_R(nTongID, nDestTongID)
--	local nTimes    = 0;
--	local nCurTimes = 0;
--	local nCurDay = TONG_GetDay(nTongID);
--	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
--	if (nCurDay ~= nDay) then
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
--	elseif (nCurDay == nDay) then
--		nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
--	end;
	
	local nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	local nCurTimes = nTimes + 1;
	
	local nCostMoneyFund = 0;	--单位:万
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then	
		Msg2Player("Bang h閕 tuy猲 chi課 c莕 giao n閜"..nCostMoneyFund.." v筺 l蕐 t� ng﹏ s竎h!");
		return 0;
	end;
	
	--宣战成功后，次数加1，存入
	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);
	
	local szDestTongName = GetTongNameByID(nDestTongID);
	local szTongMsg = "Bang ch�   tuy猲 chi課 bang h閕"..szDestTongName.." r錳";
	Msg2Tong(nTongID, szTongMsg);
	TONG_ApplyAddEventRecord(nTongID, szTongMsg);
	return 1;
end

function TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	if (nTongID == nDestTongID) then
		Msg2Player("Kh玭g th� t� tuy猲 chi課 bang h閕 ch輓h m譶h!");
		return 0;
	end;
	
	local szDoFunc = "/#DO_TONGCLAIMWAR_G_1("..nTongID..","..nDestTongID..")"
	Say("X竎 nh薾 mu鑞 tuy猲 chi課?",2,"X竎 nh薾"..szDoFunc, "в ta suy ngh� l筰/cancel")
end

function DO_TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	local nTimes    = 0;
	local nCurTimes = 0;
	local nCurDay = TONG_GetDay(nTongID);
	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
	if (nCurDay ~= nDay) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
	elseif (nCurDay == nDay) then
		 nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	end;
	
	nCurTimes = nTimes + 1;	
	local nCostMoneyFund = 0;	--单位:万
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_GetMoney(nTongID) < nCostMoneyFund * 10000) then
		Msg2Player("Tuy猲 chi課 bang h閕 c莕 giao n閜"..nCostMoneyFund.." v筺 l蕐 t� ng﹏ s竎h!");
		return 0;
	end;	
	
	--在relay那设置
--	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);	

	TongClaimWar(nDestTongID);
	return 1;
end

function cancel()
end

TONGCLAIMWAR_G_2 = DefFun2

function ClaimWar_Death_Process(nAttackerIndex)
	local result = 0;	
	local szTong = 0;
	szTong, result = GetTong();
	
	local szAttackPlayer = GetNpcName(nAttackerIndex);
	local szDestTong     = GetNpcTong(nAttackerIndex);
	
	local szMsg = format("%s bang h閕 c馻 %s  ti猽 di謙 %s bang h閕 c馻 %s", szDestTong, szAttackPlayer, szTong, GetName());
	Msg2SubWorld(szMsg);
end

function CHANGECAMP_R(nTongID, nCamp)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2PlayerByName(szExecutorName, "Kh玭g th� thay i phe ph竔 trong li猲 minh c馻 bang h閕");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2PlayerByName(szExecutorName, "攻城战阶段不能改变帮会阵营！");
--		return 0;
--	end
	
	local nCostMoneyFund = 100;	-- 单位：万 应越南人要求改为100W by Zhi Dong
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, "фi phe c竛h cho bang c莕 n筽 ph� "..nCostMoneyFund.." v筺 l蕐 t� ng﹏ s竎h!");
		return 0;
	end
	Msg2Tong(nTongID, "Bang ch� thay i phe ph竔 c馻 b鎛 bang! ");
	cTongLog:WriteInfTB("TONG", "changecamp", nTongID, {camp = nCamp, camp_old = nCurCamp})
	return 1;
end
function CHANGECAMP_G_1(nTongID, nCamp)
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2Player("Kh玭g th� thay i phe ph竔 trong li猲 minh c馻 bang h閕");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("攻城战阶段不能改变帮会阵营！");
--		return 0;
--	end
	local nCostMoneyFund = 100; -- 单位：万 应越南人要求改为100W by Zhi Dong
	if (TONG_GetMoney(nTongID) < nCostMoneyFund*10000) then
		Msg2Player("фi phe c竛h cho bang c莕 n筽 ph� "..nCostMoneyFund.." v筺 l蕐 t� ng﹏ s竎h!");
		return 0;
	end
	return 1;
end

--帮主自荐维护
function Master_SelfCommend_Maintain(nTongID)
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		return	--若没有开启则返回
	end
	
	local dwIniDayTime = TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE);
	local dwCurrTime = GetSysCurrentTime();
	local nOweday = ceil((dwCurrTime - dwIniDayTime)/(24 * 3600 ))
	if (nOweday <= CAST_DURATION) then -- 还没有到结束期
		return
	end
	
	Msg2Tong(nTongID, "Th阨 gian t� ti課 c�  k誸 th骳");
	TONG_ApplyAddEventRecord(nTongID, "Th阨 gian t� ti課 c�  k誸 th骳");
	local bRetireLoop = 0;
	local nMemberID  = TONG_GetFirstMember(nTongID, -1);
	--保存前3名，属性分别为成员ID,竞投数，竞投日期
	tbForecontributiveness = 
	{ 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime} 
	} 
	
	--保存前3名的投出的贡献度
	while (nMemberID > 0) do
		local nContributiveness = TONGM_GetTaskValue(nTongID,nMemberID, TONGMTSK_CONTRIBUTIVENESS) --获得个人贡献度
		local dwContributivenesstime = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME)--获得竞投时间
		if (nContributiveness > tbForecontributiveness[3][2] or 
			(nContributiveness == tbForecontributiveness[3][2] and 
			dwContributivenesstime < tbForecontributiveness[3][3] and
			nContributiveness > 0) and --保证参加了竞投
			dwContributivenesstime > dwIniDayTime	--保证是本次竞投，而不是上一次的
			) then
				tbForecontributiveness[3][1] = nMemberID
				tbForecontributiveness[3][2] = nContributiveness
				tbForecontributiveness[3][3] = dwContributivenesstime
				if ((tbForecontributiveness[3][2] > tbForecontributiveness[2][2]) or
					(tbForecontributiveness[3][2] == tbForecontributiveness[2][2] and
					tbForecontributiveness[3][3] < tbForecontributiveness[2][3])) then
					tbForecontributiveness[2],tbForecontributiveness[3] = tbForecontributiveness[3],tbForecontributiveness[2];
						if ((tbForecontributiveness[2][2] > tbForecontributiveness[1][2]) or
        					(tbForecontributiveness[2][2] == tbForecontributiveness[1][2] and
        					tbForecontributiveness[2][3] < tbForecontributiveness[1][3])) then
        					tbForecontributiveness[1], tbForecontributiveness[2] = tbForecontributiveness[2], tbForecontributiveness[1];
        				end 
        		end 
        end 

        --成员任务变量清0
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, 0);
		if (bRetireLoop == 0) then
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, -1);	--遍历下一个成员
			if (nMemberID == 0) then
				nMemberID = TONG_GetFirstMember(nTongID, 4);		--遍历第一个隐士
				bRetireLoop = 1;
			end
		else
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, 4);	--遍历下一个隐士
		end
	end  --end while

	
	--公布前3名
	for i = 1, 3 do
		if (tbForecontributiveness[i][1] ~= 0 and tbForecontributiveness[i][2] ~= 0) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[i][1])
			local szDateTime = FormatTime2String(tbForecontributiveness[i][3])
			local szMsg = "h筺g th� "..i.." "..szMember.." S� tranh c�: "..tostring(tbForecontributiveness[i][2]).." Th阨 gian tranh c�: "..szDateTime;
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end 
	
	--设置新的帮主
	if (tbForecontributiveness[1][1] == 0) then
			Msg2Tong(nTongID, "L莕 tranh c� ch鴆 bang ch� n祔 kh玭g ch鋘 頲 ngi th輈h h頿.");
	else
		if (TONG_GetFirstMember(nTongID, 0) == tbForecontributiveness[1][1] or
			SetTongMaster(nTongID, tbForecontributiveness[1][1]) == 1) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[1][1]);
			Msg2Tong(nTongID, "Bang ch� nhi謒 v� m韎 c馻 bang s� l� "..tostring(szMember).."S� 甶觤 tranh c� c馻 bang ch� m韎 l�: "..tostring(tbForecontributiveness[1][2]));
			TONG_ApplyAddHistoryRecord(nTongID, "Bang ch� nhi謒 v� m韎 c馻 bang s� l� "..tostring(szMember).."S� 甶觤 tranh c� c馻 bang ch� m韎 l�: "..tostring(tbForecontributiveness[1][2]));
		else
			local tbMsg = {
				masterid     = tbForecontributiveness[1][1]
				};
			cTongLog:WriteErrTB("TONG", "master_bidding", nTongID, tbMsg);
		end
	end
	
	--任务变量清零
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, 0);
end


--function CHANGECAMP_C_1(nTongID, nCamp)
--	local nCurCamp =TONG_GetCurCamp(nTongID);
--	if (nCurCamp == nCamp or nCurCamp < 1 or nCurCamp > 3) then
--		return 0;
--	end
--	if (TONG_GetUnionID(nTongID) ~= 0) then
--		Msg2Player("帮会联盟中，不能修改阵营！");
--		return 0;
--	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("攻城战阶段不能改变帮会阵营！");
--		return 0;
--	end
--	return 1;
--end
CHANGECAMP_G_2 = DefFun2

---------客户端的全放在这。。。。。。。。。。。。
else
INIT_C_1 = DefFun1
INIT_C_2 = DefFun1
ADD_C_1 = DefFun2
ADD_C_2 = DefFun2
REMOVE_C_1 = DefFun1
REMOVE_C_2 = DefFun1
WEEKLY_MAINTAIN_C_1 = DefFun1
WEEKLY_MAINTAIN_C_2 = DefFun1
MAINTAIN_C_1 = DefFun1
MAINTAIN_C_2 = DefFun1
UPGRADE_C_1 = DefFun1
UPGRADE_C_2 = DefFun1
DEGRADE_C_1 = DefFun1
DEGRADE_C_2 = DefFun1
CHANGECAMP_C_1 = DefFun2
CHANGECAMP_C_2 = DefFun2
TONGCLAIMWAR_C_1 = DefFun2
TONGCLAIMWAR_C_2 = DefFun2	
end