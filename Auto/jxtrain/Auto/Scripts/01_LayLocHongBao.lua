path = debug.getinfo(1, "S").source:match("@(.*)$"):match("(.*[/\\])")
loadstring("\27\76\117\97\81\0\1\4\4\4\8\0\9\0\0\0\64\105\110\99\46\108\117\97\0\0\0\0\0\0\0\0\0\0\0\2\3\19\0\0\0\5\0\0\0\69\64\0\0\129\128\0\0\85\128\128\0\28\64\0\1\5\64\1\0\69\128\1\0\28\192\0\1\71\0\1\0\7\192\0\0\5\192\0\0\87\192\65\0\22\128\0\128\5\0\1\0\24\0\66\0\22\64\0\128\36\0\0\0\7\64\2\0\30\0\128\0\10\0\0\0\4\12\0\0\0\73\110\99\108\117\100\101\70\105\108\101\0\4\5\0\0\0\112\97\116\104\0\4\17\0\0\0\92\76\73\66\92\80\65\95\65\117\116\111\46\108\117\97\0\4\7\0\0\0\115\116\97\116\117\115\0\4\4\0\0\0\118\101\114\0\4\6\0\0\0\112\99\97\108\108\0\4\18\0\0\0\103\101\116\67\117\114\114\101\110\116\86\101\114\115\105\111\110\0\1\0\3\0\0\0\0\0\192\91\64\4\12\0\0\0\78\104\97\110\84\114\97\110\103\66\105\0\1\0\0\0\0\0\0\0\4\0\0\0\6\0\0\0\0\0\7\3\5\0\0\0\69\0\0\0\70\64\192\0\129\128\0\0\92\64\0\1\30\0\128\0\3\0\0\0\4\7\0\0\0\115\121\115\116\101\109\0\4\6\0\0\0\80\114\105\110\116\0\4\83\0\0\0\60\98\99\108\114\61\114\101\100\62\60\99\111\108\111\114\61\119\104\105\116\101\62\66\185\110\32\99\199\110\32\110\169\110\103\32\99\202\112\32\108\170\110\32\112\104\105\170\110\32\98\182\110\32\80\65\32\65\117\116\111\32\109\237\105\32\110\104\202\116\32\174\211\32\115\246\32\100\244\110\103\46\0\0\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\5\0\0\0\6\0\0\0\1\0\0\0\4\0\0\0\97\114\103\0\0\0\0\0\4\0\0\0\0\0\0\0\19\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\2\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\3\0\0\0\6\0\0\0\4\0\0\0\7\0\0\0\0\0\0\0\0\0\0\0") ()
-- szVulanLib = system.GetScriptFolder().."\\LIB\\VulanLib.lua"
-- IncludeFile(szVulanLib)
-----------------------------------------------------------------
nHongBao = 0 -- S�  H�ng Bao c�n l�y
bLocHongBao = 1 -- C� l�c H�ng Bao kh�ng?
-----------------------------------------------------------------
-- Danh s�ch c�c item s� s� d�ng (C� th� th�m ho�c b�t c�c item kh�c)
tbUseItemList  = {
	"Bang H�i th�n m�t h�ng bao",
	"Ph�c Duy�n L� (Trung) ",
	"Ph�c Duy�n L� (Ti�u) ",
	"Thi�n s�n  B�o L� ",
	"B�ch Qu� L� ",
--	"Ti�n Th�o L� ",
	"Ph�c Duy�n L� (��i) "
}

-- Danh s�ch c�c item s� ���c b�n sau khi m� ra (C� th� th�m ho�c b�t c�c item kh�c)
tbSell_ItemList = {
	"Phi Phong",
	"Kim Phong Thanh D��ng Kh�i", -- B�n trang b� Kim Phong
	"Kim Phong K� L�n Huy�t",
	"Kim Phong �o�t H�n Ng�c ��i",
	"Kim Phong Thi�n L� Th�o Th��ng Phi",
	"Kim Phong H�u Ngh� d�n cung",
	"Kim Phong Tr�c Li�n Quang",
	"Kim Phong Lan ��nh Ng�c",
	"Kim Phong ��ng T��c Xu�n Th�m",
	"Kim Phong C�ng C�n Tam Th�n",
	"Thi�n Ho�ng Long Long ��i", -- B�n trang b� Thi�n Ho�ng
	"Thi�n Ho�ng Long B�ch Long T�c",
	"Thi�n Ho�ng Long Ng�c Ti�u Di�u",
	"Thi�n Ho�ng Long Kh�c Thi�n L�",
	"Thi�n Ho�ng Long Ho�ng Kim L�n",
	"Thi�n Ho�ng Long Tr�n Minh Li�n",
	"Thi�n Ho�ng Long B�n Long c�i",
	"Thi�n Ho�ng Long N� Long ��ng",
	"Thi�n Ho�ng Long C�u Hi�n ch�",
--	"��nh Qu�c � Sa Ph�t Qu�n", -- B�n 1 s� trang b� ��nh Qu�c
--	"��nh Qu�c Thanh Sa Tr��ng Sam",
	"��nh Qu�c T� ��ng H� uy�n",
	"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",
	"��nh Qu�c Ng�n T�m Y�u ��i"
}
-----------------------------------------------------------------
-- H�m l�c H�ng Bao
Open_Sell_Items = function()

	for i, v in pairs(tbUseItemList) do
		tbVulanLib.UseAllItem(v)
	end
	
	for i, k in pairs(tbSell_ItemList) do
		tbVulanLib.SellAllItem(k)
	end
end
-----------------------------------------------------------------

-- H�m l�y + l�c H�ng Bao
LayHongBao = function()
	-- N�u �� thi�t l�p s� H�ng Bao kh�c 0 th� s� l�y ��ng s� �� thi�t l�p
	if nHongBao > 0 then
		for i = 1, nHongBao do
			tbVulanLib.TalkToNpc("T�ng qu�n L� ph�m ph��ng")
			tbVulanLib.WaitMenu(1)
			menu.ClickIndex(1,0)
			while menu.IsVisible(1) == 0 do  timer.Sleep(10) end
			menu.ClickIndex(1,0)
			timer.Sleep(10)
			if math.fmod(i, 10) == 0 and bLocHongBao == 1 then
				Open_Sell_Items ()
			end
		end
	-- N�u thi�t l�p nHongBao = 0 th� s� l�y ��n khi ��y h�nh trang ho�c bang h�i h�t H�ng Bao)
	else
		local nCount = 0
		while true do
			nCount = nCount + 1
			tbVulanLib.TalkToNpc("T�ng qu�n L� ph�m ph��ng")
			tbVulanLib.WaitMenu(1)
			menu.ClickIndex(1,0)
			while menu.IsVisible(1) == 0 do  timer.Sleep(10) end
			if system.MatchString(menu.GetTitle(1),"T�ng qu�n L� ph�m ph��ng: Th�t ��ng ti�c") == 1  then
				menu.ClickIndex(1,0)
				return
			end	

			menu.ClickIndex(1,0)
			timer.Sleep(10)
			if math.fmod(nCount, 10) == 0 and bLocHongBao == 1  then
				Open_Sell_Items ()
			end
		end
	end
end
-----------------------------------------------------------------

function main()
	-- N�u ��ng xa NPC "T�ng qu�n L� ph�m ph��ng" th� s� di chuy�n t�i
	player.PathMoveTo(0, 0, "T�ng qu�n L� ph�m ph��ng")
	timer.Sleep(1000)
	while player.GetDoingStatus() ~= 1 do timer.Sleep(100) end

	LayHongBao() -- L�y + l�c H�ng Bao
	Open_Sell_Items() --Loc them lan nua
	system.Print("�� ho�n th�nh!")
end