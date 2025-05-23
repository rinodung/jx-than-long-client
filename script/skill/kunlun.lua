-------------------------------------------------------------------------
-- FileName		:	kunlun.lua - C�n L�n
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/kunlun.lua
-------------------------------------------------------------------------
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end


SKILLS={	
	hufeng_fa={ --H� Phong Ph�p	C�ng k�ch n�i c�ng 	169
		physicsenhance_p={{{1,5},{20,75}}},
		seriesdamage_p={{{1,1},{20,10}}},
		lightingdamage_v={
			[1]={{1,15},{20,180}},
			[3]={{1,15},{20,180}}
		},
		addskilldamage1={
			[1]={{1,372},{2,372}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,176},{2,176}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1080},{2,1080}},
			[3]={{1,1},{20,83}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,15},{20,15}}}
	},
	kunlun_daofa={ --C�n L�n �ao ph�p	H� tr� b� ��ng	167
		addphysicsdamage_p={{{1,35},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,6},{20,50,Conic}},{{1,-1},{2,-1}}}
	},
	kunlun_jianfa={ --C�n L�n Ki�m ph�p	H� tr� b� ��ng	168
		addlightingmagic_v={{{1,19},{20,215}},{{1,-1},{2,-1}}}
	},
	qingfeng_fu={ --Thanh Phong ph� 	Ch� ��ng h� tr� chi�n ��u	171
		fastwalkrun_p={{{1,22},{20,60}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,40},{20,40}}}
	},
	jiban_fu={ --Ki B�n ph� 	Ch� ��ng h� tr� chi�n ��u	174
		fastwalkrun_p={{{1,-22},{20,-52}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,60},{20,60}}}
	},
	baichuan_nahai={ --B�ch Xuy�n N�p H�i	H� tr� ph�ng ng� - ch� ��ng	177
		coldres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		physicsres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,12},{20,50}}}
	},
	yiqi_sanqing={ --Nh�t Kh� Tam Thanh	Ch� ��ng h� tr� chi�n ��u	178
		addphysicsdamage_p={{{1,35},{20,215}},{{1,18*120},{20,18*120}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,16},{20,35,Conic}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,80},{20,80}}}
	},
	kuanglei_zhendi={ --Cu�ng L�i Ch�n ��a 	C�ng k�ch n�i c�ng 	179	
		lightingdamage_v={
			[1]={{1,27},{20,315}},
			[3]={{1,27},{20,315}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,182},{2,182}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1109},{2,1109}},
			[3]={{1,1},{20,50}}
		},
		skill_attackradius={{{1,320},{20,352}}},
		skill_cost_v={{{1,15},{20,15}}}
	},
	tianqing_dizhuo={ --Thi�n Thanh ��a Tr�c	H� tr� ph�ng ng� - ch� ��ng	173
		lightingres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		fireres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		coldres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		physicsres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,12},{20,90}}}
	},
	qixin_fu={ --Kh� T�m ph� 	Ch� ��ng h� tr� chi�n ��u	181	
		stun_p={{{1,16},{20,35}},{{1,5},{20,36}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	tianji_xunlei={ --Thi�n T� T�n L�i  	C�ng k�ch n�i c�ng 	172	
		lightingdamage_v={
			[1]={{1,25},{20,550}},
			[3]={{1,25},{20,550}}
		},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,65}}
		},
		addskilldamage2={
			[1]={{1,1109},{2,1109}},
			[3]={{1,1},{20,54}}
		},
		seriesdamage_p={{{1,1},{20,30}}},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,15},{20,35}}}
	},
	kuangfeng_zhoudian={ --Cu�ng Phong S�u �i�n	C�ng k�ch ngo�i c�ng  	176	
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,55},{20,386}}},
		lightingdamage_v={
			[1]={{1,45},{20,532}},
			[3]={{1,45},{20,532}}
		},
		stun_p={{{1,5},{20,15},{21,15}},{{1,1},{20,20},{21,20}}},
		addskilldamage1={
			[1]={{1,373},{2,373}},
			[3]={{1,1},{20,126}}
		},
		addskilldamage2={
			[1]={{1,1108},{2,1108}},
			[3]={{1,1},{20,110}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	wulei_zhengfa={ --Ng� L�i Ch�nh Ph�p	C�ng k�ch n�i c�ng 	182
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		lightingdamage_v={
			[1]={{1,25},{20,937}},
			[3]={{1,25},{20,937}}
		},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1109},{2,1109}},
			[3]={{1,1},{20,58}}
		},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,50},{20,90}}}
	},
	shuangao_kunlun={ --S��ng Ng�o C�n L�n 	H� tr� b� ��ng	275
		deadlystrikeenhance_p={{{1,6},{30,15,Conic}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,25},{30,65},{34,73},{35,90},{36,92}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,25},{20,65},{33,92},{35,118},{38,124},{39,126}},{{1,-1},{30,-1}}},
		addlightingmagic_v={{{1,30},{30,315,Conic}},{{1,-1},{2,-1}}},
		addlightingdamage_v={{{1,45},{30,315,Conic}},{{1,-1},{2,-1}}},
		lifemax_p={{{1,21},{35,80},{36,80}},{{1,-1},{30,-1}}},
	},
	shufu_zhou={ --Th�c Ph��c Ch� 	Ch� ��ng h� tr� chi�n ��u	392
		rangedamagereturn_p={{{1,-5},{20,-35}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	beiming_daohai={ --B�c Minh ��o H�i	Ch� ��ng h� tr� chi�n ��u	393
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*45},{20,18*120}}},
		manareplenish_v={{{1,-1},{20,-20}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	qihan_aoxue={ --Khi H�n Ng�o Tuy�t	H� tr� ph�ng ng� - b�  ��ng	175
		castspeed_v={{{1,-6},{20,-39},{30,-50},{31,-50}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	mizhong_huanying={ --M� Tung �o �nh		90
		freezetimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		stuntimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	zuixian_cuogu={ --T�y Ti�n T� C�t 99	Ch� ��ng h� tr� c�ng k�ch	376
		fastwalkrun_p={{{1,-12},{20,-52}},{{1,18*45},{20,18*120}}},
		freezetimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		stuntimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*45},{20,18*120}}},
		manareplenish_v={{{1,-1},{20,-20}},{{1,18*45},{20,18*120}}},
		rangedamagereturn_p={{{1,-5},{20,-35}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,100},{20,160}}}
	},
	wusuo_kunlun={ --V� T�a C�n L�n 	C�ng k�ch n�i c�ng 	374
		seriesdamage_p={{{1,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,10},{20,256}},
			[3]={{1,10},{20,256}}
		},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,60},{20,85}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,375},{20,375}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,10}},{{1,0},{2,0}}},
		skill_skillexp_v={{{1,20000},{20,84567890,Conic}}},
	},
	leidong_jiutian={ --L�i ��ng C�u Thi�n 	C�ng k�ch n�i c�ng 	375
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		stun_p={{{1,1},{20,20},{21,21}},{{1,1},{20,12},{21,12}}},
		lightingdamage_v={
			[1]={{1,90},{15,320},{20,670}}, -- 620 > 670
			[3]={{1,90},{15,320},{20,670}}
		},
		skill_cost_v={{{1,40},{15,60},{20,95}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,387},{20,387}}
		},
		addskilldamage1={
			[1]={{1,1109},{2,1109}},
			[3]={{1,1},{20,35}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5330,1.15,1,8,1)},
							{2,SkillExpFunc(5330,1.15,2,8,1)},
							{3,SkillExpFunc(5330,1.16,3,8,1)},
							{4,SkillExpFunc(5330,1.17,4,8,1)},
							{5,SkillExpFunc(5330,1.18,5,8,1)},
							{6,SkillExpFunc(5330,1.19,6,8,1)},
							{7,SkillExpFunc(5330,1.20,7,8,1)},
							{8,SkillExpFunc(5330,1.21,8,8,1)},
							{9,SkillExpFunc(5330,1.22,9,8,1)},
							{10,SkillExpFunc(5330,1.23,10,8,1)},
							{11,SkillExpFunc(5330,1.24,11,8,1)},
							{12,SkillExpFunc(5330,1.23,12,8,1)},
							{13,SkillExpFunc(5330,1.22,13,8,1)},
							{14,SkillExpFunc(5330,1.21,14,8,1)},
							{15,SkillExpFunc(5330,1.20,15,8,1)},
							{16,SkillExpFunc(5330,1.19,16,8,1)},
							{17,SkillExpFunc(5330,1.18,17,8,1)},
							{18,SkillExpFunc(5330,1.17,18,8,1)},
							{19,SkillExpFunc(5330,1.16,19,8,1)},
							{20,SkillExpFunc(5330,1.15,20,8,1)},
						}},
	},
	jiankunlun150={ --Thi�n L�i Ch�n Nh�c	C�ng k�ch n�i c�ng 	1081
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,192},{15,624},{20,1130},{23,1737},{26,2040}},
			[3]={{1,192},{15,624},{20,1130},{23,1737},{26,2040}}
		},
	},
	jiankunlun150fu={ --Thi�n L�i Ch�n Nh�c	C�ng k�ch n�i c�ng 	1081
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		stun_p={{{1,16},{20,35},{23,41},{26,44}},{{1,1},{20,20},{21,21}}},
		lightingdamage_v={
			[1]={{1,25},{20,250},{23,321},{26,356}},
			[3]={{1,25},{20,250},{23,321},{26,356}}
		},
		skill_cost_v={{{1,48},{15,72},{20,115},{23,166},{26,192}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1109},{20,1109}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
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
	pingdi_hanlei={ --B�nh ��a H�m L�i 	C�ng k�ch n�i c�ng 	387	
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,25},{20,320}}, -- 300 > 320
			[3]={{1,25},{20,320}}
		},
	},
	aoxue_xiaofeng={ --Ng�o Tuy�t Ti�u Phong 	C�ng k�ch n�i c�ng 	372
		-- physicsenhance_p={{{1,5},{15,100},{20,280}}}, 
		physicsenhance_p={{{1,7},{15,140},{20,392}}}, -- fix dame 1.2 > 1.4
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			-- [1]={{1,39},{15,200},{20,673}}, -- zin
			-- [3]={{1,39},{15,200},{20,673}}
			[1]={{1,39},{15,200},{20,633}}, -- fix
			[3]={{1,39},{15,200},{20,633}}
		},
		stun_p={{{1,5},{20,25},{21,25}},{{1,1},{20,12},{21,12}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,25},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,386},{20,386}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,373},{20,373}}
		},
		addskilldamage1={
			[1]={{1,1080},{2,1080}},
			[3]={{1,1},{20,35}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6860,1.15,1,5,1)},
							{2,SkillExpFunc(6860,1.15,2,5,1)},
							{3,SkillExpFunc(6860,1.16,3,5,1)},
							{4,SkillExpFunc(6860,1.17,4,5,1)},
							{5,SkillExpFunc(6860,1.18,5,5,1)},
							{6,SkillExpFunc(6860,1.19,6,5,1)},
							{7,SkillExpFunc(6860,1.20,7,5,1)},
							{8,SkillExpFunc(6860,1.21,8,5,1)},
							{9,SkillExpFunc(6860,1.22,9,5,1)},
							{10,SkillExpFunc(6860,1.23,10,5,1)},
							{11,SkillExpFunc(6860,1.24,11,5,1)},
							{12,SkillExpFunc(6860,1.23,12,5,1)},
							{13,SkillExpFunc(6860,1.22,13,5,1)},
							{14,SkillExpFunc(6860,1.21,14,5,1)},
							{15,SkillExpFunc(6860,1.20,15,5,1)},
							{16,SkillExpFunc(6860,1.19,16,5,1)},
							{17,SkillExpFunc(6860,1.18,17,5,1)},
							{18,SkillExpFunc(6860,1.17,18,5,1)},
							{19,SkillExpFunc(6860,1.16,19,5,1)},
							{20,SkillExpFunc(6860,1.15,20,5,1)},
							}},
	},
	daokunlun150={ --C�u Thi�n C��ng Phong	C�ng k�ch n�i c�ng 	1080
		physicsenhance_p={{{1,6},{15,120},{20,335},{23,593},{26,722}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		lightingdamage_v={
			[1]={{1,48},{15,240},{20,806},{23,1485},{26,1824}},
			[3]={{1,48},{15,240},{20,806},{23,1485},{26,1824}}
		},
		stun_p={{{1,6},{20,30},{21,30}},{{1,1},{20,12},{21,12}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,30},{20,55},{23,62}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,386},{20,386}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1108},{20,1108}}
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
	daokunlun150_2={ --Phong Minh Ng�c To�i	C�ng k�ch n�i c�ng 	1108
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		missle_lifetime_v={{{1,6},{20,24},{21,24}}},
		lightingdamage_v={
			[1]={{1,105},{20,395},{23,486},{26,532}},
			[3]={{1,135},{20,660},{23,825},{26,908}}
		},
	},
	yufeng_shu={ --Ng� Phong thu�t	C�ng k�ch n�i c�ng 	386	
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,28},{20,282}}},
	},
	xiaofeng_sanlianji={ --Khi�u Phong Tam Li�n K�ch	C�ng k�ch n�i c�ng 	373
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		missle_lifetime_v={{{1,6},{20,24},{21,24}}},
		lightingdamage_v={
			[1]={{1,85},{20,330}},
			[3]={{1,115},{20,550}}
		},
	},
	xuantianwuji={	--Huy�n Thi�n V� C�c	h� tr� b� ��ng 	630
		dynamicmagicshield_v={{{1,50},{10,230},{15,370},{20,550},{21,550}},{{1,-1},{20,-1}}},
		returnres_p={{{1,5},{20,30},{21,30}},{{1,-1},{20,-1}}},
		--skill_cost_v={{{1,80},{20,150}}},		
	},
	kunlun120={ --L��ng Nghi Ch�n Kh�	h� tr� b� ��ng 	717	
		autorescueskill={{{1,721*256 + 1},{20,721*256 + 20},{21,721*256 + 21}},{{1,-1},{20,-1}},{{1,20*18*256 + 15},{15,20*18*256 + 60},{20,20*18*256 + 65},{21,20*18*256 + 65}}},
		skill_desc=
			function(level)
				return "Khi sinh l�c th�p h�n 25% c� x�c su�t <color=orange>"..floor(Link(level,SKILLS.kunlun120.autorescueskill[3]) - 20*18*256).."%<color> ph�t chi�u L��ng Nghi Ch�n Kh� \n"..
				"Ch�n kh� ch�ng l�i s�t th��ng g�p <color=orange>"..floor(Link(level,SKILLS.kunlun120mofadun.staticmagicshield_p[1]) / 100)..
				" l�n<color> m�c n�i l�c trong <color=orange>"..floor(Link(level,SKILLS.kunlun120mofadun.staticmagicshield_p[2]) / 18).." gi�y<color>\n"..
				" v� t�ng <color=orange>"..floor((Link(level,SKILLS.kunlun120jiasu.fastwalkrun_p[1]))).."%<color> t�c �� di chuy�n trong <color=orange>"
				..floor(Link(level,SKILLS.kunlun120jiasu.fastwalkrun_p[2]) / 18).." gi�y<color>\n"..
				"Trong v�ng <color=orange>"..floor((Link(level,SKILLS.kunlun120.autorescueskill[3]) / (18*256))).." gi�y<color> sau m�i c� th� thi tri�n ti�p"
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
	kunlun120mofadun={ --L��ng Nghi Ch�n Kh�_Ma Ph�p ��n	ch� ��ng h� tr� 	721
		staticmagicshield_p={{{1,1800},{15,9750},{20,10000},{21,10050}},{{1,5*18},{15,9*18},{20,10*18},{21,10*18}}},
	},
	kunlun120jiasu={ --L��ng Nghi Ch�n Kh�_Gia T�c	ch� ��ng h� tr� 	722
		fastwalkrun_p={{{1,5},{15,30},{20,35},{21,36}},{{1,3*18},{15,9*18},{20,10*18},{21,10*18}}},
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
