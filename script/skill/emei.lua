-------------------------------------------------------------------------
-- FileName		:	emei.lua - Nga My
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/emei.lua
-------------------------------------------------------------------------
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end


SKILLS={	
	piaoyun_chuanxue={ --Phi�u Tuy�t Xuy�n V�n 	C�ng k�ch n�i c�ng 80
		physicsdamage_v={
			[1]={{1,10},{20,120}},
			[3]={{1,10},{20,120}},
		},
		seriesdamage_p={{{1,1},{20,10}}},
		colddamage_v={
			[1]={{1,15},{20,275}},
			[3]={{1,25},{20,415}}
		},
		addskilldamage2={
			[1]={{1,380},{2,380}},
			[3]={{1,1},{20,75}}
		},
		addskilldamage1={
			[1]={{1,91},{2,91}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1062},{2,1062}},
			[3]={{1,1},{20,63}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	emei_jianfa={ --Nga Mi Ki�m ph�p	H� tr� b� ��ng	77
		addphysicsdamage_p={{{1,15},{20,215}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		deadlystrikeenhance_p={{{1,6},{20,36}},{{1,-1},{2,-1}}}
	},
	emei_zhangfa={ --Nga Mi Ch��ng ph�p	H� tr� b� ��ng	79
		addcoldmagic_v={{{1,15},{20,515}},{{1,-1},{2,-1}}}
	},
	sixiang_tonggui={ --T� T��ng ��ng Quy	C�ng k�ch n�i c�ng 	82
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,35},{20,315}},
			[3]={{1,45},{20,450}}
		},
		addskilldamage1={
			[1]={{1,331},{2,331}},
			[3]={{1,1},{20,76}}
		},
		addskilldamage2={
			[1]={{1,1062},{2,1062}},
			[3]={{1,1},{20,20}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,25},{20,35}}}
	},
	yiye_zhiqiu={ --Nh�t Di�p Tri Thu	C�ng k�ch n�i c�ng 	85
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,30},{20,75}}},
		colddamage_v={
			[1]={{1,10},{20,80}},
			[3]={{1,10},{20,80}}
		},
		deadlystrike_p={{{1,10},{20,20}}},
		addskilldamage1={
			[1]={{1,328},{2,328}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,88},{2,88}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1061},{2,1061}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage4={
			[1]={{1,1091},{2,1091}},
			[3]={{1,50},{20,50}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	liushui={--L�u Th�y 	V�ng tr�n  h�i ph�c thu�c t�nh	86
		fastwalkrun_p={{{1,9},{20,66}},{{1,18},{2,18}}}
	},
	bumie_bujue={ --B�t Di�t B�t Tuy�t	C�ng k�ch ngo�i c�ng  	88
		physicsenhance_p={{{1,80},{20,385}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		colddamage_v={
			[1]={{1,10},{20,282}},
			[3]={{1,10},{20,282}}
		},
		deadlystrike_p={{{1,15},{20,54}}},
		addskilldamage1={
			[1]={{1,328},{2,328}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1061},{2,1061}},
			[3]={{1,1},{20,60}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,30},{20,35}}}
	},
	mengdie={ --M�ng �i�p 	V�ng tr�n  h�i ph�c thu�c t�nh	89
		lifereplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,10}},{{1,18},{2,18}}},
	},
	foguang_puzhao={ --Ph�t Quang Ph� Chi�u	C�ng k�ch n�i c�ng 	91
		colddamage_v={
			[1]={{1,70},{20,787}},
			[3]={{1,80},{20,1287}}
		},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		addskilldamage2={
			[1]={{1,380},{2,380}},
			[3]={{1,1},{20,80}}
		},
		addskilldamage3={
			[1]={{1,1062},{2,1062}},
			[3]={{1,1},{20,65}}
		},
		skill_cost_v={{{1,30},{20,60}}}
	},
	cihang_pudu={ --T� H�ng Ph� ��	ch� ��ng h�i ph�c thu�c t�nh	93
		lifereplenish_v={{{1,275},{20,750}},{{1,36},{2,36}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	fofa_wubian={ --Ph�t Ph�p V� Bi�n  252
		addcoldmagic_v={{{1,30},{30,315}},{{1,-1},{2,-1}}},
		addcolddamage_v={{{1,70},{30,315}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,12},{30,65},{33,70},{35,90},{38,95},{41,100}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,12},{30,65},{33,70},{35,90},{38,95},{41,100}},{{1,-1},{2,-1}}},
		coldenhance_p={{{1,8},{30,37}},{{1,-1},{2,-1}}},
		lifemax_p={{{1,21},{35,50},{36,50}},{{1,-1},{30,-1}}}
	},
	foxin_ciyou={ --Ph�t T�m T� H�u	V�ng tr�n  t�ng c��ng thu�c t�nh	92
		lifemax_p={{{1,30},{20,125}},{{1,18*8},{2,18*8}}},
		--lifemax_yan_p={{{1,30},{25,100},{26,100}},{{1,18*8},{2,18*8}}}
	},
	tuichuang_wangyue={ --Th�i Song V�ng Nguy�t	C�ng k�ch ngo�i c�ng  	385
		physicsenhance_p={{{1,40},{20,175}}},
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,10},{20,120}},
			[3]={{1,10},{20,120}}
		},
		deadlystrike_p={{{1,10},{20,30}}},
		addskilldamage1={
			[1]={{1,329},{2,329}},
			[3]={{1,1},{20,49}}
		},
		addskilldamage2={
			[1]={{1,1091},{2,1091}},
			[3]={{1,1},{20,40}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	qingyin_fanchang={ --Thanh �m Ph�n X��ng	V�ng tr�n  h�i ph�c thu�c t�nh	282	
		fasthitrecover_v={{{1,1},{20,20},{31,31},{32,31}},{{1,18},{2,18}}},
		fatallystrikeres_p={{{1,1},{20,20}},{{1,18},{2,18}}},
		freezetimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}},
		poisontimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}},
		stuntimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}}
	},
	pudu_zhongsheng={ --Ph� �� Ch�ng Sinh 	V�ng tr�n  h�i ph�c thu�c t�nh	332
		lifereplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,10}},{{1,18},{2,18}}},
		fasthitrecover_v={{{1,1},{20,10},{21,10}},{{1,18},{2,18}}},
		allres_p={{{1,1},{20,40}},{{1,18},{2,18}}}
	},
	sane_jixue={ -- Tam Nga T� Tuy�t 	C�ng k�ch ngo�i c�ng  	328
		-- physicsenhance_p={{{1,10},{15,100},{20,237}}}, fix dame 1.8 > 2.0
		physicsenhance_p={{{1,20},{15,200},{20,474}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{20,111}},
			[3]={{1,10},{20,111}}
		},
		-- deadlystrike_p={{{1,10},{20,54}}},
		deadlystrike_p={{{1,10},{20,74}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,35},{20,35}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,329},{20,329}}
		},
		addskilldamage1={
			[1]={{1,1061},{2,1061}},
			[3]={{1,1},{20,25}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5000,1.25,1,3,1)},
							{2,SkillExpFunc(5000,1.15,2,3,1)},
							{3,SkillExpFunc(5000,1.16,3,3,1)},
							{4,SkillExpFunc(5000,1.17,4,3,1)},
							{5,SkillExpFunc(5000,1.18,5,3,1)},
							{6,SkillExpFunc(5000,1.19,6,3,1)},
							{7,SkillExpFunc(5000,1.20,7,3,1)},
							{8,SkillExpFunc(5000,1.21,8,3,1)},
							{9,SkillExpFunc(5000,1.22,9,3,1)},
							{10,SkillExpFunc(5000,1.23,10,3,1)},
							{11,SkillExpFunc(5000,1.24,11,3,1)},
							{12,SkillExpFunc(5000,1.23,12,3,1)},
							{13,SkillExpFunc(5000,1.22,13,3,1)},
							{14,SkillExpFunc(5000,1.21,14,3,1)},
							{15,SkillExpFunc(5000,1.20,15,3,1)},
							{16,SkillExpFunc(5000,1.19,16,3,1)},
							{17,SkillExpFunc(5000,1.18,17,3,1)},
							{18,SkillExpFunc(5000,1.17,18,3,1)},
							{19,SkillExpFunc(5000,1.16,19,3,1)},
							{20,SkillExpFunc(5000,1.15,20,3,1)},
							}},
	},
	yuquan_xichen={ --Ng�c Tuy�n T�y Tr�n 	C�ng k�ch ngo�i c�ng  	329
		-- physicsenhance_p={{{1,30},{20,148}}},
		physicsenhance_p={{{1,40},{20,208}}},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,10},{20,30}}},
	},
	jianemei150={ --Ki�m Hoa V�n Tinh	C�ng k�ch ngo�i c�ng  	1061
		physicsenhance_p={{{1,12},{15,120},{20,285},{23,483},{26,582}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,20},{20,195},{23,250},{26,277}},
			[3]={{1,20},{20,195},{23,250},{26,277}}
		},
		deadlystrike_p={{{1,12},{20,65},{23,81},{26,90}}},
		missle_speed_v={{{1,36},{20,36},{21,36}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,45},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1089},{20,1089}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
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
	jianemei150_2={ --Ki�m T�m T�nh �i�n	C�ng k�ch ngo�i c�ng  	1089
		physicsenhance_p={{{1,36},{20,175},{23,218},{26,240}}},
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		deadlystrike_p={{{1,12},{20,24},{23,27}}},
		colddamage_v={
			[1]={{1,10},{20,110},{23,141},{26,157}},
			[3]={{1,10},{20,110},{23,141},{26,157}}
		},
	},
	qianfo_qianye={ --Thi�n Ph�t Thi�n Di�p 	C�ng k�ch n�i c�ng 	330
		colddamage_v={
			[1]={{1,45},{20,100}},
			[3]={{1,45},{20,100}}
		},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,30},{20,65}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,380},{20,380}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,10}},{{1,0},{2,0}}},
		skill_skillexp_v={{{1,20000},{20,100000000,Conic}}},
	},
	fengshuang_suiying={ -- Phong S��ng To�i �nh 	C�ng k�ch n�i c�ng 	380
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			-- [1]={{1,20},{15,350},{20,770}}, -- 1.4 > 1.6
			-- [3]={{1,30},{15,400},{20,1000}}
			[1]={{1,32},{15,560},{20,1232}},
			[3]={{1,48},{15,640},{20,1600}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_cost_v={{{1,30},{20,65}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,331},{20,331}}
		},
		addskilldamage1={
			[1]={{1,1062},{2,1062}},
			[3]={{1,1},{20,25}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6260,1.25,1,3,1)},
							{2,SkillExpFunc(6260,1.15,2,3,1)},
							{3,SkillExpFunc(6260,1.16,3,3,1)},
							{4,SkillExpFunc(6260,1.17,4,3,1)},
							{5,SkillExpFunc(6260,1.18,5,3,1)},
							{6,SkillExpFunc(6260,1.19,6,3,1)},
							{7,SkillExpFunc(6260,1.20,7,3,1)},
							{8,SkillExpFunc(6260,1.21,8,3,1)},
							{9,SkillExpFunc(6260,1.22,9,3,1)},
							{10,SkillExpFunc(6260,1.23,10,3,1)},
							{11,SkillExpFunc(6260,1.24,11,3,1)},
							{12,SkillExpFunc(6260,1.23,12,3,1)},
							{13,SkillExpFunc(6260,1.22,13,3,1)},
							{14,SkillExpFunc(6260,1.21,14,3,1)},
							{15,SkillExpFunc(6260,1.20,15,3,1)},
							{16,SkillExpFunc(6260,1.19,16,3,1)},
							{17,SkillExpFunc(6260,1.18,17,3,1)},
							{18,SkillExpFunc(6260,1.17,18,3,1)},
							{19,SkillExpFunc(6260,1.16,19,3,1)},
							{20,SkillExpFunc(6260,1.15,20,3,1)},
							}},
	},
	jinding_foguang={ --Kim ��nh Ph�t Quang 	C�ng k�ch n�i c�ng 	331
		colddamage_v={
			-- [1]={{1,10},{20,420}}, -- fix dame 1.1 > 1.3
			-- [3]={{1,10},{20,420}},
			[1]={{1,13},{20,546}},
			[3]={{1,13},{20,546}},
		},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		missle_speed_v={{{1,24},{20,28},{21,28}}},
		skill_misslenum_v={{{1,1},{10,1},{20,3},{21,3}}},
	},
	zhangemei150={ --C�ng k�ch n�i c�ng 	1062
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,24},{15,420},{20,930},{23,1542},{26,1848}},
			[3]={{1,36},{15,480},{20,1200},{23,2064},{26,2496}}
		},
		skill_cost_v={{{1,36},{20,78},{23,91}}},
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
	zhangemei150_2={ --��΢�����˺�	C�ng k�ch n�i c�ng 	1090
		colddamage_v={
			[1]={{1,10},{20,585},{21,600}},
			[3]={{1,10},{20,585},{21,600}},
		},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		missle_speed_v={{{1,24},{20,28},{21,28}}},
		skill_misslenum_v={{{1,1},{10,1},{20,3},{21,3}}},
	},
	emei120={ --B� Nguy�t Ph�t Tr�n	V�ng tr�n  h�i ph�c thu�c t�nh	712	
		skill_appendskill={{{1,86},{20,86}},{{1,1},{19,19},{20,40},{21,40}}},
		skill_desc=
			function(level)
				return "��ng c�p k� n�ng n�y s� l�y theo k� n�ng h� tr� c� c�p th�p nh�t \n"
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
	emei120_1={ --K� n�ng ph� - B� Nguy�t Ph�t Tr�n	V�ng s�ng	718	
		skill_appendskill={{{1,89},{20,89}},{{1,1},{19,19},{20,40},{21,40}}},
	},
	emei120_2={ --K� n�ng ph� - B� Nguy�t Ph�t Tr�n	V�ng s�ng	718
		skill_appendskill={{{1,92},{20,92}},{{1,1},{19,19},{20,40},{21,40}}},
	},
	emei120_3={ --K� n�ng ph� - B� Nguy�t Ph�t Tr�n	V�ng s�ng	718
		skill_appendskill={{{1,282},{20,282}},{{1,1},{19,19},{20,40},{21,40}}},
	},
	emei120_4={ --K� n�ng ph� - B� Nguy�t Ph�t Tr�n	V�ng s�ng	718
		skill_appendskill={{{1,332},{20,332}},{{1,1},{19,19},{20,40},{21,40}}},
	},
	fuzhuemei150={ --Ng�c Tuy�n T�m Kinh	C�ng k�ch n�i c�ng 	1114	
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,20},{15,200},{20,400},{23,640},{26,760}},
			[3]={{1,30},{15,200},{20,500},{23,860},{26,1040}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_cost_v={{{1,30},{20,65},{23,76}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,20},{20,20}},
			[3]={{1,1115},{20,1115}}
		},
		skill_showevent={{{1,0},{10,0},{10,2},{20,2}}},
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

