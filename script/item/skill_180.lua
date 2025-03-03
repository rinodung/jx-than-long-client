-- 文件名　：jinengmiji_90.lua
-- 创建者　：wangjingjun
-- 内容　　：各门派的秘籍， 可以学习90级技能
-- 创建时间：2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--（少林0 天王1  唐门2  五毒3   峨眉4  翠烟5   丐帮6   天忍7   武当8   昆仑9）
sbook_list =
{	-- 格式：{技能ID, 技能等级, 帮派ID, 所需级别, 技能书名称, 技能名称}
	[4040] = {	
		{1220, 20, 0, 150, "Thi誹 L﹎ M藅 T辌h", "Thi誹 L﹎ Th蕋 Truy襫 - Kim Quy猲 La H竛"},
	},
	[4039] = {	
		{1221, 20, 1, 150, "Thi猲 Vng M藅 T辌h", "Thi猲 Vng Th蕋 Truy襫 - Chinh Chi課 B竧 Phng"},
	},
	[4041] = {	 
		{1223, 20, 2, 150, "Л阯g M玭 M藅 T辌h ", "Л阯g M玭 Th蕋 Truy襫 - H蕄 Tinh Tr薾"},
	},
	[4042] = {	 
		{1222, 20, 3, 150, "Ng� чc M藅 T辌h", "Ng� чc Th蕋 Truy襫 - S﹎ La чc H秈"},
	},
	[4043] = {	 
		{1224, 20, 4, 150, "Nga Mi M藅 T辌h", "Nga My Th蕋 Truy襫 - Ba La T﹎ Kinh"},
	},
	[4044] = {	 
		{1225, 20, 5, 150, "Th髖 Y猲 M藅 T辌h", "Th髖 Y猲 Th蕋 Truy襫 - Huy襫 B╪g V� T鴆"},
	},
	[4045] = {	 
		{1227, 20, 6, 150, "C竔 Bang M藅 T辌h", "C竔 Bang Th蕋 Truy襫 - � Y Quy誸"},
	},
	[4046] = {	 
		{1226, 20, 7, 150, "Thi猲 Nh蒼 M藅 T辌h", "Thi猲 Nh蒼 Th蕋 Truy襫 - Li謙 H醓 Ph蒼 Thi猲"},
	},
	[4047] = {	 
		{1228, 20, 8, 150, "V� ng M藅 T辌h ", "V� ng Th蕋 Truy襫 - Ch﹏ V� Th蕋 Ti謙"},
	},
	[4048] = {	 
		{1229, 20, 9, 150, "C玭 L玭 M藅 T辌h", "C玭 L玭 Th蕋 Truy襫 - Thi猲 Cng Kh蕋 K輓h"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- 不是指定门派
		Msg2Player("B筺 c莔 l蕐 "..list[index][5].."Nghi猲 c鴘 c� n鯽 ng祔, k誸 qu� c騨g kh玭g l躰h ng� 頲 g� ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- 但未到指定级别
		Msg2Player("B筺 c莔 l蕐 "..list[index][5].."Nghi猲 c鴘 c� n鯽 ng祔, k誸 qu� l躰h ng� r蕋 輙. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  c莔 "..list[index][5].."Nghi襫 t韎 ng蒻 lui, nh璶g c騨g kh玭g h鋍 頲 g� trong  ")
		return 1
	end
	
	-- 判断当前的物品是否为少林秘籍，是则先删除，后增加技能
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("H駓 B� Thi誹 L﹎ M藅 T辌h th蕋 b筰")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- 学会技能

	WriteLog(date("%H%M%S")..": T礽 kho秐:"..GetAccount()..", nh﹏ v藅:"..GetName()..", S� d鬾g: "..list[index][5].."Х h鋍 頲: "..list[index][6]);
	Msg2Player("Х h鋍 頲 k� n╪g "..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "Чi hi謕 mu鑞 h鋍 lo筰 k� n╪g n祇"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"в ta suy ngh� l筰", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
