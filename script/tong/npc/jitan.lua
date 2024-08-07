IncludeLib("TONG")

Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\map\\map_management.lua")
Include("\\script\\global\\tonggetmasterpower.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\fenghuo_hero\\hero_event.lua")

--帮会周目标领奖
function tong_award(nTongID)
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		CreateTaskSay({"<dec><npc>Ngi kh玭g c� quy襫 h筺 qu秐 l� m鬰 ti猽 tu莕, kh玭g th� l穘h thng!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>Tu莕 trc kh玭g c� m鬰 ti猽 tu莕, kh玭g th� nh薾 thng!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Qu� bang ch璦 ho祅 th祅h m鬰 ti猽 tu莕 trc, kh玭g th� nh薾 thng!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	local nWeek = TONG_GetWeek(nTongID);
	--必须加临时变量判断，否则会刷！因为帮会任务变量在服务端不是即时设上的！
	--由于领奖只能在自身帮会地图，因此基本不存在多个服务器同时领奖来刷的情况
	if (nWeek == TONG_GetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE) or 
		nWeek == TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK)) then
		CreateTaskSay({"<dec><npc>Х nh薾 ph莕 thng r錳, c遪 mu鑞 nh薾 n鱝 sao!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	local nWeekGoalPriceTong = TONG_GetLWeekGoalPriceTong(nTongID)
	TONG_ApplyAddWarBuildFund(nTongID, nWeekGoalPriceTong);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWeekGoalPriceTong);
	--把领奖标志设为本周
	TONG_SetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE, nWeek);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK, nWeek);
	TONG_ApplyAddEventRecord(nTongID, "Х nh薾 thng m鬰 ti猽 tu莕. "..nWeekGoalPriceTong.." v筺 ng﹏ s竎h chi課 b�");	-- 帮会事件记录
	Msg2Player(format("Nh薾 頲 ph莕 thng m鬰 ti猽 tu莕: Ng﹏ s竎h chi課 b� <color=gold>%d<color> v筺", nWeekGoalPriceTong))
end

--个人周目标领奖
function WeekGoalPrice(nTongID)
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>Tu莕 trc qu� bang kh玭g c� m鬰 ti猽 tu莕, kh玭g th� nh薾 thng!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Ch璦 ho祅 th祅h m鬰 ti猽 tu莕, kh玭g th� nh薾 thng!", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nLWeekValue = TONGM_GetLWeekGoalOffer(nTongID, GetName())
	local nPlayerGoal = TONG_GetLWeekGoalPlayer(nTongID)
	--使用的是由服务端决定的成员变量
	local nState = GetTongMTask(TONGMTSK_WEEK_GOAL_PRICE)
	if (nState == nTongWeek) then --已领过奖，周数为本周
		CreateTaskSay({"<dec><npc>Х nh薾 ph莕 thng m鬰 ti猽 tu莕 trc r錳, c莕 ti誴 t鬰 c鑞g hi課 cho bang h閕, tu莕 sau h穣 n nh�.", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	if (nLWeekValue == 0 or nPlayerGoal == 0) then
		CreateTaskSay({"<dec><npc>Tu莕 trc ch璦 l祄 vi謈 g� c�, l祄 g� c� chuy謓 kh玭g c玭g 頲 thng ch�?", "Ta bi誸 r錳/tong_cancel"});
		return
	end
	if (nLWeekValue < nPlayerGoal) then
		CreateTaskSay({"<dec><npc>Ch璦 ho祅 th祅h m鬰 ti猽 tu莕 trc, kh玭g th� nh薾 thng, c莕 ti誴 t鬰 c� g緉g cho bang h閕, s韒 mu閚 g� c騨g 頲 n p th玦.", "Ta bi誸 r錳/tong_cancel"});
		return
	end	
	local nPrice = TONG_GetLWeekGoalPricePlayer(nTongID)
	AddContribution(nPrice)
	Msg2Player("<#>Х ho祅 th祅h m鬰 ti猽 tu莕 bang h閕, nh薾 頲 ph莕 thng 甶觤 c鑞g hi課:"..nPrice.."甶觤")
	Msg2Player("<#>Х ho祅 th祅h m鬰 ti猽 tu莕 bang h閕, nh薾 頲 ph莕 thng 甶觤 kinh nghi謒: "..(nPrice*10000).."甶觤")
	AddOwnExp(nPrice*10000)
	SetTongMTask(TONGMTSK_WEEK_GOAL_PRICE, nTongWeek)
end

function main()
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (GetProductRegion() == "cn_ib") then
		-- 帮会地图模板中的祭酒则直接进入地图管理
		if (aDynMapCopyName[nSubWorldId] ~= nil) then
			tongmap_management();
			return
		end
	end;
	local _Name, nTongID = GetTongName();
	-- 玩家没有帮会则不出现功能列表
	if (nTongID == 0) then
		CreateTaskSay({"<dec><npc>Mu鑞 t譵 hi觰 th玭g tin v� h� th鑞g bang h閕 m韎!", "Tr� gi髉 bang h閕/#tong_help()", "H駓 b� /tong_cancel"});
		return
	end
	local param = "("..nTongID..")";
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (nSubWorldId > DYNMAP_ID_BASE and nSubWorldId ~= TONG_GetTongMap(nTongID)) then
		Say("Зy kh玭g ph秈 l� l穘h a c馻 qu� bang, mu鑞 n tham quan sao?", 2, "Tr� gi髉 bang h閕/#tong_help()", "Nh﹏ ti謓 gh� qua th玦/tong_cancel");
		return
	end
	local figure = TONGM_GetFigure(nTongID, GetName());
	local aryDescribe = 
	{
				"<dec><npc>Ngi t譵 ta c� vi謈 g�?",
				"Ph莕 thng m鬰 ti猽 tu莕 c� nh﹏/#WeekGoalPrice"..param,
				"Nh薾 ph莕 thng 甶觤 c鑞g hi課 m鏸 ng祔/#GetDayPrice"..param,
--				"建设等级提升奖励/LUP_HelpInfo",
				-- 越南帮会不出
--				"仿制安邦套装/enter_anbang",
				"T� ti課 c� ch鴆 bang ch�/#tong_mastercompetition"..param,
--				"帮会帮助信息/#tong_help()",
	};
	--如果是长老和帮主
	if (figure == TONG_MASTER or figure == TONG_ELDER) then
		tinsert(aryDescribe, "Thi誸 l藀  kh� m鬰 ti猽 tu莕/#tong_levelchoose"..param);
		tinsert(aryDescribe, "Ph莕 thng m鬰 ti猽 tu莕 bang h閕/#tong_award"..param);
	end
	tinsert(aryDescribe, "Tr� gi髉 bang h閕/#tong_help()");
	tinsert(aryDescribe, "H駓 b� /tong_cancel");
	CreateTaskSay(aryDescribe);
end

function tong_help()
	OpenHelp(80)
end

function GetDayPrice(nTongID)
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_RETIRE) then
		Say("ng � tr筺g th竔 tho竔 萵, kh玭g th� nh薾 thng", 0);	
		return
	end	
	if (TONGM_GetJoinDay(nTongID, GetName() ) == TONG_GetDay(nTongID)) then
		Say("<#>Ph秈 v祇 bang tr猲 m閠 ng祔 m韎 頲 nh薾!", 0)
		return
	end

	if (TONG_GetBuildLevel(nTongID) <= 0) then
		Say("<#>Bang h閕 t c蕄 1 m韎 頲 nh薾 甶觤 c鑞g hi課", 0)
		return
	end
	--祭坛奖励不累加到周累积贡献度
	if (TONG_GetPauseState(nTongID) ~= 0) then
		Say("<#>Bang h閕 產ng � tr筺g th竔 t筸 ng鮪g ho箃 ng, kh玭g th� nh薾  ", 0)
		return
	end
	local nTongDay = TONG_GetDay(nTongID)
	if (GetTongMTask(TONGMTSK_DAILY_PRICE) == nTongDay) then
		Say("<#>Х nh薾 ph莕 thng h玬 nay", 0)
		return
	end
	local nPrice = DAILY_PRICE
	if (nPrice > 0)then
		AddContribution(nPrice)
		Msg2Player("Nh薾 頲 <color=gold>"..nPrice.."<color> 甶觤 c鑞g hi課")
	end
	SetTongMTask(TONGMTSK_DAILY_PRICE, nTongDay)
end

function unchain_pause_state(nTongID)
	local nConsume = TONG_GetMaintainFund(nTongID)	
	local nCurFund = TONG_GetWarBuildFund(nTongID)
	if (nCurFund < nConsume*7) then
		Say("<#>Ng﹏ s竎h chi課 b� th蕄 h琻 m鴆 ng﹏ s竎h chi課 b� b秓 tr� cho ph衟, kh玭g th� kh雐 ng t竎 phng!", 0)
	else	
		TONG_ApplySetPauseState(nTongID, 0)
		Msg2Tong(nTongID, "T竎 Phng bang h閕 kh玦 ph鬰 ho箃 ng!")
	end
end

function tong_levelchoose(nTongID)
	if nTongID == 0 then return end;
	local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
	Say("<#>M鴆  kh� m鬰 ti猽 tu莕 c馻 bang h閕 l� c蕄 <color=yellow>"..nLevel.."<color>,\n\n Thi誸 l藀  kh� m鬰 ti猽 tu莕 hi謓 t筰 s� c� t竎 d鬾g v祇 tu莕 sau, mu鑞 thi誸 l藀 l筰  kh� c馻 m鬰 ti猽 tu莕 kh玭g?", 3, "ч kh� c蕄 1/#select_level(1)", "ч kh� c蕄 2/#select_level(2)", "Kh玭g c莕 u/tong_cancel")
end

function select_level(nLevel)
	local _Name, nTongID = GetTongName()
	if nTongID == 0 then return end;
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		Say("<#>Ngi kh玭g c� quy襫 h筺 qu秐 l� m鬰 ti猽 tu莕, h穣 m阨 bang ch� n y!", 0)
		return
	end
	TONG_ApplySetCurWeekGoalLevel(nTongID, nLevel)
	Say("<#>ч kh� m鬰 ti猽 tu莕 hi謓 t筰 l�: <color=yellow>"..nLevel.."c蕄", 0)
end

-- 用户点击帮主自荐
function tong_mastercompetition() 
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --如果帮主存在
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --帮主离开少于30天,而且现在不在线
				Say("Bang ch� ch璦 r阨 kh醝 30 ng祔, ch璦 th� t� ch鴆 t� ti課 c� v祇 ch鴆 v� bang ch�", 1, "X竎 nh薾/tong_cancel");
			return
		end
	end
	
	local param = "("..nTongID..")";
	
	-- 执行到此处表明帮主离开30天了
	if (CheckTongMasterPower() ~= 1) then --不符合当帮主的资格
		Say("觤 th鑞g so竔 v� danh v鋘g kh玭g   m nhi謒 ch鴆 v� bang ch�", 1, "X竎 nh薾/tong_cancel")
		return
	end

	--执行到这里表明开启帮主的条件达到，根据是否开启竞选来开启或参与
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then --若没有开启
		Say("Bang ch�  r阨 kh醝 30 ng祔, ngi c� th� t� ti課 c� v祇 ch鴆 v� bang ch�, 2 tu莕 sau c� th� tham gia cu閏 b譶h ch鋘 bang ch�.",
			2, "B総 u/#_tong_startup_compete"..param, "H駓 b� /tong_cancel");
	elseif (TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE) == 0) then --还没有进行2240任务,不是帮主候选人
		Say("Mu鑞 tranh 畊a ch鴆 bang ch� c莕 ph秈 ng g鉷 nhi襲 cho bang h閕 trong v遪g 2 tu莕 t韎: tham gia c竎 ho箃 ng v� t 頲 2240 甶觤 c鑞g hi課 c� nh﹏ (甶觤 c鑞g hi課 d� tr� thng t� bang h閕, 甶觤 c鑞g hi課 t� T� Уn, 甶觤 c鑞g hi課 c� nh﹏ t� m鬰 ti猽 tu莕 s� kh玭g 頲 t輓h)", 2, "Tham gia/_foretask", "H駓 b� /tong_cancel");
	else  --已经是候选人了，即参加了2240任务
		local nIniContribution = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS);--获得刚参与2240任务时的贡献度
		local nEarnContributiveness =  GetCumulateOffer() - nIniContribution;--相减得到增加的手工贡献度
		if(nEarnContributiveness < FORETASKVALUE ) then --贡献点还不够2240
			Say("Х c� "..tostring(nEarnContributiveness).." 甶觤 c鑞g hi課"..", c遪 thi誹 "..tostring(FORETASKVALUE - nEarnContributiveness).." 甶觤 c鑞g hi課.", 0);
			return
		end
		local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);
		if (nLastContributiveness == 0) then
			Say("Xin ch骳 m鮪g! Ngi  t譵 頲 t鑙 thi誹 l� 2240 甶觤 c鑞g hi課 n猲 c� th� tham gia tranh 畊a cng v� bang ch�, h穣 nh藀 v祇 con s�  thi th�, con s� cao nh蕋 s� g蕄 20 l莕 甶觤 c鑞g hi課 c� nh﹏ c馻 ngi, v� c騨g l璾 � l� m鏸 l莕 ch鋘 l鋍 s� tr� 5% ph� th� t鬰.", 2, "X竎 nh薾/inputcontributiveness", "H駓 b� /tong_cancel");
		else
			Say("S� 甶觤 thi 畊a l� "..tostring(nLastContributiveness)..", ngi mu鑞 t╪g th猰 sao?", 2, "+/inputcontributiveness", "H駓 b� /tong_cancel");
		end
	end
end 

--启动帮主自荐
function _tong_startup_compete(nTongID)
	local _Name, nCurTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (nCurTongID == 0 or nTongID ~= nCurTongID) then
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --如果帮主存在
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --帮主离开少于30天,而且现在不在线
			return
		end
	end
	
	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, dwCurrDateTime); --竞选开始日期
	--帮聊，帮会事件中记录
	Msg2Tong(nTongID, "Ho箃 ng t� ti課 c鯽 bang ch�  b総 u");
	TONG_ApplyAddEventRecord(nTongID, "Ho箃 ng t� ti課 c鯽 bang ch�  b総 u");
	--遍历清空
	local tbMsg = {
		startmemberid	 = GetTongMemberID(),
		startupdate      = FormatTime2String(dwCurrDateTime)
		}
		cTongLog:WriteInfTB("TONG", "master_compete_date", nTongID, tbMsg)

		Say("Х b総 u t� ti課 c� v祇 ch鴆 bang ch�, mu鑞 tranh 畊a ch鴆 bang ch� c莕 ph秈 ra s鴆 c鑞g hi課 cho bang h閕 trong v遪g 2 tu莕 s緋 t韎: tham gia c竎 ho箃 ng v� l﹎  t譵 2240 甶觤 c鑞g hi課 c� nh﹏ (甶觤 c鑞g hi課 t� ph莕 thng c馻 bang h閕, 甶觤 c鑞g hi課 nh薾 � T� Уn, 甶觤 c鑞g hi課 c� nh﹏ t� ph莕 thng m鬰 ti猽 tu莕 u kh玭g t輓h v祇 甶觤 c鑞g hi課 tham gia ho箃 ng)", 2, "Tham gia/_foretask", "H駓 b� /tong_cancel");
end

--设置为候选人,并安排先决任务,为帮会贡献2240点贡献度
function _foretask()
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 1);--设为帮主候选人
	Say("Xin ch骳 m鮪g, ngi  tr� th祅h ngi 頲  c�, h穣 mau ch鉵g nh薾 l筰 2240 甶觤 c鑞g hi課.", 1, "X竎 nh薾/tong_cancel");
	local tbMsg = {
		mastercandidat	 = GetTongMemberID()
		};
	cTongLog:WriteInfTB("TONG", "master_candidat", nTongID, tbMsg);
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, GetCumulateOffer()); --记录当前手工贡献度,作为2240任务的起始标志
end

--让用户输入要投的钱数
function inputcontributiveness()
	AskClientForNumber("tong_masterbidding", 1, 500000000, "H穣 nh藀 v祇 con s�: ");
end

-- 竞投，注意保存每个人的竞投日期,已便并列的时候进行排列
function tong_masterbidding(nContributiveness )
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrsecond = GetCurServerTime();

	--计算将要扣除贡献度
	local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);--上次投过的
	local nCurrTotalOffer = nLastContributiveness + nContributiveness; --总共投过的
	local nDeductContributiveness = ceil((nContributiveness/ 20));--要扣除的贡献度
	local nNewcontrvalue = GetContribution() - nDeductContributiveness;
	
	if (nNewcontrvalue < 0) then
		Say("觤 c鑞g hi課 th蕄 h琻 5% con s�  nh藀 v祇, kh玭g th� tham gia.", 0);
		return
	end
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, nCurrTotalOffer)
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, dwCurrsecond)--记录竞投时间,当贡献度相同的时候，先来者优先
	
	Say("S� 甶觤 tranh 畊a l�: "..tostring(nCurrTotalOffer), 0);
	AddContribution((-nDeductContributiveness));

	local tbMsg = {
		contribution     = nCurrTotalOffer,
		selfcommend_time = FormatTime2String(dwCurrsecond)
		}
	cTongLog:WriteInfTB("TONG", "master_bidding", nTongID, tbMsg)
end

---仿制定国安绑---------------------------------------------------------------------------
--仿制定国安绑的表
ab_detail = {
			[1] = {"An Bang 襫 Ho祅g th筩h ng鋍 b閕", "T鎛g qu秐 Ho箃 ng phng: Mua <color=yellow>[Ph醤g ch誡 An Bang 襫 Ho祅g Th筩h Ng鋍 B閕<color> c莕 <color=yellow>200<color> 甶觤 c鑞g hi課, ngi ng � kh玭g?", 200, 218},
			[2] = {"An Bang C骳 hoa Th筩h ch� ho祅", "T鎛g qu秐 Ho箃 ng phng: Mua <color=yellow>[Ph醤g ch誡 An Bang C骳 Hoa Th筩h Ch� Ho祅 <color> c莕 <color=yellow>500<color> 甶觤 c鑞g hi課, ngi ng � kh玭g?", 500, 217},
			[3] = {"An Bang K� Huy誸 Th筩h Gi韎 Ch�", "T鎛g qu秐 Ho箃 ng phng: Mua <color=yellow>[Ph醤g ch誡 An Bang K� Huy誸 Th筩h Gi韎 Ch�<color> c莕 <color=yellow>500<color> 甶觤 c鑞g hi課, ngi ng � kh玭g?", 500, 219},
			[4] = {"An Bang B╪g Tinh Th筩h H筺g Li猲", "T鎛g qu秐 Ho箃 ng phng: Mua <color=yellow>[Ph醤g ch誡 An Bang B╪g Tinh Th筩h H筺g Li猲<color> c莕 <color=yellow>1000<color> 甶觤 c鑞g hi課, ngi ng � kh玭g?", 1000, 216}
};
function enter_anbang()
	--安邦的选项
	local tab_ab_content = {};
	local nLoop = 4;

	tinsert(tab_ab_content, "T譵 hi觰 v� b� An bang ph醤g ch�/tong_ab_about");
	for i = 1, nLoop do
		tinsert(tab_ab_content, "Ta mu鑞 mua "..ab_detail[i][1].." ("..ab_detail[i][3].." 甶觤 c鑞g hi課) /#tong_ab_get("..i..")");
	end;
	tinsert(tab_ab_content, "R阨 kh醝/tong_cancel");
	Say("T� Уn:  Ha ha ha単莕 y, bang h閕  ph醤g ch� 頲 b� trang b� an bang, tuy ch� l� m� ph醤g, nh璶g hi謚 qu� c馻 n� c騨g kh玭g thua g� b� an bang th藅, ngo礽 ra, khi d飊g chung v韎 b� an bang th藅 v蒼 c� th� k輈h ho箃 頲 nh� thng. Ngi c� mu鑞 mua kh玭g?",
	getn(tab_ab_content), tab_ab_content);
end;

function tong_ab_about()
	Say("T� Уn:  Зy l� b� an bang ph醤g ch�, tuy thu閏 t輓h c� kh竎 v韎 b� an bang g鑓, nh璶g nguy猲 li謚 ch� t筼 th� r� h琻 nhi襲. Ngi c� th� mua <color=yellow>[Ph醤g ch誡 An Bang C骳 Hoa Th筩h Ch� Ho祅<color>, <color=yellow>[Ph醤g ch誡 An Bang K� Huy誸 Th筩h Gi韎 Ch�<color>, <color=yellow>[Ph醤g ch誡 An Bang 襫 Ho祅g Th筩h Ng鋍 B閕<color>, <color=yellow>[Ph醤g ch誡 An Bang B╪g Tinh Th筩h H筺g Li猲<color>.", 0);
end;

function tong_ab_get(nIndex)
	if (nIndex < 1 or nIndex > 4) then
		return
	end;
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	if (GetContribution() < ab_detail[nIndex][3]) then
		Say("T� Уn:  觤 c鑞g hi課 c� nh﹏ kh玭g  <color=yellow>"..ab_detail[nIndex][3].."<color> 甶觤, kh玭g th� mua bang v藅 n祔, h穣 c� g緉g t譵 甶觤 c鑞g hi課 trc .", 0);
		Msg2Player("觤 c鑞g hi課 c� nh﹏ kh玭g , kh玭g th� s� d鬾g ch鴆 n╪g n祔.");
		SetTaskTemp(193, 0);
		return
	end;
	
	AddGoldItem(0, ab_detail[nIndex][4]);
	AddContribution(-ab_detail[nIndex][3]);
	Msg2Player("S� d鬾g <color=yellow>"..ab_detail[nIndex][3].." 甶觤 c鑞g hi課<color>  mua 1<color=yellow>"..ab_detail[nIndex][1].."<color>.")
	SetTaskTemp(193, 0);
end;

-------------------------------帮会升级奖励---------------------------------------
aTongLevelUpPrice = {
	[2] = {	--2级时：boss符，武神之印，高级辉煌之果
		{20, 100, 200},
		{10, 100, 50},
		{8, 100, 50},
		{6, 100, 50},
		{4, 100, 50},
		{2, 100, 50},
		{1, 100, 50},
	},
	[4] = {	--4级时：boss符，武神之印，高级辉煌之果
		{30, 200, 200},
		{20, 200, 100},
		{15, 200, 100},
		{10, 200, 100},
		{8, 200, 100},
		{6, 200, 100},
		{4, 200, 100},
	}									}

function LUP_HelpInfo()
	Say("Ch� c莕 l� 1 trong <color=red>7<color> bang h閕 ng u c� ng c蕄 ki課 thi誸 th╪g l猲 c蕄 <color=yellow>2<color> ho芻 <color=yellow>4<color>, "..
	 	"s� do bang ch� n ch� ta nh薾 ph莕 thng, ph莕 thng c� th� l� L謓h b礽 g鋓 Boss, V� th莕 蕁 v� qu� Huy Ho祅g cao c蕄, th� h筺g c祅g cao th� ph莕 thng c祅g nhi襲.",
	 	3, "Bang h閕 ta t  甶襲 ki謓, mu鑞 nh薾 ph莕 thng/LUP_GetPrice", "Ta mu鑞 xem n閕 dung ph莕 thng/#LUP_PriceInfo(nil)", "Bi誸 r錳/tong_cancel")	
end

function LUP_PriceInfo(nLevel, nOrder)
	if (nLevel == nil) then		
		Say("H穣 l鵤 ch鋘", 4, "Ph莕 thng khi ng c蕄 ki課 thi誸 t c蕄 2/#LUP_PriceInfo(2)", "Ph莕 thng khi ng c蕄 ki課 thi誸 t c蕄 4/#LUP_PriceInfo(4)",
			 "Quay l筰/LUP_HelpInfo", "R阨 kh醝/tong_cancel")
	elseif nOrder == nil then
		local S = {i = 0, l = nLevel}
		function S:GenParam()
			self.i = self.i+1
			return "h筺g th� "..self.i.."ph莕 thng/#LUP_PriceInfo("..self.l..","..self.i..")"
		end
		Say("H穣 l鵤 ch鋘", 9, S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(),
			"Quay l筰/#LUP_PriceInfo(nil)", "R阨 kh醝/tong_cancel")
	else
		Say("Bang h閕 c� th� nh薾 頲 <color=yellow>L謓h b礽 g鋓 Boss c蕄 10<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][1].." <color>c竔, <color=yellow>V� Th莕 蕁<color>(Sau khi s� d鬾g, trong 2 gi� 甶觤 c鑞g hi課 nh薾 頲 s� nh﹏ i)<color=green> "..aTongLevelUpPrice[nLevel][nOrder][2].." <color> c竔, <color=yellow>qu� Huy Ho祅g cao c蕄<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][3].." <color> qu�.",2,
			"Quay l筰/#LUP_PriceInfo("..nLevel..",nil)", "R阨 kh醝/tong_cancel")
	end
end

function LUP_PriceInfo2()
	Say("", 4, "Ph莕 thng khi ng c蕄 ki課 thi誸 t c蕄 2/LUP_PriceInfo2", "Ph莕 thng khi ng c蕄 ki課 thi誸 t c蕄 2/LUP_PriceInfo4",
		 "Quay l筰/LUP_HelpInfo", "R阨 kh醝/tong_cancel")
end

function LUP_GetPrice()
	local _,nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	--如果不是帮主
	if (figure ~= TONG_MASTER) then
		Say("Th藅 ng ti誧, ch� c� bang ch� m韎 c� th� nh薾 ph莕 thng.", 0)
		return
	end
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("Kh玭g 頲 r錳, bang h閕 kh玭g l� 1 trong <color=red>7<color> bang u ti猲 th╪g n c蕄 "..nLevel..", kh玭g th� nh薾 thng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Qu� bang l� bang h閕 th� <color=red>"..nOrder.."<color> th╪g n c蕄 <color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", ph莕 thng  nh薾 h誸 r錳.", 0)
		return
	elseif (nPrice < 0) then --没领过奖
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	local tbSel = {}
	if (nBossFu > 0)then
		tinsert(tbSel, "Nh薾 trc "..nBossFu.." c竔 l謓h b礽 g鋓 Boss c蕄 10/#LUP_GivePrice(1,"..nBossFu..")")
	end
	if (nContributionPie >= 1 and nContributionPie < 20)then
		tinsert(tbSel, "l穘h"..nContributionPie.." c竔 V� Th莕 蕁/#LUP_GivePrice(2,"..nContributionPie..")")
	elseif (nContributionPie >= 20)then
		tinsert(tbSel, "Nh薾 trc 20 c竔 V� Th莕 蕁/#LUP_GivePrice(2, 20)")
		if (nContributionPie >= 40)then
			tinsert(tbSel, "Nh薾 trc 40 c竔 V� Th莕 蕁/#LUP_GivePrice(2, 40)")
			if (nContributionPie >= 60)then
				tinsert(tbSel, "Nh薾 trc 60 c竔 V� Th莕 蕁/#LUP_GivePrice(2, 60)")
			end	
		end
	end
	if (nFruit >= 1 and nFruit < 20)then
		tinsert(tbSel, "l穘h"..nFruit.." qu� Huy Ho祅g cao c蕄/#LUP_GivePrice(3,"..nFruit..")")
	elseif (nFruit >= 20)then
		tinsert(tbSel, "Nh薾 trc 20 qu� Huy Ho祅g cao c蕄/#LUP_GivePrice(3, 20)")
		if (nFruit >= 40)then
			tinsert(tbSel, "Nh薾 trc 40 qu� Huy Ho祅g cao c蕄/#LUP_GivePrice(3, 40)")
			if (nFruit >= 60)then
				tinsert(tbSel, "Nh薾 trc 60 qu� Huy Ho祅g cao c蕄/#LUP_GivePrice(3, 60)")
			end	
		end
	end	
	tinsert(tbSel, "T筸 th阨 ch璦 l蕐/tong_cancel")
	Say(szOrder..", hi謓 t筰 c� <color=yellow>"..nBossFu.."<color> c竔 <color=yellow>L謓h b礽 g鋓 Boss c蕄 10<color>, <color=yellow>"..nContributionPie.."<color> c竔 <color=yellow>V� Th莕 蕁<color> v� <color=yellow> "..nFruit.."<color> <color=yellow>qu� Huy Ho祅g cao c蕄<color> c� th� nh薾, h穣 quy誸 nh xem l莕 n祔 mu鑞 nh薾 g� v� s� lng bao nhi猽", 
		getn(tbSel), tbSel)
end

function LUP_GivePrice(nWhich, num)
	local aName = {"L謓h b礽 g鋓 Boss c蕄 10", "V� Th莕 蕁", "Qu� Huy Ho祅g (cao) "}
	Say("Х nh薾 trc <color=yellow>"..num.."<color> <color=yellow>"..aName[nWhich].."<color>, h穣 b秓 m h祅h trang  ch� tr鑞g, n誹 c� r韙 ra t b� ngi kh竎 nh苩 頲 c騨g ng tr竎h ta kh玭g nh綾 nh�.", 
		2, "Ta bi誸 r錳!/#LUP_GivePrice_OK("..nWhich..","..num..")", "H穣 i ta x誴 l筰 h祅h trang ./tong_cancel")
end

function LUP_GivePrice_OK(nWhich, num)
	local _,nTongID = GetTongName();	
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("Th藅 ng ti誧, qu� bang kh玭g thu閏 1 trong 7 bang ng u t c蕄 "..nLevel..", kh玭g th� nh薾 thng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Qu� bang l� bang h閕 th� <color=red>"..nOrder.."<color> th╪g n c蕄 <color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", ph莕 thng  nh薾 h誸 r錳.", 0)
		return
	elseif (nPrice < 0) then --没领过奖
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	if nWhich == 1 then
		if (nBossFu < num)then
			return
		end
		nBossFu = nBossFu - num
		--奖励召唤符
		for i = 1,num do
			AddItem(6,1,1022,10,0,0,0)
		end
		local szMsg = GetName().."Nh薾 ph莕 thng th╪g c蕄 bang h閕: L謓h b礽 g鋓 Boss c蕄 10"..num.."c竔"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	elseif nWhich == 2 then
		if (nContributionPie < num)then
			return
		end
		nContributionPie = nContributionPie - num
		--奖励武神之印(一个月有效)
		local ntime = GetCurServerTime() + 7 * 24 * 3600;
		local nTimeParam = tonumber(FormatTime2String("%y%m%d",ntime))	
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,1264,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
			SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
			SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."Nh薾 ph莕 thng th╪g c蕄 bang h閕: V� Th莕 蕁"..num.."c竔"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)		
	elseif nWhich == 3 then
		if nFruit < num then
			return
		end
		nFruit = nFruit - num
		local ntime = tonumber(date("%y%m%d"));
		--奖励高级辉煌之果
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,906,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."Nh薾 ph莕 thng th╪g c蕄 bang h閕: qu� Huy Ho祅g cao c蕄"..num.."c竔"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	end	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, 1000 * 1000 * nFruit + 1000 * nContributionPie + nBossFu)
end

function tong_cancel()
end

