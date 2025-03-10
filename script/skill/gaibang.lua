-------------------------------------------------------------------------
-- FileName		:	gaibang.lua - C�i Bang
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/gaibang.lua
-------------------------------------------------------------------------

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end


SKILLS={	
	gaibang_bangfa={ --C�i Bang B�ng ph�p	H� tr� b� ��ng	115
		addphysicsdamage_p={{{1,10},{20,150}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		deadlystrikeenhance_p={{{1,2},{20,25,Conic}},{{1,-1},{2,-1}}}
	},
	gaibang_zhangfa={ --C�i Bang Ch��ng Ph�p	H� tr� b� ��ng	116
		addfiremagic_v={{{1,25},{20,275}},{{1,-1},{2,-1}}}
	},
	yanmen_tuobo={ --Di�n M�n Th�c B�t	C�ng k�ch ngo�i c�ng  	119
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,10},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,100}},
			[3]={{1,10},{20,150}}
		},
		addskilldamage1={
			[1]={{1,359},{2,359}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage2={
			[1]={{1,125},{2,125}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,32}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	jianren_shenshou={ --Ki�n Nh�n Th�n Th� 	C�ng k�ch n�i c�ng 	122
		seriesdamage_p={{{1,1},{20,10}}},
		firedamage_v={
			[1]={{1,15},{20,75}},
			[3]={{1,15},{20,215}}
		},
		addskilldamage1={
			[1]={{1,357},{2,357}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,128},{2,128}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage4={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,40}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	huabu_liushou={ --Ho�t B�t L�u Th� 11	Ch� ��ng h� tr� chi�n ��u	127
		fastwalkrun_p={{{1,9},{20,66}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,24},{20,50}}}
	},
	dagou_zhen={ --�� C�u b�ng	V�ng tr�n  h� tr� c�ng k�ch	124
		addphysicsdamage_p={{{1,10},{20,175}},{{1,-1},{30,-1}},{{1,2},{2,2}}},
		--skill_cost_v={{{1,24},{20,50}}}
	},
	xianglong_zhang={ --Gi�ng Long Ch��ng 	h� tr� chi�n ��u- b� ��ng	274
		lifemax_p={{{1,-0},{20,-0},{25,-0},{26,-0}},{{1,-1},{2,-1}}}, 
		manamax_p={{{1,12},{20,50}},{{1,-1},{2,-1}}},
		addfiremagic_v={{{1,35},{15,250},{20,750}},{{1,-1},{2,-1}}},
	},
	bangda_egou={ --B�ng �� �c C�u	C�ng k�ch ngo�i c�ng  	125	
		physicsenhance_p={{{1,10},{20,179}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,70},{20,360}},
			[3]={{1,70},{20,420}}
		},
		addskilldamage1={
			[1]={{1,359},{2,359}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,50}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,28},{20,48}}}
	},
	zuidie_kuangwu={ --T�y �i�p Cu�ng V� 	H� tr� ph�ng ng� - ch� ��ng	130
		allres_p={{{1,1},{30,30}},{{1,18*120},{30,18*180}}},
		addfiremagic_v={{{1,10},{30,215}},{{1,18*120},{30,18*180}}},
		addfiredamage_v={{{1,10},{30,175}},{{1,18*120},{30,18*180}}},
		deadlystrikeenhance_p={{{1,5},{20,30,Conic}},{{1,18*120},{30,18*180}}},
		lifemax_p={{{1,21},{35,20},{36,20}},{{1,-1},{30,-1}}},
		skill_cost_v={{{1,50},{20,100}}}
	},
	kanglong_youhui={ --Kh�ng Long H�u H�i	C�ng k�ch n�i c�ng 	128
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,10},{20,536}},
			[3]={{1,10},{20,536}}
		},
		addskilldamage1={
			[1]={{1,357},{2,357}},
			[3]={{1,1},{20,55}}
		},
		addskilldamage2={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage3={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,45}}
		},
		skill_misslesform_v={{{1,1},{10,1},{10,2},{20,2}}},
		skill_misslenum_v={{{1,1},{10,1},{20,15},{25,18},{26,18}}},
		skill_param1_v={{{1,0},{10,0},{10,2},{20,2},{21,2}}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,10},{20,50}}}
	},
	huaxian_weiyi={ --H�a Hi�m Vi Di	H� tr� ph�ng ng� - ch� ��ng	129	
		meleedamagereturn_p={{{1,4},{20,46}},{{1,-1},{20,-1}}},
		adddefense_v={{{1,48},{20,800}},{{1,-1},{20,-1}}},
	},
	xiaoyao_gong={ --Ti�u Di�u C�ng 	Ch� ��ng h� tr� c�ng k�ch	360
		attackspeed_v={{{1,6},{20,65},{25,90},{31,108},{32,118},{33,121}},{{1,-1},{20,-1}}},
		castspeed_v={{{1,6},{20,65},{25,90},{31,108},{32,118},{33,121}},{{1,-1},{2,-1}}},
		--bo sung stvl phien ban 15x
		addphysicsdamage_p={{{1,10},{20,120}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		deadlystrikeenhance_p={{{1,1},{20,20,Conic}},{{1,18*120},{20,18*180}}},
	},
	feilong_zaitian={ --Phi Long T�i Thi�n 	C�ng k�ch n�i c�ng 	357
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			-- [1]={{1,10},{15,300},{20,950}}, -- fix dame 1.3 > 1.4
			-- [3]={{1,10},{15,300},{20,950}}
			[1]={{1,14},{15,420},{20,1330}},
			[3]={{1,14},{15,420},{20,1330}}
		},
		addskilldamage1={
			[1]={{1,1073},{2,1073}},
			[3]={{1,1},{20,25}}
		},
		addskilldamage2={
			[1]={{1,1101},{2,1101}},
			[3]={{1,1},{20,25}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_misslesform_v={{{1,1},{11,1},{11,0},{20,0}}},
		skill_misslenum_v={{{1,1},{11,1},{12,2},{15,2},{16,3},{20,4},{21,4}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,10},{20,65}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,4},{2,4}},
--			[3]={{1,389},{20,389}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,389},{20,389}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(8600,1.15,1,1,1)},
							{2,SkillExpFunc(8600,1.15,2,1,1)},
							{3,SkillExpFunc(8600,1.16,3,1,1)},
							{4,SkillExpFunc(8600,1.17,4,1,1)},
							{5,SkillExpFunc(8600,1.18,5,1,1)},
							{6,SkillExpFunc(8600,1.19,6,2,1)},
							{7,SkillExpFunc(8600,1.20,7,2,1)},
							{8,SkillExpFunc(8600,1.21,8,2,1)},
							{9,SkillExpFunc(8600,1.22,9,2,1)},
							{10,SkillExpFunc(8600,1.23,10,2,1)},
							{11,SkillExpFunc(8600,1.24,11,2,1)},
							{12,SkillExpFunc(8600,1.23,12,2,1)},
							{13,SkillExpFunc(8600,1.22,13,2,1)},
							{14,SkillExpFunc(8600,1.21,14,2,1)},
							{15,SkillExpFunc(8600,1.20,15,3,1)},
							{16,SkillExpFunc(8600,1.19,16,3,1)},
							{17,SkillExpFunc(8600,1.18,17,3,1)},
							{18,SkillExpFunc(8600,1.17,18,3,1)},
							{19,SkillExpFunc(8600,1.16,19,3,1)},
							{20,SkillExpFunc(8600,1.15,20,4,1)},
						}},
	},
	zhanggaibang150={ --Th�i Th�ng L�c Long	C�ng k�ch n�i c�ng 	1073
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,24},{15,720},{20,1800},{23,3096},{26,3744}},
			[3]={{1,24},{15,720},{20,1800},{23,3096},{26,3744}}
		},
		missle_speed_v={{{1,24},{20,40},{21,40}}},
		skill_misslenum_v={{{1,1},{11,1},{12,2},{15,2},{16,2},{20,3},{21,3}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,12},{20,78},{23,98}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,4},{2,4}},
--			[3]={{1,389},{20,389}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1072},{20,1072}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	qianlong_zaiyuan={ --Ti�m Long T�i Uy�n	C�ng k�ch ngo�i c�ng  	358	
		seriesdamage_p={{{1,20},{20,60}}},
		firedamage_v={
			[1]={{1,17},{20,171}},
			[3]={{1,17},{20,171}}
		},
	},
	longzhan_yuye={ --Long Chi�n � D� 	C�ng k�ch ngo�i c�ng  	389
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		firedamage_v={
			-- [1]={{1,17},{20,471}}, -- fix dame 1.1 > 1.3
			-- [3]={{1,17},{20,471}}
			[1]={{1,22},{20,612}},
			[3]={{1,22},{20,612}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_collideevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,358},{20,358}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,4},{20,4}}},
	},
	zhanggaibang150_2={ --Ng� Di�u C�n Kh�n	C�ng k�ch n�i c�ng 	1072
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,20},{20,450},{23,585},{26,653}},
			[3]={{1,20},{20,450},{23,585},{26,653}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_collideevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,358},{20,358}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,4},{20,4}}},
	},
	tianxia_wugou={ --Thi�n H� V� C�u 	C�ng k�ch ngo�i c�ng  	359
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		skill_misslenum_v={{{1,1},{20,3},{21,3}}},
		-- physicsenhance_p={{{1,12},{15,100},{20,206}}}, fix dame 1.2 > 1.4
		physicsenhance_p={{{1,16},{15,140},{20,288}}},
		firedamage_v={
			-- [1]={{1,70},{15,150},{20,285}},  fix dame 1.2 > 1.4
			-- [3]={{1,70},{15,200},{20,432}}
			[1]={{1,98},{15,210},{20,399}},
			[3]={{1,98},{15,280},{20,604}}
		},
		addskilldamage1={
			[1]={{1,1074},{2,1074}},
			[3]={{1,1},{20,25}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,20},{20,50}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7000,1.15,1,1,1)},
							{2,SkillExpFunc(7000,1.15,2,1,1)},
							{3,SkillExpFunc(7000,1.16,3,1,1)},
							{4,SkillExpFunc(7000,1.17,4,1,1)},
							{5,SkillExpFunc(7000,1.18,5,1,1)},
							{6,SkillExpFunc(7000,1.19,6,1,1)},
							{7,SkillExpFunc(7000,1.20,7,1,1)},
							{8,SkillExpFunc(7000,1.21,8,1,1)},
							{9,SkillExpFunc(7000,1.22,9,1,1)},
							{10,SkillExpFunc(7000,1.23,10,1,1)},
							{11,SkillExpFunc(7000,1.24,11,1,1)},
							{12,SkillExpFunc(7000,1.23,12,1,1)},
							{13,SkillExpFunc(7000,1.22,13,1,1)},
							{14,SkillExpFunc(7000,1.21,14,2,1)},
							{15,SkillExpFunc(7000,1.20,15,2,1)},
							{16,SkillExpFunc(7000,1.19,16,2,1)},
							{17,SkillExpFunc(7000,1.18,17,3,1)},
							{18,SkillExpFunc(7000,1.17,18,3,1)},
							{19,SkillExpFunc(7000,1.16,19,3,1)},
							{20,SkillExpFunc(7000,1.15,20,3,1)},
						}},
	},
	gungaibang150={ --B�ng Hu�nh L��c ��a	C�ng k�ch ngo�i c�ng  	1074
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		skill_misslenum_v={{{1,1},{20,5},{21,5}}},
		physicsenhance_p={{{1,10},{15,80},{20,165},{23,267},{26,318}}},
		firedamage_v={
			[1]={{1,60},{15,120},{20,230},{23,362},{26,428}},
			[3]={{1,60},{15,160},{20,345},{23,567},{26,678}}
		},
		missle_speed_v={{{1,24},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,20},{20,50},{23,59}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	gaibang120={ --H�n Thi�n Kh� C�ng	h� tr� b� ��ng 	714
		autoattackskill={{{1,720*256 + 1},{20,720*256 + 20},{21,720*256 + 21}},{{1,-1},{20,-1}},{{1,12*18*256 + 1},{15,12*18*256 + 5},{20,12*18*256 + 6},{21,12*18*256 + 6}}},
		skill_desc=
			function(level)
				return "X�c su�t <color=orange>"..floor(Link(level,SKILLS.gaibang120.autoattackskill[3]) - 12*18*256).."%<color> g�y ho�i th��ng \n"..
				"Ho�i th��ng l�m gi�m <color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.physicsres_p[1]))..
				"%<color> PTVL, gi�m <color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.fireres_p[1]))..
				"%<color>,\n ��ng th�i l�m gi�m gi� tr� ph�ng th� v�t l� l�n nh�t <color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.physicsresmax_p[1]))..
				"%<color>,gi�m gi� tr� ph�ng h�a l�n nh�t <color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.fireresmax_p[1]))..
				"%<color> kh�ng h�a \n ��ng th�i ph�n ��n khi b� t�n c�ng t�m xa gi�m <color=orange>"..floor(-Link(level,SKILLS.gaibang120zuzhou.rangedamagereturn_p[1]))..
				"%<color> t�c �� di chuy�n trong <color=orange>"..floor(Link(level,SKILLS.gaibang120zuzhou.physicsres_p[2]) / 18).." gi�y<color>\n"..
				"Trong v�ng <color=orange>"..floor((Link(level,SKILLS.gaibang120.autoattackskill[3]) / (18*256))).." gi�y<color> sau m�i c� th� thi tri�n ti�p"
			end,
		skill_skillexp_v={{	
			{1,2000000000},
			{2,2000000000},
			{3,2000000000},
			{4,2000000000},
			{5,2000000000},
			{6,2000000000},
			{7,2000000000},
			{8,2000000000},
			{9,2000000000},
			{10,2000000000},
			{11,2000000000},
			{12,2000000000},
			{13,2000000000},
			{14,2000000000},
			{15,2000000000},
			{16,2000000000},
			{17,2000000000},
			{18,2000000000},
			{19,2000000000},
			{20,2000000000},
		}},	
		--skill_skillexp_v={{	
		--	{1,17851239},
		--	{2,19487603},
		--	{3,22760330},
		--	{4,27669421},
		--	{5,34214875},
		--	{6,42396694},
		--	{7,52214875},
		--	{8,63669421},
		--	{9,76760330},
		--	{10,91487603},
		--	{11,107851239},
		--	{12,135669421},
		--	{13,174942148},
		--	{14,225669421},
		--	{15,274418181},
		--	{16,344618181},
		--	{17,425738181},
		--	{18,517778181},
		--	{19,620738181},
		--	{20,620738181},
		--}},	
	},
	gaibang120zuzhou={ --H�n Thi�n Kh� C�ng_Quy�t Ch�	Ch� thu�t	720
		physicsres_p={{{1,-2},{15,-8},{20,-10},{21,-10}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		fireres_p={{{1,-3},{15,-12},{20,-15},{21,-15}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		physicsresmax_p={{{1,-1},{15,-1},{20,-4},{21,-4}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		fireresmax_p={{{1,-1},{15,-2},{20,-6},{21,-6}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		--meleedamagereturn_p={{{1,-4},{15,-16},{20,-20},{21,-20}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
		rangedamagereturn_p={{{1,-4},{15,-25},{20,-30},{21,-30}},{{1,3*18},{15,8*18},{20,9*18},{21,9*18}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--����2���㣬�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--�����趨��ʽ���£�
--SKILLS={
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	����������
--}
--�磺
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--ħ������physicsenhance_p����1��1��ʱΪ35��20��ʱΪ335�����߲��Ĭ������
--			[2]={{1,0},{20,0}},
--		},--û��[3]����ʾħ������physicsenhance_p����2��Ĭ��Ϊ�κ�ʱ����0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--�����������ܡ��������¡���ħ�����Ժ���ֵ
-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata�����ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

