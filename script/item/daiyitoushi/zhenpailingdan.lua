-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一镇派灵丹
-- 食用后能提升１点技能点
-- 与镇派灵药共用变量，第一个Byte记录灵丹使用次数，第二个Byte记录灵药使用次数

-- Edited by 子非魚
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- “带艺投师”退出门派的标记
														--	 0：未申请转投门派或转投门派成功（与转职次数一起决定）；1：成功申请转投门派；
TSK_TOUSHI_COUNT			=	1883						-- “带艺投师”转职的次数

function main(nItemIdx)
--	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
--		Say("Xin l鏸, c玭g n╪g n祔 t筸 th阨  b� ng, th阨 gian m� l筰 s� oc th玭g b竜 sau ", 0);
--		return 1;
--	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 1);
	local str={
		"Nghi猲 c鴘 m閠 h錳 tr蕁 ph竔 linh n m� v蒼 kh玭g bi誸 c竎h s� d鬾g. (ch璦 chuy觧 m玭 ph竔 kh玭g th� s� d鬾g)",
		"V鮝 m韎 u鑞g xong tr蕁 ph竔 linh n c秏 th蕐 m閠 lu錸g sinh l鵦 ch箉 quanh ngi (T╪g 1 甶觤 k� n╪g)",
		"Tay c莔 l蕐 tr蕁 ph竔 linh n m� ph竧 hi謓 ra r籲g n� kh玭g c遪 t竎 d鬾g g� n鱝 ( s� d鬾g n s� l莕 gi韎 h筺 cao nh蕋)"
		}
	if(nTimes >= 15) then              	-- 使用次数已达到上限
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- 转投门派成功才可使用
		Msg2Player(str[1])
		return 1;
	else                            	-- 奖励1点技能点
		AddMagicPoint(1);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 1, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd MagicPoint 1 by ZhenPaiLingDan",
						"Tr蕁 ph竔 linh n",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
