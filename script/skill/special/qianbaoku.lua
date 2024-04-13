TAB_SKILL = {
	chejinfu =
	{
		physicsres_p 	= {50, -1,0}
	},
	chemufu =
	{
		poisonres_p 	= {50, -1,0}
	},
	cheshuifu =
	{
		coldres_p 	= {50, -1,0}
	},
	chehuofu =
	{
		fireres_p 	= {50, -1,0}
	},
	chetufu =
	{
		lightingres_p 	= {50, -1,0}
	},
}

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
