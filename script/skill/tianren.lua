-------------------------------------------------------------------------
-- FileName		:	tianren.lua - Thi�n Nh�n
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/tianren.lua
-------------------------------------------------------------------------
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end


SKILLS={
	canyang_ruxue={ --T�n D��ng Nh� Huy�t	C�ng k�ch n�i c�ng 	135
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,5},{20,55}}},
		firedamage_v={
			[1]={{1,5},{20,50}},
			[3]={{1,5},{20,50}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,142},{2,142}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1075},{2,1075}},
			[3]={{1,1},{20,38}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,8},{20,8}}}
	},
	tianren_daofa={ --Thi�n Nh�n  �ao ph�p	H� tr� b� ��ng	131
		addfiremagic_v={{{1,15},{20,215}},{{1,-1},{2,-1}}}
	},
	tianren_maofa={ --Thi�n Nh�n  M�u ph�p	H� tr� b� ��ng	132
		addphysicsdamage_p={{{1,15},{20,215}},{{1,-1},{2,-1}},{{1,3},{2,3}}},
		attackratingenhance_p={{{1,35},{20,272}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,35}},{{1,-1},{2,-1}}}
	},
	huolian_fenhua={ --H�a Li�n Ph�n Hoa	Ch� ��ng h� tr� chi�n ��u	136
		meleedamagereturn_p={{{1,-5},{20,-35}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,12},{20,12}}}
	},
	huanying_feihu={ --�o �nh Phi H� 	H� tr� ph�ng ng� - ch� ��ng	137
		attackratingenhance_p={{{1,-15},{20,-132}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	tuishan_tianhai={ --Th�i s�n  �i�n H�i	C�ng k�ch n�i c�ng 	138
		seriesdamage_p={{{1,5},{20,30}}},
		firedamage_v={
			[1]={{1,5},{20,45}},
			[3]={{1,5},{20,45}}
		},
		addskilldamage1={
			[1]={{1,362},{2,362}},
			[3]={{1,1},{20,115}}
		},
		addskilldamage2={
			[1]={{1,1076},{2,1076}},
			[3]={{1,1},{20,95}}
		},
		skill_cost_v={{{1,32},{20,50}}}
	},
	feihong_wuji={ --Phi H�ng V� T�ch 	Ch� ��ng h� tr� c�ng k�ch	140
		adddefense_v={{{1,-150},{20,-1100}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	liehuo_qingtian={ --Li�t H�a T�nh Thi�n 	C�ng k�ch n�i c�ng 	141
		seriesdamage_p={{{1,5},{20,30}}},
		physicsenhance_p={{{1,15},{20,75}}},
		firedamage_v={
			[1]={{1,8},{20,150}},
			[3]={{1,8},{20,150}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,55}}
		},
		addskilldamage2={
			[1]={{1,1075},{2,1075}},
			[3]={{1,1},{20,45}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	toutian_huanri={ --Th�u Thi�n Ho�n Nh�t	C�ng k�ch ngo�i c�ng  	142
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,25},{20,231}}},
		deadlystrike_p={{{1,4},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,482}},
			[3]={{1,10},{20,482}}
		},
		addskilldamage1={
			[1]={{1,361},{2,361}},
			[3]={{1,1},{20,65}}
		},
		addskilldamage2={
			[1]={{1,1075},{2,1075}},
			[3]={{1,1},{20,54}}
		},
		steallife_p={{{1,1},{20,8}}},
		stealmana_p={{{1,1},{20,6}}},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{2,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,12},{20,20}}}
	},
	limo_duopo={ --L�ch Ma �o�t H�n	H� tr� ph�ng ng� - ch� ��ng	143
		addphysicsdamage_p={{{1,-25},{20,-215}},{{1,18*40},{20,18*120}},{{1,6},{20,6}}},
		skill_cost_v={{{1,30},{20,30}}}
	},
	tanzhi_lieyan={ --��n Ch� Li�t Di�m	C�ng k�ch n�i c�ng 	145
		firedamage_v={
			[1]={{1,30},{20,225}},
			[3]={{1,30},{20,225}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,362},{2,362}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,148},{2,148}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1076},{2,1076}},
			[3]={{1,1},{20,83}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,30}}}
	},
	wuxing_zhen={ --Ng� h�nh tr�n	V�ng tr�n  h� tr� ph�ng ng� 	146
		adddefense_v={{{1,75},{20,550}},{{1,18},{20,18}}},
	},
	moyan_qisha={ --Ma Di�m Th�t S�t	C�ng k�ch ngo�i c�ng  	148
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,35},{20,637}},
			[3]={{1,35},{20,637}}
		},
		addskilldamage1={
			[1]={{1,363},{2,363}},
			[3]={{1,1},{20,87}}
		},
		addskilldamage2={
			[1]={{1,1076},{2,1076}},
			[3]={{1,1},{20,72}}
		},
		fatallystrike_p={{{1,12},{20,50}}},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,30}}}
	},
	tianmo_jieti={ --Thi�n Ma Gi�i Th� 	Ch� ��ng h� tr� c�ng k�ch	150
		adddefense_v={{{1,75},{30,850}},{{1,18*120},{30,18*360}}},
		attackratingenhance_p={{{1,65},{30,600}},{{1,18*120},{30,18*360}}},
		fasthitrecover_v={{{1,5},{20,40}},{{1,18*120},{20,18*360}}},
--		fasthitrecover_yan_v={{{1,5},{20,49},{21,49}},{{1,18*120},{20,18*360}}},
		addfiremagic_v={{{1,20},{30,315}},{{1,18*120},{30,18*360}}},
		addfiredamage_v={{{1,20},{30,315}},{{1,18*120},{30,18*360}}},
		fireenhance_p={{{1,31},{30,100}},{{1,18*120},{30,18*360}}},
--		lifemax_p={{{1,-11},{20,-30},{30,-20},{40,10},{41,10}},{{1,18*45},{30,18*180}}},
		attackspeed_v={{{1,26},{30,102},{33,109},{35,134},{38,138},{41,145},{42,163},{43,165}},{{1,18*120},{30,18*360}}},
		castspeed_v={{{1,26},{30,81},{33,86},{35,101},{36,103}},{{1,18*120},{30,18*360}}},
		lifemax_p={{{1,21},{35,20},{36,20}},{{1,18*45},{30,18*180}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	beisu_qingfeng={ --Bi T� Thanh Phong 	Ch� ��ng h� tr� c�ng k�ch	364
		fasthitrecover_v={{{1,-6},{20,-30},{23,-34},{28,-34},{29,-35}},{{1,18*40},{20,18*120}}},
	 --fasthitrecover_yan_v={{{1,-6},{28,-18},{29,-18}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	yunlong_ji={ --V�n Long K�ch	C�ng k�ch ngo�i c�ng  	361
		-- physicsenhance_p={{{1,45},{20,445}}}, -- fix dame 2.2 > 2.4
		physicsenhance_p={{{1,108},{20,1068}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,4},{20,85}}},
		firedamage_v={
			-- [1]={{1,6},{15,100},{20,378}}, fix dame 1.5 > 1.6
			-- [3]={{1,6},{15,100},{20,378}}
			[1]={{1,9},{15,160},{20,604}},
			[3]={{1,9},{15,160},{20,604}}
		},
		addskilldamage1={
			[1]={{1,1075},{2,1075}},
			[3]={{1,1},{20,30}}
		},
		steallife_p={{{1,1},{20,4}}},
		stealmana_p={{{1,1},{20,4}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,5},{2,5}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,30},{20,30}}},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,378},{20,378}}
--		},
--		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(11600,1.15,1,1,1)},
							{2,SkillExpFunc(11600,1.15,2,1,1)},
							{3,SkillExpFunc(11600,1.16,3,1,1)},
							{4,SkillExpFunc(11600,1.17,4,1,1)},
							{5,SkillExpFunc(11600,1.18,5,1,1)},
							{6,SkillExpFunc(11600,1.19,6,1,1)},
							{7,SkillExpFunc(11600,1.20,7,1,1)},
							{8,SkillExpFunc(11600,1.21,8,1,1)},
							{9,SkillExpFunc(11600,1.22,9,1,1)},
							{10,SkillExpFunc(11600,1.23,10,1,1)},
							{11,SkillExpFunc(11600,1.24,11,1,1)},
							{12,SkillExpFunc(11600,1.23,12,1,1)},
							{13,SkillExpFunc(11600,1.22,13,1,1)},
							{14,SkillExpFunc(11600,1.21,14,1,1)},
							{15,SkillExpFunc(11600,1.20,15,1,1)},
							{16,SkillExpFunc(11600,1.19,16,1,1)},
							{17,SkillExpFunc(11600,1.18,17,1,1)},
							{18,SkillExpFunc(11600,1.17,18,1,1)},
							{19,SkillExpFunc(11600,1.16,19,1,1)},
							{20,SkillExpFunc(11600,1.15,20,1,1)},
							}},
	},
	zhanren150={ --Giang H�i N� Lan	C�ng k�ch ngo�i c�ng  	1075
		physicsenhance_p={{{1,55},{20,535},{23,686},{26,762}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		deadlystrike_p={{{1,6},{20,80},{23,103},{26,115}}},
		firedamage_v={
			[1]={{1,10},{15,120},{20,455},{23,857},{26,1058}},
			[3]={{1,10},{15,120},{20,455},{23,857},{26,1058}}
		},
		steallife_p={{{1,1},{20,16},{23,20},{26,23}}},
		stealmana_p={{{1,1},{20,16},{23,20},{26,23}}},
		missle_speed_v={{{1,40},{20,40}}},
		missle_lifetime_v={{{1,12},{2,12}}},
		skill_attackradius={{{1,198},{20,198}}},
		skill_cost_v={{{1,36},{20,36}}},
		randmove={{{1,1},{20,1}},{{1,1},{20,5},{23,6},{26,9},{27,9}}},
		missle_missrate={{{1,99},{20,80}}},
		skill_desc=
			function(level)
				local szTime = format("%.2f", (floor(Link(level,SKILLS.zhanren150.randmove[2])*100/18 )/100))
				return "T�ng th�m h�nh th�c th� hai <color=blue> ma �m k�ch <color> v� <color=orange>"..floor(100 -Link(level,SKILLS.zhanren150.missle_missrate[1])).."%<color>T� l� khi�n cho ��i ph��ng khi�p s�"..
						"<color=orange>"..szTime.." gi�y<color>\n"
			end,
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,1},{20,1}},
			[3]={{1,1131},{20,1131}}
		},
		skill_showevent={{{1,1},{20,1}}},
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
	fenghuo_liantian={ --Phong H�a Li�n Thi�n 	C�ng k�ch n�i c�ng 	378
		seriesdamage_p={{{1,20},{20,60}}},
		firedamage_v={
			[1]={{1,5},{20,40}},
			[3]={{1,5},{20,40}}
		},
	},
	tianwai_liuxing={ -- Thi�n Ngo�i L�u Tinh	C�ng k�ch ngo�i c�ng  	362
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			-- [1]={{1,11},{15,200},{20,462}}, -- fix dame 1.3 > 1.5
			-- [3]={{1,11},{15,200},{20,462}}
			[1]={{1,16},{15,300},{20,693}},
			[3]={{1,16},{15,300},{20,693}}
		},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,20},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,363},{20,363}}
		},
		addskilldamage1={
			[1]={{1,1076},{2,1076}},
			[3]={{1,1},{20,55}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4085,1.15,1,3,1)},
							{2,SkillExpFunc(4085,1.15,2,3,1)},
							{3,SkillExpFunc(4085,1.16,3,3,1)},
							{4,SkillExpFunc(4085,1.17,4,3,1)},
							{5,SkillExpFunc(4085,1.18,5,3,1)},
							{6,SkillExpFunc(4085,1.19,6,3,1)},
							{7,SkillExpFunc(4085,1.20,7,3,1)},
							{8,SkillExpFunc(4085,1.21,8,3,1)},
							{9,SkillExpFunc(4085,1.22,9,3,1)},
							{10,SkillExpFunc(4085,1.23,10,3,1)},
							{11,SkillExpFunc(4085,1.24,11,3,1)},
							{12,SkillExpFunc(4085,1.23,12,3,1)},
							{13,SkillExpFunc(4085,1.22,13,3,1)},
							{14,SkillExpFunc(4085,1.21,14,3,1)},
							{15,SkillExpFunc(4085,1.20,15,3,1)},
							{16,SkillExpFunc(4085,1.19,16,3,1)},
							{17,SkillExpFunc(4085,1.18,17,3,1)},
							{18,SkillExpFunc(4085,1.17,18,3,1)},
							{19,SkillExpFunc(4085,1.16,19,3,1)},
							{20,SkillExpFunc(4085,1.15,20,3,1)},
						}},
	},
	moren150={ --T�t H�a Li�u Nguy�n	C�ng k�ch n�i c�ng 	1076
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,45},{20,760},{23,985},{26,1098}},
			[3]={{1,45},{20,760},{23,985},{26,1098}}
		},
		fatallystrike_p={{{1,10},{20,30}}},
		missle_speed_v={{{1,0},{20,0}}},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,25},{20,36},{23,39}}},
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
	yehuo_fencheng={ -- Nghi�p H�a Ph�n Th�nh 	C�ng k�ch ngo�i c�ng  	363
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,21},{20,320}},
			[3]={{1,21},{20,320}}
		},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{15,0},{15,1},{20,1}},
--			[3]={{1,379},{20,379}}
--		},
--		skill_showevent={{{1,0},{15,0},{15,1},{20,1}}},
	},
	moyan_zaitian={ --Ma Vi�m T�i Thi�n  	C�ng k�ch n�i c�ng 	379
		seriesdamage_p={{{1,20},{20,60}}},
		firedamage_v={
			[1]={{1,10},{20,80}},
			[3]={{1,10},{20,80}}
		},
	},
	shehun_luanxin={ --Nhi�p H�n Lo�n T�m 	Ch� ��ng h� tr� chi�n ��u	391
		attackratingenhance_p={{{1,-12},{20,-128}},{{1,18*40},{20,18*120}}},
		adddefense_v={{{1,-80},{20,-800}},{{1,18*40},{20,18*120}}},
		addphysicsdamage_p={{{1,-15},{20,-215}},{{1,18*40},{20,18*120}},{{1,6},{20,6}}},
		fasthitrecover_v={{{1,-3},{20,-10},{21,-10}},{{1,18*40},{20,18*120}}},
		--fasthitrecover_v={{{1,-6},{20,-30}},{{1,18*40},{20,18*120}}},
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*40},{20,18*120}}},
		deadlystrikeenhance_p={{{1,-6},{20,-35}},{{1,18*40},{20,18*120}}},
		skill_cost_v={{{1,60},{20,120}}},
	},
	tianren120={ --Ma �m Ph� Ph�ch	H� tr� ch� ��ng	715 - k� n�ng 120 thi�n nh�n
		skill_cost_v={{{1,25},{20,80},{21,80}}},
		skill_mintimepercastonhorse_v={{{1,45*18},{15,25*18},{20,20*18},{21,20*18}}},
		skill_mintimepercast_v={{{1,45*18},{15,25*18},{20,20*18},{21,20*18}}},
		autodeathskill={{{1,723*256 + 41},{20,723*256 + 60},{21,723*256 + 60}},{{1,-1},{20,-1}},{{1,100},{2,100}}},
		--randmove={{{1,1},{20,1}},{{1,1*18},{20,5*18},{21,93}}},
		--missle_missrate={{{1,65},{15,20},{20,15},{21,14}}},
		skill_desc=
			function(level)
				return "Th�i gian kh�i ph�c chi�u th�c: <color=orange>"..floor(Link(level,SKILLS.tianren120.skill_mintimepercast_v[1]) / 18).." gi�y<color>\n"..
				"Th�i gian kh�i ph�c chi�u th�c tr�n ng�a: <color=orange>"..floor(Link(level,SKILLS.tianren120.skill_mintimepercastonhorse_v[1]) / 18).." gi�y<color>\n"..
				"X�c su�t <color=orange>"..floor(100 -Link(level,SKILLS.quntisuijizoudong.missle_missrate[1])).."%<color> khi�n cho t�i �a "..
				floor(Link(level,SKILLS.quntisuijizoudong.missle_hitcount[1])).." m�c ti�u g�n b� ho�ng lo�n trong <color=orange>"..
				floor(Link(level,SKILLS.quntisuijizoudong.randmove[2]) / 18).." gi�y<color>\n"..
				"Sau khi ch�t c� x�c su�t <color=orange>"..floor(Link(level,SKILLS.tianren120.autodeathskill[3])).."%<color> khi�n cho t�i �a "..
				floor(Link(level,SKILLS.quntisuijizoudong.missle_hitcount[1])).." m�c ti�u g�n b� ho�ng lo�n trong <color=orange>"..
				floor(Link(level,SKILLS.quntisuijizoudong.randmove[2]) / 18).." gi�y<color>\n"..
				"Trong l�c ho�ng lo�n kh�ng th� t�n c�ng v� di chuy�n \n"
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
	quntisuijizoudong={ --Ma �m Ph� Ph�ch - Ho�ng lo�n	Ch� thu�t	723	
		randmove={{{1,1},{20,1}},{{1,1*18},{15,3*18},{20,4*18},{21,4*18},{40,4*18},{41,1*18},{55,3*18},{60,4*18},{61,4*18}}},
		missle_missrate={{{1,65},{15,20},{20,15},{21,15},{40,15},{41,0},{60,0}}},
		missle_hitcount={{{1,6},{20,6}}},
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

