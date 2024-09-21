-------------------------------------------------------------------------
-- FileName		:	wudu.lua - Ngò §éc
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/wudu.lua
-------------------------------------------------------------------------
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end

SKILLS={
	
	dusha_zhang={ --§éc Sa ch­ëng	C«ng kÝch néi c«ng 63
		poisondamage_v={{{1,2},{20,26}},{{1,60},{20,60}},{{1,10},{20,10}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,353},{2,353}},
			[3]={{1,2},{20,65}}
		},
		addskilldamage2={
			[1]={{1,71},{2,71}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1066},{2,1066}},
			[3]={{1,1},{20,54}}
		},
		addskilldamage4={
			[1]={{1,1094},{2,1094}},
			[3]={{1,1},{20,54}}
		},
		addskilldamage5={
			[1]={{1,1096},{2,1096}},
			[3]={{1,1},{20,54}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	wudu_daofa={ --Ngò §éc §ao ph¸p	Hç trî bÞ ®éng 60
		-- addphysicsdamage_p={{{1,20},{20,180}},{{1,-1},{20,-1}},{{1,1},{2,1}}}, -- fix dame
		addphysicsdamage_p={{{1,20},{20,360},{21,370}},{{1,-1},{20,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,6},{20,25}},{{1,-1},{2,-1}}}
	},
	wudu_zhangfa={ --Ngò §éc Ch­ëng Ph¸p	Hç trî bÞ ®éng 62
		addpoisonmagic_v={{{1,15},{20,45}},{{1,-1},{2,-1}},{{1,10},{2,10}}},
	},
	binglan_xuanjing={ --B¨ng Lam HuyÒn Tinh	Chñ ®éng hç trî c«ng kÝch 64
		coldres_p={{{1,-9},{20,-49}},{{1,18*20},{20,18*90}}},
		--coldresmax_p={{{1,-1},{25,-15},{26,-15}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,10},{20,60}}}
	},
	xuedao_dusha={ --HuyÕt §ao §éc S¸t	C«ng kÝch néi c«ng 65
		physicsenhance_p={{{1,15},{20,65}}},
		seriesdamage_p={{{1,1},{20,10}}},
		poisondamage_v={{{1,4},{20,11}},{{1,60},{20,60}},{{1,10},{20,10}}},
		addskilldamage1={
			[1]={{1,355},{2,355}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,74},{2,74}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1067},{2,1067}},
			[3]={{1,1},{20,50}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	zanan_yaojing={ --T¹p Nan D­îc Kinh	Hç trî phßng ngù - bÞ  ®éng 66
		poisonres_p={{{1,9},{20,39}},{{1,-1},{2,-1}}}
	},
	jiutian_kuanglei={ --Cöu Thiªn Cuång L«i 	Chñ ®éng hç trî c«ng kÝch 67
		lightingres_p={{{1,-9},{20,-49}},{{1,18*20},{20,18*90}}},
		--lightingresmax_p={{{1,-1},{25,-15},{26,-15}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,10},{20,60}}}
	},
	youming_kulou={ --U Minh Kh« L©u	C«ng kÝch néi c«ng 68
		poisondamage_v={{{1,11},{20,40}},{{1,60},{20,60}},{{1,10},{20,10}}},
		seriesdamage_p={{{1,5},{20,30}}},
		addskilldamage1={
			[1]={{1,353},{2,353}},
			[3]={{1,2},{20,85}}
		},
		addskilldamage2={
			[1]={{1,1066},{2,1066}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage3={
			[1]={{1,1094},{2,1094}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage4={
			[1]={{1,1096},{2,1096}},
			[3]={{1,1},{20,70}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,40},{20,40}}}
	},
	wuxing_gu={ --V« H×nh §éc	Vßng trßn  hç trî c«ng kÝch	69
		fastwalkrun_p={{{1,-10},{25,-50},{26,-50}},{{1,18*2},{20,18*2}}},
		poisondamage_v={
			[1]={{1,5},{20,25}},
			[2]={{1,20},{20,20}},
			[3]={{1,25},{2,25}}
		},
		skill_attackradius={{{1,484},{20,548}}},
		
	},
	chiyan_shitian={ --XÝch DiÖm Thùc Thiªn	Chñ ®éng hç trî c«ng kÝch	70
		fireres_p={{{1,-9},{20,-49}},{{1,18*20},{20,18*90}}},
		--fireresmax_p={{{1,-1},{25,-15},{26,-15}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,10},{20,60}}}
	},
	chuanxin_duci={ --Xuyªn T©m §éc ThÝch	Chñ ®éng hç trî chiÕn ®Êu	72
		poisonres_p={{{1,-29},{20,-49}},{{1,18*20},{20,18*90}}},
		--poisonresmax_p={{{1,-1},{25,-15},{26,-15}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,10},{20,60}}}
	},
	wangu_shixin={ --V¹n §éc Thùc T©m	Chñ ®éng hç trî c«ng kÝch	73
		poisontimereduce_p={{{1,-100},{20,-300}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,40},{20,40}}}
	},
	tiangang_disha={ --Thiªn C­¬ng §Þa S¸t	C«ng kÝch néi c«ng 	71
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		poisondamage_v={{{1,50},{20,135}},{{1,60},{20,60}},{{1,10},{20,10}}},
		addskilldamage1={
			[1]={{1,354},{2,354}},
			[3]={{1,2},{20,181}}
		},
		addskilldamage2={
			[1]={{1,1066},{2,1066}},
			[3]={{1,1},{20,20}}
		},
		addskilldamage3={
			[1]={{1,1094},{2,1094}},
			[3]={{1,1},{20,20}}
		},
		addskilldamage4={
			[1]={{1,1096},{2,1096}},
			[3]={{1,1},{20,140}}
		},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,60},{20,60}}}
	},
	zhuha_qingming={ --Chu C¸p Thanh Minh	C«ng kÝch ngo¹i c«ng  	74
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,30},{20,392}}},
		poisondamage_v={{{1,16},{20,53}},{{1,60},{20,60}},{{1,10},{20,10}}},
		addskilldamage1={
			[1]={{1,355},{2,355}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1067},{2,1067}},
			[3]={{1,1},{20,50}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,17},{20,55}}}
	},
	wudu_qijing={ --Ngò §éc Kú Kinh TrÊn Ph¸i Hç trî phßng ngù - chñ ®éng	75
		addpoisonmagic_v={{{1,5},{30,100}},{{1,-1},{20,-1}},{{1,11},{2,11}}},
		addpoisondamage_v={{{1,5},{30,45}},{{1,-1},{20,-1}},{{1,11},{2,11}}},
		--addpoisondamage_v={{{1,5},{30,100}},{{1,-1},{20,-1}},{{1,11},{2,11}}},
		poisonenhance_p={{{1,12},{30,20},{33,23},{35,25},{38,28}},{{1,-1},{2,-1}}},--thêi gian ®éc ph¸t
		deadlystrikeenhance_p={{{1,5},{30,45}},{{1,-1},{2,-1}}},--tÊn c«ng chÝ m¹ng
		lifemax_p={{{1,10},{35,10},{36,10}},{{1,-1},{30,-1}}},
		castspeed_v={{{1,1},{38,20},{39,21}},{{1,-1},{30,-1}}},
	},
	baidu_chuanxin={ --B¸ch §éc Xuyªn T©m 	C«ng kÝch néi c«ng 	384
		physicsenhance_p={{{1,10},{20,95}}}, 
		seriesdamage_p={{{1,5},{20,30}}},
		-- poisondamage_v={{{1,4},{20,20}},{{1,60},{20,60}},{{1,10},{20,10}}}, -- fix dame 1.3
		poisondamage_v={{{1,5},{20,26}},{{1,78},{20,78}},{{1,10},{20,10}}},
		addskilldamage1={
			[1]={{1,383},{2,383}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1095},{2,1095}},
			[3]={{1,1},{20,58}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,10},{20,32}}}
	},
	yinfeng_shigu={ --¢m Phong Thùc Cèt 	C«ng kÝch néi c«ng 	353
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		-- poisondamage_v={{{1,20},{15,50},{20,121}},{{1,60},{20,60}},{{1,10},{20,10}}}, -- fix dame 1.9 > 2.0
		poisondamage_v={{{1,40},{15,100},{20,242}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,30},{20,80}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,6},{2,6}},
			[3]={{1,388},{20,388}}
		},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,354},{20,354}}
		},
		addskilldamage1={
			[1]={{1,1066},{2,1066}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1094},{2,1094}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage3={
			[1]={{1,1096},{2,1096}},
			[3]={{1,1},{20,60}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(3540,1.15,1,1,5)},
							{2,SkillExpFunc(3540,1.15,2,1,5)},
							{3,SkillExpFunc(3540,1.16,3,1,5)},
							{4,SkillExpFunc(3540,1.17,4,1,5)},
							{5,SkillExpFunc(3540,1.18,5,1,5)},
							{6,SkillExpFunc(3540,1.19,6,1,5)},
							{7,SkillExpFunc(3540,1.20,7,1,5)},
							{8,SkillExpFunc(3540,1.21,8,1,5)},
							{9,SkillExpFunc(3540,1.22,9,1,5)},
							{10,SkillExpFunc(3540,1.23,10,1,5)},
							{11,SkillExpFunc(3540,1.24,11,1,5)},
							{12,SkillExpFunc(3540,1.23,12,1,5)},
							{13,SkillExpFunc(3540,1.22,13,1,5)},
							{14,SkillExpFunc(3540,1.21,14,1,5)},
							{15,SkillExpFunc(3540,1.20,15,1,5)},
							{16,SkillExpFunc(3540,1.19,16,1,5)},
							{17,SkillExpFunc(3540,1.18,17,1,5)},
							{18,SkillExpFunc(3540,1.17,18,1,5)},
							{19,SkillExpFunc(3540,1.16,19,1,5)},
							{20,SkillExpFunc(3540,1.15,20,1,5)},
							}},
	},
	zhuifeng_duji={ --Truy Phong §éc C¸t 	C«ng kÝch néi c«ng 	388	
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		poisondamage_v={{{1,1},{20,15}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	zhangwudu150={ --H×nh Tiªu Cèt LËp	C«ng kÝch néi c«ng 	1066
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		--poisondamage_v={{{1,20},{15,50},{20,121}},{{1,60},{20,60}},{{1,10},{20,10}}},
		poisondamage_v={{{1,25},{15,100},{20,215},{23,353},{26,422}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,35},{20,100},{23,120}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
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
	zhangwudu150_2={ --H×nh Tiªu Cèt LËp 2	C«ng kÝch néi c«ng 	1094
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		poisondamage_v={{{1,1},{20,25}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	tiangang_dushou={ --Thiªn C­¬ng §éc Thñ 	C«ng kÝch néi c«ng 	354	 am phong thuc cot tang 2
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		-- poisondamage_v={{{1,1},{20,15}},{{1,80},{20,60}},{{1,10},{20,10}}}, fix dame 20 > 25
		poisondamage_v={{{1,1},{20,25}},{{1,80},{20,60}},{{1,10},{20,10}}},
	},
	xuanyin_zhan={ --HuyÒn ¢m Tr¶m 	C«ng kÝch néi c«ng 	355 tang 1
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,15},{15,80},{20,173}}},
		-- poisondamage_v={{{1,20},{15,60},{20,120}},{{1,60},{20,60}},{{1,10},{20,10}}}, -- fix dame 1.3
		poisondamage_v={{{1,26},{15,78},{20,156}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,30},{20,60}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5000,1.15,1,1,3)},
							{2,SkillExpFunc(5000,1.15,2,1,3)},
							{3,SkillExpFunc(5000,1.16,3,1,3)},
							{4,SkillExpFunc(5000,1.17,4,1,3)},
							{5,SkillExpFunc(5000,1.18,5,1,3)},
							{6,SkillExpFunc(5000,1.19,6,1,3)},
							{7,SkillExpFunc(5000,1.20,7,1,3)},
							{8,SkillExpFunc(5000,1.21,8,1,3)},
							{9,SkillExpFunc(5000,1.22,9,1,3)},
							{10,SkillExpFunc(5000,1.23,10,1,3)},
							{11,SkillExpFunc(5000,1.24,11,1,3)},
							{12,SkillExpFunc(5000,1.23,12,1,3)},
							{13,SkillExpFunc(5000,1.22,13,1,3)},
							{14,SkillExpFunc(5000,1.21,14,1,3)},
							{15,SkillExpFunc(5000,1.20,15,1,3)},
							{16,SkillExpFunc(5000,1.19,16,1,3)},
							{17,SkillExpFunc(5000,1.18,17,1,3)},
							{18,SkillExpFunc(5000,1.17,18,1,3)},
							{19,SkillExpFunc(5000,1.16,19,1,3)},
							{20,SkillExpFunc(5000,1.15,20,1,3)},
							}},
		addskilldamage1={
			[1]={{1,1067},{2,1067}},
			[3]={{1,1},{20,32}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,10},{20,5},{60,1},{61,1}},
--			[3]={{1,383},{20,383}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,383},{20,383}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
	},
	xingkong_po={ --Tinh Kh«ng Ph¸ 	C«ng kÝch néi c«ng 	383
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		-- poisondamage_v={{{1,1},{20,10}},{{1,60},{20,60}},{{1,10},{20,10}}}, -- fix dame 1.3
		poisondamage_v={{{1,1},{20,15}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	daowudu150={ --U Hån PhÖ ¶nh	C«ng kÝch néi c«ng 	1067
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,18},{15,95},{20,208},{23,343},{26,411}}},
		--poisondamage_v={{{1,20},{15,30},{20,60}},{{1,60},{20,60}},{{1,10},{20,10}}},
		poisondamage_v={{{1,24},{15,72},{20,144},{23,230},{26,273}},{{1,60},{20,60}},{{1,10},{20,10}}},
		missle_speed_v={{{1,28},{20,30},{21,30}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,36},{20,72},{23,83}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_flyevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[2]={{1,10},{20,5},{60,1},{61,1}},
--			[3]={{1,383},{20,383}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1095},{20,1095}}
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
	daowudu150_2={ --Hån ¶nh Tïng Sanh	C«ng kÝch néi c«ng 	1232
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		poisondamage_v={{{1,1},{20,12},{23,15}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},
	duanjin_fugu={ --§o¹n C©n Hñ Cèt 	Chñ ®éng hç trî chiÕn ®Êu	390
		allres_p={{{1,-1},{20,-40}},{{1,18*20},{20,18*90}}},
		--allresmax_p={{{1,-1},{20,-10},{21,-10}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,60},{20,120}}}
	},
	chuanyi_pojia={ --Xuyªn Y Ph¸ Gi¸p 	Chñ ®éng hç trî c«ng kÝch	356
		physicsres_p={{{1,-9},{20,-49}},{{1,18*20},{20,18*90}}},
		--physicsresmax_p={{{1,-1},{20,-15},{20,-15}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,10},{20,60}}}
	},
	wudu120={ --HÊp Tinh YÓm	hç trî bÞ ®éng 	711 - Kü n¨ng 120 Ngò §éc
		autoattackskill={{{1,719*256 + 1},{20,719*256 + 20},{21,719*256 + 21}},{{1,-1},{20,-1}},{{1,10*18*256 + 1},{15,10*18*256 + 12},{20,10*18*256 + 15},{21,10*18*256 + 15}}},
		skill_desc=
			function(level)
				return "X¸c suÊt <color=orange>"..floor(Link(level,SKILLS.wudu120.autoattackskill[3]) - 10*18*256).."%<color> khiÕn cho ®èi th­¬ng bÞ ®éc s¸t\n"..
				", ®ång thêi lµm gi¶m <color=orange>"..floor(Link(level,SKILLS.wudu120zuzhou.poison2decmana_p[1])).."%<color> néi lùc ®èi ph­¬ng"..
				" trong <color=orange>"..floor(Link(level,SKILLS.wudu120zuzhou.poison2decmana_p[2]) / 18).." gi©y<color>\n"..
				" <color=orange>"..floor((Link(level,SKILLS.wudu120.autoattackskill[3]) / (18*256))).." gi©y<color> sau míi cã thÓ thi triÓn tiÕp"
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
	},
	wudu120zuzhou={ --HÊp Tinh YÓm_QuyÕt Chó	Chó thuËt	719
		poison2decmana_p={{{1,30},{15,80},{20,85},{21,85}},{{1,3*18},{15,5*18},{20,6*18},{21,6*18}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

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

-----------------------------------------------------------
--º¯ÊýGetSkillLevelData(levelname, data, level)
--levelname£ºÄ§·¨ÊôÐÔÃû³Æ
--data£º¼¼ÄÜÃû³Æ
--level£º¼¼ÄÜµÈ¼¶
--return£ºµ±¼¼ÄÜÃû³ÆÎªdata£¬¼¼ÄÜµÈ¼¶Îªlevel
--			Ê±µÄÄ§·¨ÊôÐÔlevelnameËùÐèÇóµÄÈý¸ö²ÎÊýµÄ¾ßÌåÖµ
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
