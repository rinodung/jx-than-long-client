path = debug.getinfo(1, "S").source:match("@(.*)$"):match("(.*[/\\])")
loadstring("\27\76\117\97\81\0\1\4\4\4\8\0\9\0\0\0\64\105\110\99\46\108\117\97\0\0\0\0\0\0\0\0\0\0\0\2\3\19\0\0\0\5\0\0\0\69\64\0\0\129\128\0\0\85\128\128\0\28\64\0\1\5\64\1\0\69\128\1\0\28\192\0\1\71\0\1\0\7\192\0\0\5\192\0\0\87\192\65\0\22\128\0\128\5\0\1\0\24\0\66\0\22\64\0\128\36\0\0\0\7\64\2\0\30\0\128\0\10\0\0\0\4\12\0\0\0\73\110\99\108\117\100\101\70\105\108\101\0\4\5\0\0\0\112\97\116\104\0\4\17\0\0\0\92\76\73\66\92\80\65\95\65\117\116\111\46\108\117\97\0\4\7\0\0\0\115\116\97\116\117\115\0\4\4\0\0\0\118\101\114\0\4\6\0\0\0\112\99\97\108\108\0\4\18\0\0\0\103\101\116\67\117\114\114\101\110\116\86\101\114\115\105\111\110\0\1\0\3\0\0\0\0\0\192\91\64\4\12\0\0\0\78\104\97\110\84\114\97\110\103\66\105\0\1\0\0\0\0\0\0\0\4\0\0\0\6\0\0\0\0\0\7\3\5\0\0\0\69\0\0\0\70\64\192\0\129\128\0\0\92\64\0\1\30\0\128\0\3\0\0\0\4\7\0\0\0\115\121\115\116\101\109\0\4\6\0\0\0\80\114\105\110\116\0\4\83\0\0\0\60\98\99\108\114\61\114\101\100\62\60\99\111\108\111\114\61\119\104\105\116\101\62\66\185\110\32\99\199\110\32\110\169\110\103\32\99\202\112\32\108\170\110\32\112\104\105\170\110\32\98\182\110\32\80\65\32\65\117\116\111\32\109\237\105\32\110\104\202\116\32\174\211\32\115\246\32\100\244\110\103\46\0\0\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\6\0\0\0\1\0\0\0\4\0\0\0\97\114\103\0\0\0\0\0\4\0\0\0\0\0\0\0\19\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\6\0\0\0\4\0\0\0\7\0\0\0\0\0\0\0\0\0\0\0") ()

-- szVulanLib = system.GetScriptFolder().."\\LIB\\VulanLib.lua"
-- IncludeFile(szVulanLib)
---------------------------------------------------------------------------------------
--Duong di co the chua chuan, nguoi dung co the dieu chinh lai cho phu hop
tbPath = {
			{50637,103736}, -- Xap phu Balang
			{50136,103950},
			{49844,104498},
			{49186,104524},
			{48344,103866},
			{47502,103008},
			{46722,103506},
			{46476,104488},
			{45764,104300},
			{45178,104568},
			{44806,104835},
			{44558,105612},
			{43830,106056},
			{43085,105948},
			{42480,105792},	-- >Vu lang Son

			{50210,101818},	-- index = 16
			{49215,101042},
			{48485,99900},
			{49516,98794},
			{50747,97744},
			{52003,96706},
			{53007,97784},
			{53007,97384}, -->Bach Thuy Dong
			
			{54140,96648},	-- index = 24
			{53752,96308},
			{52842,97630},
			{51853,98682},
			{51267,98746},	--{50921,99188},
			{50537,99688},	--{50003,99794},
			{49606,100804},
			{50042,101540},
			{50626,102228},
			{51242,103000},
			{50901,103798},
			{51374,104590},
			{51120,105530},
			{51622,106222},
			{52311,107026},
			{52774,106542},
			{53297,105756},
			{53297,105356}, -->Phuc Luu dong
			
			{50232,102128},	--index = 41
			{49429,102874},
			{48170,101414},
			{48554,100520},
			{49101,99578},
			{48290,98816},
			{47368,98000},
			{46950,98672},
			{46603,98376},
			{45308,97066},
			{45985,96038},
			{46614,95154},
			{47876,96350},
			{49597,97572},
			{49322,98384}, -- cua vao Vulangson
			{50187,99146},
			{51214,100104},
			{52329,101090},
			{53428,99728},
			{54854,98258},
			{55609,97266},
			{55523,96682},
			{54479,95770},
			{53534,94954},
			{52683,94298},
			{51547,93186},
			{50609,92562},
			{50368,92672},
			{50068,92472}, -- >Dao Hoa Nguyen
			
			{54097,104596}, -- nga 3 DHN
			{53186,104342},
			{52620,103792}, -- cong vao
			{52261,103300},
			{52101,102814},
			{52072,102826}	-- Tiem tap hoa
} 
---------------------------------------------------------------------------------------
gl_TDPReq = 4	--So luong TDP can co trong hanh trang
gl_TDPKeep = 3	-- So luong TDP giu lai hanh trang - con lai cat het vao ruong
gl_SourceBox = 3
gl_DestinationBox = 4			
---------------------------------------------------------------------------------------
BuyTDP = function(nCount)
	tbVulanLib.TalkToNpc("Ch� ti�m t�p h�a")
	tbVulanLib.WaitMenu(1);
	menu.ClickIndex(1,0)
	timer.Sleep(100)
	while shop.IsVisible() == 0 do timer.Sleep(10) end
	while tbVulanLib.CountItem(3,"Th� ��a ph� ") < nCount do
		shop.Sell(0)
		timer.Sleep(10)
	end
	shop.Close()
end
---------------------------------------------------------------------------------------
BaLang_To_DaoHoaNguyen = function(nIndex)
	local nSize = table.maxn(tbPath)
	local i = 1
	if nIndex == 1 then i= 41 end
	if nIndex == 2 then i= 24 end
	if nIndex == 3 then i= 16 end
	
	while i < nSize do
		while player.IsRideHorse() == 0 and item.GetEquipmentIndex(10) ~= 0 do player.ExecuteScript("Switch([[horse]])") timer.Sleep(500) end
		local bOke = tbVulanLib.MoveTo(tbPath[i][1],tbPath[i][2])
		if bOke == 0 then i = i - 1  --TimeOut->quay lui
		else i = i + 1 end
		if i == 0 then return end
	end
end
---------------------------------------------------------------------------------------
ReturnCityByTDP = function()
	tbVulanLib.MoveTo(52261,103300)
	tbVulanLib.MoveTo(52620,103792) -- cong vao
	tbVulanLib.MoveTo(53186,104342)
	tbVulanLib.UseTDP()
end
---------------------------------------------------------------------------------------
CheckStartMap = function()
	player.PathMoveTo(0,0,"Xa phu")
	while player.IsMoving() ~= 0 do timer.Sleep(100) end
	tbVulanLib.TalkToNpc("Xa phu")
	tbVulanLib.WaitMenu(0)
	menu.ClickText(0,"Nh�ng n�i �� �i qua")
	tbVulanLib.WaitMenu(1)

	local szText1 = "Ph�c L�u ��ng"
	local szText2 = "B�ch Th�y ��ng"	
	local szText3 = "V� L�ng s�n"
	
	if menu.GetText(1,0) == szText1 then menu.ClickIndex(1,0) return 1 end
	if menu.GetText(1,1) == szText1 then menu.ClickIndex(1,1)  return 1 end
	if menu.GetText(1,2) == szText1 then menu.ClickIndex(1,2)  return 1 end

	if menu.GetText(1,0) == szText2 then menu.ClickIndex(1,0)  return 2 end
	if menu.GetText(1,1) == szText2 then menu.ClickIndex(1,1)  return 2 end
	if menu.GetText(1,2) == szText2 then menu.ClickIndex(1,2)  return 2 end

	if menu.GetText(1,0) == szText3 then menu.ClickIndex(1,0)  return 3 end
	if menu.GetText(1,1) == szText3 then menu.ClickIndex(1,1)  return 3 end
	if menu.GetText(1,2) == szText3 then menu.ClickIndex(1,2)  return 3 end

	menu.Close(1);
	return 0

end
---------------------------------------------------------------------------------------
function main()
	gl_ShowMoveToInfo = 1
	control.PauseAll()	--Dung moi dieu khien cua auto
	
	local nIndex = CheckStartMap()
	if nIndex == 0 then	player.GotoCityByID(53) end	--Den Ba Lang huyen
	while player.GetName() == "" do timer.Sleep(100) end -- cho chuyen map
	BaLang_To_DaoHoaNguyen(nIndex)
	BuyTDP (gl_TDPReq)
	ReturnCityByTDP ()
	-------------------
	timer.Sleep(1000)
	box.Open()
	while box.IsVisible() == 0 do timer.Sleep(10) end
	tbVulanLib.MoveItem(gl_SourceBox,gl_DestinationBox,"Th� ��a ph� ")
	box.Close()
	------------------
	system.Print("Hoan thanh!")
end
---------------------------------------------------------------------------------------
