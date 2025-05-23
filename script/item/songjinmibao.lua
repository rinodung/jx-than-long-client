-- 随机宝箱物品（随机获得一样物品）
-- By: Wangjingjun(2011-02-17)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch骳 m鮪g cao th� <color=yellow>%s<color=green>  nh薾 頲 <color=yellow><%s><color=green> t� <color=yellow><T鑞g Kim B� B秓><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbSJ_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbSJNewAward = 
{	
	["chiakhoanhuy"] = 
	{
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "T鑞g Kim B� B秓")
					end,
					nRate = 52,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "T鑞g Kim B� B秓")
					end,
					nRate = 30,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "T鑞g Kim B� B秓")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "T鑞g Kim B� B秓")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "T鑞g Kim B� B秓")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="у Ph� B筩h H� Y猽 Цi",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.008},
		{szName="у Ph� B筩h H� Thng Gi韎",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.008},
		{szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � Thng Gi韎",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.5},
		{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.5},
		{szName="у Ph� Kim � Kh� Gi韎",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
		{szName="Kim � L謓h",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
		{szName="B秓 Rng Kim � H� Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.01,CallBack = _Message},
		{szName="B秓 Rng Kim � Thng Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01,CallBack = _Message},
		{szName="B秓 Rng Kim � H礽",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01,CallBack = _Message},
		{szName="B秓 Rng Kim � Y猽 Цi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01,CallBack = _Message},
		{szName="B秓 Rng Kim � H� Uy觧",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01,CallBack = _Message},
		{szName="B秓 Rng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.005,CallBack = _Message},
		{szName="T鑞g Kim Chi猽 Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
		{szName="H錳 thi猲 t竔 t筼 l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.01,nExpiredTime=43200},
		{szName="Ph� Th髖 Chi B秓",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.129},
		{szName="Ti猽 Di猽 T竛",tbProp={6,1,2831,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "T鑞g Kim B� B秓")
					end,
					nRate = 33,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "T鑞g Kim B� B秓")
					end,
					nRate = 25,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "T鑞g Kim B� B秓")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "T鑞g Kim B� B秓")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "T鑞g Kim B� B秓")
					end,
					nRate = 3,
		},
		{szName="觤 kinh nghi謒 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "T鑞g Kim B� B秓")
					end,
					nRate = 2,
		},
		{szName="觤 kinh nghi謒 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "T鑞g Kim B� B秓")
					end,
					nRate = 1,
		},
		{szName="T� M穘g Chi B秓 (竜)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={5,0,0,0,0,0}, CallBack = _Message},
		{szName="T� M穘g Chi B秓 (Ng鋍 B閕)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={8,0,0,0,0,0}, CallBack = _Message},
		{szName="T� M穘g Chi B秓 (Nh蒼 Di)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={9,0,0,0,0,0}, CallBack = _Message},
		{szName="T� M穘g Chi B秓 (i L璶g)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={4,0,0,0,0,0}, CallBack = _Message},
		{szName="T� M穘g Chi B秓 (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={6,0,0,0,0,0}, CallBack = _Message},	
		{szName="Phi phong Kinh L玦 (D辌h chuy觧 t鴆 th阨)",tbProp={0,3470},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Phi phong Kinh L玦 (X竎 su蕋 h鉧 gi秈 s竧 thng)",tbProp={0,3471},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Phi phong Kinh L玦 ( Tr鋘g k輈h )",tbProp={0,3472},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Qu� Ho祅g Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=0.335,nExpiredTime=43200},
	},	
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbSJ_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbSJ_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 T鑞g Kim B� B秓", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 nh� �/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 v祅g/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "сng/Oncancel")
		Say("S� d鬾g ch譨 kh鉧  m� rng:", getn(tbOpt), tbOpt)
	end
	return 1	
end
function Oncancel()end

function VnSJBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbSJ_Key_Require[strKeyType]
	local tbAward = tbSJNewAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 T鑞g Kim B� B秓", 1, "сng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2741, -1) ~= 1 then
		Say("Kh玭g t譵 th蕐 T鑞g Kim B� B秓", 1, "сng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"SongJin", "use songjingmibao"})	
	AddStatData("baoxiangxiaohao_kaisongjinmibao", 1)	
end