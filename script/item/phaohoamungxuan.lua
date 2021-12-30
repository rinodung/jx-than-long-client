Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

TSK_USED = 5019	-- 任务变量磚定
--1 ng祔 dc s� d鬾g 5 l莕 v藅 ph萴 Ti猲 Linh Кn - Modified by DinhHQ - 20111013
NDAILYTIME = 10

tbNSKT_star_happiness = {}

function main()
	

	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 s� d鬾g v藅 ph萴! Y猽 c莡 c蕄  tr猲 50 ")
		return 1
	end
	
	local tbAward = {
		{nExp_tl=1,nCount = 500000,},
		}
	local szFailMsg = format("M鏸 ng祔 m鏸 nh﹏ v藅 ch� c� th� s� d鬾g nhi襲 nh蕋   %d Ph竜 Hoa M鮪g Xu﹏, i ng祔 mai h穣 s� d鬾g ti誴",NDAILYTIME)	
	if PlayerFunLib:CheckTaskDaily(TSK_USED, NDAILYTIME, szFailMsg, "<") == 1 then
		PlayerFunLib:AddTaskDaily(TSK_USED, 1) 
		tbAwardTemplet:Give(tbAward, 1, {"ngusackettinh", "use_star_happiness"} )
		CastSkill(1175, 2)
		return 0
	end
	
	
	return 1
end