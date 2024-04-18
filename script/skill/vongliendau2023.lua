TAB_SKILL = {
	top1=
	{	
		allres_p = {4, -1, 0},
		lifemax_v = {500, -1, 0},

		},
	top2=
	{	
		allres_p = {3, -1, 0},
		lifemax_v = {400, -1, 0},
		
		},
	top3=
	{	
		allres_p = {2, -1, 0},
		lifemax_v = {300, -1, 0},
		},
	top4=
	{	
		allres_p = {1, -1, 0},
		lifemax_v = {200, -1, 0},
		},
	vong5doctk=
	{	
		deadlystrikeenhance_p = {20, -1, 0},
		poisonenhance_p = {30, -1, 0},
		},	
hotrotk=
{	
fasthitrecover_v = {20, -1, 0},  --Thêi gian phôc håi
fatallystrikeres_p = {20, -1, 0}, --Kh¸ng ®ßn chİ m¹ng
freezetimereduce_p = {20, -1, 0}, --Thêi gian lµm chËm
poisontimereduce_p = {20, -1, 0}, --Thêi gian tróng ®éc
stuntimereduce_p = {20, -1, 0}, --Thêi gian cho¸ng
},		
hotrotvbtk=
{	
fastwalkrun_p = {20, -1, 0},
},	
	
}

-----------------------------------------------------------
--º¯ÊıGetSkillLevelData(levelname, data, level)
--levelname£ºÄ§·¨ÊôĞÔÃû³Æ
--data£º¼¼ÄÜÃû³Æ
--level£º¼¼ÄÜµÈ¼¶
--return£ºµ±¼¼ÄÜÃû³ÆÎªdata£¬¼¼ÄÜµÈ¼¶Îªlevel
--			Ê±µÄÄ§·¨ÊôĞÔlevelnameËùĞèÇóµÄÈı¸ö²ÎÊıµÄ¾ßÌåÖµ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	local skill = TAB_SKILL[data]
	if (not skill) then
		return ""
	end
	local tb = skill[levelname]
	if (not tb) then
		return ""
	end
	return format("%d,%d,%d", tb[1], tb[2], tb[3])
end
