Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")

function main(sel)
-- dofile("script/item/hsnvtt.lua");
Say("<color=cyan>Cu�n ph� ghi ch�p l�i c�c th�ng tin v� ph�i <color=water>Hoa S�n<color>, c�c �� t� m�i gia nh�p n�n t�m hi�u<color>",4,
	"V� tr� ��a l�/comi",
	"��c �i�m v� h�c/comi",
	"Nhi�m v� m�n ph�i/hsqu",
	"��ng/no"
	)
return 1		
end;
function comi()
Say("Ch�c n�ng n�y �ang ���c ho�n thi�n",0)
return 1
end

function hsqu()
Say("<color=cyan>Ph�n n�y ghi ch�p l�i c�c th�ng tin v� nhi�m v� ph�i <color=water>Hoa S�n<color>, c�c �� t� m�i gia nh�p n�n t�m hi�u<color>",9,
	"Nhi�m v� c�p 10/comi",
	"Nhi�m v� c�p 20/comi",
	"Nhi�m v� c�p 30/comi",
	"Nhi�m v� c�p 40/comi",
	"Nhi�m v� c�p 50/comi",
	"Nhi�m v� Tr�ng Ph�n/comi",
	"Nhi�m v� Xu�t S�/comi",
	"Nhi�m v� c�p 150/hs150",
	"��ng/no"
	)
return 1		
end;

function hs150()
Talk(6,"hsqu","<color=red>B��c 1<color>: <color=green>��n g�p <color=earth>L�nh H� Xung<color> nh�n nhi�m v� ��a Anh   H�ng Thi�p (<color=fire>Y�u c�u �� h�c b� ki�p c�p 120 m�i c� th� nh�n)<color>","<color=red>B��c 2<color>: <color=green>T�m g�p <color=earth>��o Nh�t Ch�n Nh�n<color> � n�i V� �ang<color>","<color=red>B��c 3<color>: <color=green>Quay v� ph�c m�nh <color=gold>Nam Cung L�o Gia<color> <color>",
	"<color=red>B��c 4<color>: <color=green>Mang th� ti�n c� cho <color=yellow>Nh�c Minh Phi<color> <color>","<color=red>B��c 5<color>: <color=green>Giao Anh H�ng L�nh cho <color=pink>Ti�p d�n ��i H�i V�   L�m<color> �� v�o tham chi�n <color>","<color=red>B��c 6<color>: <color=green>��nh b�i to�n b� cao th� m�n ph�i kh�c.Sau �� quay v� g�p <color=gold>Nam Cung L�o Gia<color> ho�n th�nh nhi�m v�.  <color=fire> N�u giao chi�n b� tr�ng th��ng, g�p Ti�p d�n ��i H�i �� v�o tham chi�n l�i t� ��u !")
return 1
end

function no()
return 1
end
