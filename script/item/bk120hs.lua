Include("\\script\\global\\login_head.lua")

function main(nItemIdx)
-- dofile("script/item/bk120hs.lua")
if (GetTask(169) == 150)  and  (GetLevel() >= 120) then 
AddMagic(1364,20)
Msg2Player("C�c h� nghi�n c�u th�nh c�ng kinh th�, h�c ���c v� c�ng �o�t M�nh Ki�m c�a Hoa   S�n")
SetTask(169,151)
elseif  (GetLevel() < 120) then
Talk(1,"","<color=fire>��t c�p 120 tr� l�n m�i l�nh ng� ���c cu�n s�ch n�y<color>")
return 1
else 
Talk(1,"","Ch� c� �� t� Hoa S�n luy�n Ki�m m�i l�nh h�i ���c b� k�p n�y ho�c l� c�c h� �� l�nh h�i r�i!")
return 1
end
end 