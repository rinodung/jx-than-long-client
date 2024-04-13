Include("\\script\\skill\\param2string.lua")
function skillLevelData(magicName,skillLevel)	
	if(magicName == "attackspeed_v") then		
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "castspeed_v") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "fastwalkrun_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "physicsres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "poisonres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "coldres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "fireres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "lightingres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "fasthitrecover_v") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "stuntimereduce_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "poisontimereduce_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "freezetimereduce_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "fatallystrikeres_p") then
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "addphysicsdamage_p") then
		return Param2String(skillLevel*20,180*18,0)
	end
	if(magicName == "addphysicsmagic_v") then
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addpoisondamage_v") then
		
		return Param2String(10,10*skillLevel,10)
	end
	if(magicName == "addpoisonmagic_v") then
		return Param2String(10,10*skillLevel,10)
	end
	if(magicName == "addcolddamage_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addcoldmagic_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addfiredamage_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addfiremagic_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addlightingdamage_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "addlightingmagic_v") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "lifemax_v") then
		
		return Param2String(skillLevel*100,180*18,0)
	end
	if(magicName == "manamax_v") then
		
		return Param2String(skillLevel*100,180*18,0)
	end
	if(magicName == "lucky_v") then
		
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "expenhance_p") then
		
		return Param2String(skillLevel*10,180*18,0)
	end
	if(magicName == "lifereplenish_v") then
		
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "manareplenish_v") then
		
		return Param2String(skillLevel*2,180*18,0)
	end
	if(magicName == "lifemax_p") then
		
		return Param2String(skillLevel*5,180*18,0)
	end
	if(magicName == "manamax_p") then
		
		return Param2String(skillLevel*5,180*18,0)
	end
	if(magicName == "allres_p") then
	
		return Param2String(skillLevel*2,180*18,0)
	end
	
end

function GetSkillLevelData(levelname, data, level)	
	return skillLevelData(levelname,level)
end
