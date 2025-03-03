-- 技能
IncludeLib("SETTING");
Include("\\script\\global\\login_head.lua")
-- ItemParticular={MagicID,IniLevel, NeedFaction, BookName, SkillName}
local faction_skill_list = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
	[10] = {[90] = {1364, 1382}, [120] = {1365}, [150] = {1369, 1384},},
}

sbook_list =
{	-- 格式：{技能ID, 技能等级, 帮派ID, 所需级别, 技能书名称, 技能名称}
	[27] = {302, 1, 2, 80, "'T� Ti詎 thu藅. B筼 V� L� Hoa' ",	"B筼 V� L� Hoa"},
	[28] = {351, 0, 2, 80, "'H穖 T躰h thu藅. Lo筺 Ho祅 K輈h' ",	"Lo筺 Ho祅 K輈h"},
	[33] = {365, 1, 8, 80, "Th竔 C鵦 Quy襫 Ph�- Quy觧 3 ",	"Thi猲 мa V� C鵦 "},
	[34] = {368, 1, 8, 80, "'Th竔 C鵦 Ki誱 Ph�. Quy觧 2' ",	"Nh﹏ Ki誱 H頿 Nh蕋  "},
	[35] = {361, 1, 7, 80, "'V﹏ Long K輈h. M﹗ ph竝' ",		"V﹏ Long K輈h"},
	[36] = {362, 1, 7, 80, "'L璾 Tinh. o ph竝' ",		"Thi猲 Ngo筰 L璾 Tinh"},
	[37] = {325, 1, 1, 80, "'Thi猲 Vng Ch飝 Ph竝. Quy觧 1' ",	"Truy Phong Quy誸 "},
	[38] = {323, 1, 1, 80, "Thi猲 Vng Thng ph竝- Quy觧 2 ", 	"Truy Tinh Tr鬰 Nguy謙 "},
	[39] = {322, 1, 1, 80, "Thi猲 Vng o ph竝 - Quy觧 3 ",	"Ph� Thi猲 Tr秏 "},
	[40] = {336, 1, 5, 80, "'Th髖 Y猲 o ph竝' ",			"B╪g Tung V� 秐h "},
	[41] = {337, 1, 5, 80, "'Th髖 Y猲 Song 產o' ",			"B╪g T﹎ Ti猲 T�  "},
	[42] = {328, 1, 4, 80, "'Di謙 Ki誱 M藅 T辌h' ",			"Tam Nga T� Tuy誸 "},
	[43] = {380, 1, 4, 80, "'Nga Mi Ph藅 Quang Chng M藅 T辌h' ",	"Phong Sng To竔 秐h "},
	[45] = {339, 1, 2, 80, "'Phi o thu藅. Nhi誴 H錸 Nguy謙 秐h' ",	"Nhi誴 H錸 Nguy謙 秐h"},
	[46] = {342, 1, 2, 80, "'Phi Ti猽 thu藅. C鰑 Cung Phi Tinh' ",	"C鰑 Cung Phi Tinh"},
	[47] = {353, 1, 3, 80, "'Ng� чc Chng Ph竝. Quy觧 1' ",	" Phong Th鵦 C鑤 "},
	[48] = {355, 1, 3, 80, "'Ng� чc o ph竝. Quy觧 2' ",	"Huy襫  Tr秏 "},
	[49] = {390, 0, 3, 80, "'Ng� чc Nhi誴 T﹎ thu藅. Quy觧 3' ",	"筺 C﹏ H� C鑤 "},
	[50] = {372, 1, 9, 80, "'Ng� Phong thu藅' ",			"Ng筼 Tuy誸 Ti猽 Phong "},
	[51] = {375, 1, 9, 80, "'Ng� L玦 thu藅' ",			"L玦 ng C鰑 Thi猲 "},
	[52] = {394, 0, 9, 80, "'Ng� T﹎ thu藅' ",			"T髖 Ti猲 T� C鑤"},
	[53] = {391, 0, 7, 80, "Nhi誴 H錸 - Trc Ch� ",		"Nhi誴 H錸 Lo筺 T﹎ "},
	[54] = {357, 1, 6, 80, "'C竔 Bang Chng Ph竝' ",			"Phi Long T筰 Thi猲 "},
	[55] = {359, 1, 6, 80, "C竔 Bang C玭 Ph竝 ",			"Thi猲 H� V� C萿 "},
	[56] = {318, 1, 0, 80, "'Thi誹 L﹎ Quy襫 Ph竝. Quy觧 1' ",	"Чt Ma ч Giang"},
	[57] = {319, 1, 0, 80, "'Thi誹 L﹎ C玭 ph竝. Quy觧 2' ",	"Ho祅h T秓 Thi猲 Qu﹏"},
	[58] = {321, 1, 0, 80, "'Thi誹 L﹎ o ph竝. Quy觧 3' ",	"V� Tng Tr秏 "},
	[59] = {332, 0, 4, 80, "'Ph� ч M藅 T辌h' ",			"Ph� ч Ch髇g Sinh "},
	[4062] = {1364, 1, 10, 80, "'Hoa S琻 Ki誱 T玭g-箃 m謓h li猲 ho祅 tam ti猲 ki誱' ",			"箃 M謓h Li猲 Ho祅 Tam Ti猲 Ki誱"},
	[4063] = {1382, 1, 10, 80, "'Hoa S琻 Kh� T玭g-B輈h Th筩h Ph� Ng鋍' ",			"Ph竎h Th筩h Ph� Ng鋍"},
}

function CheckIsCanGet150SkillTask()
		--M� nhi謒 v� nh薾 k� n╪g 150 - Modified By NgaVN - 20121207
	local nValue = GetTask(2885)
	if nValue > 0 then
		return
	end
	--Ch豱h s鯽 nh薾 nv k� n╪g 150 ph秈 tr飊g sinh 2 tr� l猲 - Modified By NgaVN - 20121207
	--local nTransLife = ST_GetTransLifeCount()
	--local nHaveTSFlag = 0;
	--if(nTransLife > 1 ) then
		--nHaveTSFlag = 1
	--end
	
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 10 then
		return
	end
	local tb90Skill = %faction_skill_list[nFact][90]
	local nHave90SkillFlag = 0
	for i = 1, getn(tb90Skill) do
		if HaveMagic(tb90Skill[i]) >= 0 then
			nHave90SkillFlag = 1 
			break
		end
	end
	local tb120Skill = %faction_skill_list[nFact][120]
	local nHave120SkillFlag = 0
	for i = 1, getn(tb120Skill) do
		if HaveMagic(tb120Skill[i]) >= 0 then
			nHave120SkillFlag = 1 
			break
		end
	end
	local tb150Skill = %faction_skill_list[nFact][150]
	local nHave150SkillFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			nHave150SkillFlag = 1 
			break
		end
	end 
	if nHave150SkillFlag == 0 then
		if  nHave90SkillFlag == 1 and nHave120SkillFlag == 1 and GetLevel() >= 150 then
			Msg2Player("<color=yellow>B﹜ gi� ngi c� th� nh薾 nhi謒 v� k� n╪g c蕄 150 <enter>")
		else
			local szMsg = "Ngi mu鑞 nh薾 nhi謒 v� k� n╪g 150 c莕 ph秈"
			local nFlag = 0
			
			if nHave90SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s h鋍 頲 k� n╪g c蕄 90", szMsg) 
				nFlag = 1
			end
			if nHave120SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s h鋍 頲 k� n╪g c蕄 120", szMsg) 
				nFlag = 1
			end
			
			---Ch豱h s鯽 nh薾 nv k� n╪g 150 ph秈 tr飊g sinh 2 tr� l猲 - Modified By NgaVN - 20121207
			--if nHaveTSFlag == 0 then
				--if nFlag == 1 then
					--szMsg = format("%s,", szMsg) 
				--end
				--szMsg = format("%s Tr飊g sinh 2 tr� l猲", szMsg) 
				--nFlag = 1
			--end
			
			if GetLevel() < 150 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s t n c蕄 150", szMsg) 
				nFlag = 1
			end
			szMsg = format("<color=yellow>%s<color>", szMsg)
			Msg2Player(szMsg)
		end
	end
end

function LearnSkillByBook(index, list)

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

	AddMagic(list[index][1], list[index][2])										-- 学会技能
	
	CheckIsCanGet150SkillTask()

	WriteLog(date("%H%M%S")..": T礽 kho秐:"..GetAccount()..", nh﹏ v藅:"..GetName()..", S� d鬾g: "..list[index][5].."Х h鋍 頲: "..list[index][6]);
	Msg2Player("Х h鋍 頲 k� n╪g "..list[index][6].."'. ")
	return 0

end

function main(sel)
	Genre, DetailType, Particular=GetItemProp(sel)
	return LearnSkillByBook(Particular, sbook_list);
end

--M� nhi謒 v� nh薾 k� n╪g 150 - Modified By NgaVN - 20121207
if login_add then login_add(CheckIsCanGet150SkillTask, 2) end