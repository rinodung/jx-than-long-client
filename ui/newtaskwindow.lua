
Include("\\ui\\taskui_master.lua");
Include("\\ui\\taskui_random.lua");
Include("\\ui\\taskui_world.lua");
Include("\\ui\\taskui_killer.lua");
Include("\\ui\\taskui_messenger.lua");
Include("\\ui\\taskui_partner_education.lua");
Include("\\ui\\taskui_partner_master.lua");
Include("\\ui\\taskui_partner_random.lua");
Include("\\ui\\taskui_wlls.lua");

Include("\\ui\\taskui_besttong.lua");

Include("\\ui\\taskui_tong_randomlingpai.lua");	--特殊任务令牌任务
Include("\\UI\\150skilltask\\taskui_150skill.lua")

--显示已经完成
AEXP_TASKDESCCOMPLETE = "<tab><pic=10>"
--显示正在执行
AEXP_TASKDESCWORKING = "<tab><pic=20>"
--显示祝贺语
AEXP_TASKDESCCOMPLETEALL = "<pic = 3>"
--显示支线任务的头
AEXP_TASKDESAUX = "<tab>"

-- VN_MODIFY_20060427
-- 关闭 闯关任务/武林联赛/信使的信息/同伴随机任务
-- 任务列表
--	[1]任务描述,	[2]任务分类(0:剧情, 1:任务, 2:事件),	[3]任务变量类型(0:玩家, 1:同伴),	[4]任务变量区间,	[5]是否强制显示图标,	[6]图标路径,	[7]显示回调函数
ARY_TASK =
{
--	  1,					2,	3,	4,											5,	6,															7
	{ "Long Ng� luy謓 th鴆",			0,	0,	{ {1000,1000} },							0,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_tutor.spr",	"showpasstaskdesc_tutor" },
	{ "B� m藅 T莔 Long h閕",		0,	0,	{ {1001,1001}, {1050,1053} },				0,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_zheng.spr",	"showpasstaskdesc_zheng" },
	{ "C﹗ chuy謓 L﹎ Uy猲 Nhai",		0,	0,	{ {1002,1002}, {1054,1057} },				0,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_zhong.spr",	"showpasstaskdesc_zhong" },
	{ "Long kh� chi h鋋",			0,	0,	{ {1003,1003}, {1058,1061} },				0,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_xiepai.spr",	"showpasstaskdesc_xie" },
	{ "Nhi謒 v� D� T萿",			1,	0,	{ {1020,1037} },							1,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_task_001.spr",		"showrandraskdesc" },
	{ " Th� gi韎 ",			1,	0,	{ {1064,1068}, {1569, 1569}, {1661,1710} },	1,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_shijie.spr",	"showworldtaskdesc" },
	{ "Nhi謒 v� S竧 th� ",			1,	0,	{ {1082,1082} },							1,	"\\spr\\ui3\\新任务系统\\任务图标\\juanzhou_icon_025.spr",	"showkillertaskdesc" },
	{ "Th竎h th鴆 th阨 gian",			1,	0,	{ {1201,1225} },							1,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_bangpai.spr",	"showmessengerdesc" },
--	{ "同伴教育修炼任务",	1,	0,	{ {1226,1246} },							0,	"\\spr\\ui3\\新任务系统\\任务图标\\teshu_icon_027.spr",		"showpartnerdesc" },
--	{ "同伴剧情任务",		1,	1,	{ {3,80} },									0,	"\\spr\\ui3\\新任务系统\\任务图标\\teshu_icon_027.spr",		"showpartnermaster" },
	{ "V� l﹎ li猲 u",			1,	0,	{ {1715,1735} },							1,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_quest_menpai.spr",	"showbwtaskdesc" },
	{ "Nhi謒 v� ng蓇 nhi猲",       2,  0,  { {1301,1306} },							1,  "\\spr\\ui3\\新任务系统\\任务图标\\icon_task_001.spr",      "show_partner_randomdesc" },
	{ "Thi猲 H� е Nh蕋 Bang",			1,	0,	{ {1,2} },							1,	"\\spr\\ui3\\新任务系统\\任务图标\\icon_task_001.spr",	"showbwtaskbesttong" },
	{ "Nhi謒 v� L謓h b礽 nhi謒 v� c bi謙",       2,  0,  { {1744,1746} },							1,  "\\spr\\ui3\\新任务系统\\任务图标\\juanzhou_icon_025.spr",      "show_tong_lingpaidesc" },
	--{ "Nhi謒 v� k� n╪g c蕄 150",			0,  0,  { {2885,2885}},                 						1,  "\\spr\\ui3\\新任务系统\\任务图标\\icon_task_001.spr",	"show_150skill_taskinfo"},
};

-- 任务总数
g_nTaskCount = getn(ARY_TASK);	
	

-- 任务面板初始化时调用
function newtaskmain()
	for i = 1, g_nTaskCount do
		local sCurTask = ARY_TASK[i];
		if (sCurTask[5] == 1 or _isInTask(i) == 1) then
			NewTask_AddIcon(sCurTask[2], sCurTask[6], i);
		end
	end
end

-- 对外输出 给鼠标添加tip
function newtaskmousetip(nTaskIdx)
	NewTask_ChangeMouseTip(ARY_TASK[nTaskIdx][1]);
end

-- 显示描述的函数，根据传入ID来进行不同的解析
function newtaskrequestinfo(nTaskIdx)
	dostring(ARY_TASK[nTaskIdx][7].."("..nTaskIdx..", "..ARY_TASK[nTaskIdx][2]..")");
end

-- 玩家任务变量改变时调用的函数
function taskvaluechange(nTaskValueID, nTaskValue)
	local nTaskIdx = _findTaskByTaskValueID(0, nTaskValueID);
	if (nTaskIdx > 0) then
		NewTask_AddIcon(ARY_TASK[nTaskIdx][2], ARY_TASK[nTaskIdx][6], nTaskIdx);
		NewTask_ShowTask(ARY_TASK[nTaskIdx][2], nTaskIdx);
	end
end

-- 当同伴任务变量改变时调用此过程
function partnertaskvaluechange(nPartnerIdx, nTaskValueID, nTaskValue)
	if (nPartnerIdx ~= PARTNER_GetCurPartner()) then
		return
	end
	local nTaskIdx = _findTaskByTaskValueID(1, nTaskValueID);
	if (nTaskIdx > 0) then
		NewTask_AddIcon(ARY_TASK[nTaskIdx][2], ARY_TASK[nTaskIdx][6], nTaskIdx);
		NewTask_ShowTask(ARY_TASK[nTaskIdx][2], nTaskIdx);
	end
end

-- 判断是否已接了指定任务
function _isInTask(nTaskIdx)
	local nTaskValRangeCount = getn(ARY_TASK[nTaskIdx][4]);
	for i = 1, nTaskValRangeCount do
		local aryCurTaskValRange = ARY_TASK[nTaskIdx][4][i];
		for j = aryCurTaskValRange[1], aryCurTaskValRange[2] do
			local nTaskVal;
			if (ARY_TASK[nTaskIdx][3] == 0) then
				nTaskVal = GetTask(j);
			elseif (ARY_TASK[nTaskIdx][3] == 1) then
				local nCurPartnerIdx = PARTNER_GetCurPartner();
				if (nCurPartnerIdx > 0) then
					nTaskVal = PARTNER_GetTaskValue(nCurPartnerIdx, j);
				end
			end
			if (nTaskVal ~= nil and nTaskVal ~= 0) then
				return 1
			end
		end
	end
	
	return 0
end

-- 获取指定任务变量是属于哪个任务的
function _findTaskByTaskValueID(nTaskValueType, nTaskValueID)
	for i = 1, g_nTaskCount do
		local sCurTask = ARY_TASK[i];
		if (sCurTask[3] == nTaskValueType) then
			local nTaskValRangeCount = getn(sCurTask[4]);
			for j = 1, nTaskValRangeCount do
				local aryCurTaskValRange = sCurTask[4][j];
				if (aryCurTaskValRange[1] <= nTaskValueID and nTaskValueID <= aryCurTaskValRange[2]) then
					return i
				end
			end
		end
	end
	return 0
end