Include("\\script\\global\\login_head.lua")

function main(nItemIdx)
-- dofile("script/item/bk180hs.lua")
if (GetTask(169) == 181)  and  (GetLevel() >= 180) then 
AddMagic(1369,20)
Msg2Player("C�c h� nghi�n c�u th�nh c�ng kinh th�, h�c ���c v� c�ng C�u Ki�m H�p Nh�t c�a   Hoa S�n")
SetTask(169,185)
elseif  (GetLevel() < 180) then
Talk(1,"","<color=fire>��t c�p 180 tr� l�n m�i l�nh ng� ���c cu�n s�ch n�y<color>")
return 1
else 
Talk(1,"","Ch� c� �� t� Hoa S�n luy�n Ki�m m�i l�nh h�i ���c b� k�p n�y ho�c l� c�c h� �� l�nh h�i r�i!")
return 1
end
end 