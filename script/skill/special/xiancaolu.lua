function GetSkillLevelData(levelname, data, level)

if (levelname == "expenhance_p") then
	return Param2String(100*level,64800,0)
end;
if (levelname == "addskilldamage1") then
	return Param2String(0,100,0)
end;
str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
