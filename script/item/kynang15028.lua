-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一 150级大乘秘籍
-- 右键点击使用，可提升150级熟练度技能到20级。

-- Edited by 子非魚
-- 2010/06/29 15:21

-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "Зy L� Cu鑞 S竎h M� T� C竎 Gi竜 Ph竔 Kh竎 Nhau c馻 V� Thu藅 Ti猲 Ti課, Sau Khi S� D鬾g S� L躰h Ng� Л頲 K� N╪g Cao Nh蕋");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
		[10] = {1369, 1384},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 28) then
			tinsert(tb_Desc, format("N﹏g C蕄:".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "K� N╪g Х Чt дn Cao Nh蕋 Kh玭g Th� N﹏g C蕄 Th猰 N鱝");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "L鵤 Ch鋘 K� N╪g в N﹏g C蕄");
	tinsert(tb_Desc, "K誸 Th骳 цi Tho筰/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 28) then
		return
	end
	
	if (ConsumeItem(3, 1, 6, 1, 4376, -1) == 1) then
		AddMagic(n_skillid, 28);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d",
				"Чi Th祅h B� K輕 150",
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
