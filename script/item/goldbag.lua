Include("\\script\\global\\login_head.lua")
function main(nItemIdx)
	dofile("script/item/goldbag.lua")

	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(DAY) ~= nDate ) then
			SetTask(DAY, nDate);
			SetTask(352,0);
		if (GetTask(352) <= 20) then
		SetTask(352,GetTask(352) + 1);		
			local m = random (5,45)
			n = GetLevel();
			AddOwnExp(n*m*30);
			local nExp = n*m*30;
			Msg2Player("<color=green>M� c�m nang Ho�ng Kim, nh�n ���c "..nExp .. " �i�m kinh nghi�m<color>");
		else
		Talk(1,"","<color=green>H�m nay �� m� �� 20 C�m nang Ho�ng Kim r�i, ng�y mai h�y m� ti�p<color>")
		end
		
	else	--Sau khi da set ngay

		if (GetTask(352) <= 20) then
			SetTask(352,GetTask(352) + 1)
			
			local m = random (5,45);
			n = GetLevel();
			AddOwnExp(n*m*30);
			local nExp = n*m*30;
			Msg2Player("<color=green>M� c�m nang Ho�ng Kim, nh�n ���c "..nExp .. " �i�m kinh nghi�m<color>");
		else
			Talk(1,"","<color=green>H�m nay �� m� �� 20 C�m nang Ho�ng Kim r�i, ng�y mai h�y m� ti�p<color>")
		end

	end
end 