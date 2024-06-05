if MODEL_GAMECLIENT ~= 1 then
	return
end

function OnClickIcon_0()
	LuckyTurntable_Open()
end

function OnClickIcon_1()
	local szScript = "\\script\\event\\bingo_machine\\bingo_machine_c.lua";
	Require(szScript);
	DynamicExecute(szScript, "BingoMachine:ApplyOpenWindon")
end

function OnClickIcon_2()
	local szScript = "\\script\\event\\bingo_machine\\bingo_machine_c.lua"
	Require(szScript);
	DynamicExecute(szScript, "BingoMachine:ApplyOpenShop")
end

function OnClickIcon_3()
end

function OnClickIcon_4()
end

function OnClickIcon_5()
end

function OnClickIcon_6()
end

function OnClickIcon_7()
end