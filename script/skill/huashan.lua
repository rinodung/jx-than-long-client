-------------------------------------------------------------------------
-- FileName		:	huashan.lua - Hoa S¬n
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/huashan.lua
-------------------------------------------------------------------------
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--»ªÉ½
	baihong_guanri={ --Bach Hong quan Nhat
		physicsenhance_p={
			[1]={{1,30},{20,100}},
		},
		seriesdamage_p={{{1,1},{20,10}}},
		colddamage_v={
			[1]={{1,10},{20,80}},
			[3]={{1,20},{20,80}}
		},
		reduceskillcd1={
			[1]={{1,1368},{2,1368}},
			[3]={{1,6},{20,18*1}}
		},
		reduceskillcd2={
			[1]={{1,1363},{2,1363}},
			[3]={{1,6},{20,18*1}}
		},
		addskilldamage1={
			[1]={{1,1351},{2,1351}},
			[3]={{1,1},{20,30}}
		},
		addskilldamage2={
			[1]={{1,1355},{2,1355}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage3={
			[1]={{1,1360},{2,1360}},
			[3]={{1,1},{20,30}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,1},{20,10}}},

	},
	
	jianzong_zongjue={ --Kiem Tong Tong Quyet
		addphysicsdamage_p={{{1,15},{20,200},{26,250},{32,320},{33,320}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		deadlystrikeenhance_p={{{1,1},{20,20}},{{1,-1},{2,-1}}},
	--	attackspeed_v={{{1,12},{20,75},{23,83},{25,90},{28,99},{42,111},{43,119},{44,122}},{{1,-1},{2,-1}}},
	--	manamax_p={{{1,-1000},{20,-1000}},{{1,-1},{2,-1}}},
	--	lifemax_p={{{1,10},{25,30},{36,30}},{{1,-1},{2,-1}}},
	--	anti_hitrecover={{{1,1},{20,5}},{{1,-1},{2,-1}}},
	--	castspeed_v={{{1,-1000},{20,-1000}},{{1,-1},{2,-1}}},
	},
	yangwu_jianfa={ --Duong Ngo Kiem Phap
		deadlystrikeenhance_p={{{1,6},{30,36},{31,38},{32,38}},{{1,-1},{2,-1}}},
	--	addphysicsdamage_p={{{1,5},{20,100},{21,105}},{{1,-1},{2,-1}}},
	--	anti_hitrecover={{{1,1},{4,1},{20,5},{21,5}},{{1,-1},{2,-1}}},
		--manamax_p={{{1,-1000},{20,-1000}},{{1,-1},{2,-1}}},
	},
	jinyan_hengkong={ --Kim Nhan Hoanh Khong
	--	seriesdamage_p={{{1,10},{20,20}}},
	--	colddamage_v={
	--		[1]={{1,35},{20,450}},
	--		[3]={{1,45},{20,550}}
	--	},
	--	deadlystrike_p={{{1,6},{20,40}},{{1,-1},{2,-1}}},
		physicsenhance_p={
			[1]={{1,10},{20,50}},
		},
		reduceskillcd1={
			[1]={{1,1363},{2,1363}},
			[3]={{1,6},{20,18*1}}
		},
		reduceskillcd2={
			[1]={{1,1368},{2,1368}},
			[3]={{1,6},{20,18*1}}
		},
		addskilldamage1={
			[1]={{1,1355},{2,1355}},
			[3]={{1,10},{20,70}}
		},
		addskilldamage2={
			[1]={{1,1363},{2,1363}},
			[3]={{1,1},{20,50}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,20},{20,40}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.podao_pojian1.candetonate1[3]))
				return format("Kh¾c chÕ kü n¨ng\n<color=blue>Huy S­ DiÖt Lç<color>, <color=blue>Trõ Gian DiÖt NÞnh<color>\ntrong ph¹m vi <color=orange>%d<color>.\n", nMag)
			end,
	},
	podao_pojian={ 
		candetonate1={
			[1]={{1,323*256+1},{2,323*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate2={
			[1]={{1,326*256+1},{2,326*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate3={
			[1]={{1,329*256+1},{2,329*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	podao_pojian1={ --ÆÆÎä»ê
		candetonate1={
			[1]={{1,528*256+1},{2,528*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate2={
			[1]={{1,580*256+1},{2,580*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	xiyi_jianfa={ --Hi Di Kiem Phap
	--	anti_hitrecover={{{1,1},{4,1},{20,5},{21,5}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,10},{20,100},{21,100}},{{1,18},{20,18}},{{1,6},{2,6}}},
		deadlystrikeenhance_p={{{1,1},{20,5}},{{1,18},{20,18}}},

	},
	tianshen_daoxuan={ --Thien Than Dao Huyen
		seriesdamage_p={{{1,5},{20,50}}},
		-- colddamage_v={
			-- [1]={{1,35},{20,315}},
			-- [3]={{1,45},{20,450}}
		-- },
	--	deadlystrike_p={{{1,1},{20,10},{21,12}},{{1,-1},{2,-1}}},
		physicsenhance_p={
			[1]={{1,15},{20,300}},
		},
		reduceskillcd1={
			[1]={{1,1363},{2,1363}},
			[3]={{1,6},{20,18*1}}
		},
		reduceskillcd2={
			[1]={{1,1368},{2,1368}},
			[3]={{1,6},{20,18*1}}
		},
		addskilldamage1={
			[1]={{1,1363},{2,1363}},
			[3]={{1,15},{20,50},{21,50}}
		},
		addskilldamage2={
			[1]={{1,1368},{2,1368}},
			[3]={{1,1},{20,70}}
		},
		deadlystrike_p={{{1,1},{20,20}}},
		skill_misslenum_v={{{1,1},{10,1},{11,2},{20,2}}},
		--skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		-- skill_desc=
			-- function(level)
				-- -- local nMag = floor(Link(level,SKILLS.pogun_poqiang.candetonate1[3]))
				-- local nTia = floor(Link(level,SKILLS.tianshen_daoxuan.skill_misslenum_v[1]))
				-- local nTiaMax = floor(Link(level,SKILLS.tianshen_daoxuan.skill_misslenum_v[1]))				
				-- return format("\nSè l­îng tia r¬i xuèng: <color=orange>%d<color>/2 tia\n", nTia)
			-- end,
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6860,1.15,1,10,1)},
							{2,SkillExpFunc(6860,1.15,2,10,1)},
							{3,SkillExpFunc(6860,1.16,3,10,1)},
							{4,SkillExpFunc(6860,1.17,4,10,1)},
							{5,SkillExpFunc(6860,1.18,5,10,1)},
							{6,SkillExpFunc(6860,1.19,6,10,1)},
							{7,SkillExpFunc(6860,1.20,7,10,1)},
							{8,SkillExpFunc(6860,1.21,8,10,1)},
							{9,SkillExpFunc(6860,1.22,9,10,1)},
							{10,SkillExpFunc(6860,1.23,10,10,1)},
							{11,SkillExpFunc(6860,1.24,11,10,1)},
							{12,SkillExpFunc(6860,1.23,12,10,1)},
							{13,SkillExpFunc(6860,1.22,13,10,1)},
							{14,SkillExpFunc(6860,1.21,14,10,1)},
							{15,SkillExpFunc(6860,1.20,15,10,1)},
							{16,SkillExpFunc(6860,1.19,16,10,1)},
							{17,SkillExpFunc(6860,1.18,17,10,1)},
							{18,SkillExpFunc(6860,1.17,18,10,1)},
							{19,SkillExpFunc(6860,1.16,19,10,1)},
							{20,SkillExpFunc(6860,1.15,20,10,1)},
							}},
	},
	

	pogun_poqiang={
		candetonate1={
			[1]={{1,336*256+1},{2,336*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate2={
			[1]={{1,337*256+1},{2,337*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		
	},
	huanyan_yunyan={ --Huyen Nhan Van Yen
		attackspeed_v={{{1,25},{20,65},{33,92},{35,118},{38,124},{39,126}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,26},{30,81},{33,86},{35,101},{36,103}},{{1,-1},{2,-1}}},
		addcoldmagic_v={{{1,20},{30,315}},{{1,60*18},{2,180*18}}},
		addcolddamage_v={{{1,10},{30,100},{35,100}},{{1,60*18},{2,180*18}}},
		coldenhance_p={{{1,5},{2,7},{30,20},{32,21}},{{1,60*18},{2,180*18}}},
		-- lifemax_p={{{1,21},{30,20},{31,20}},{{1,60*18},{2,180*18}}},   
		fatallystrikeres_p={{{1,10},{30,30}},{{1,60*18},{2,180*18}}},
		fastwalkrun_p={{{1,10},{30,60}},{{1,60*18},{2,180*18}}},
	--	magicenhance_p={{{1,10},{30,20}},{{1,60*18},{2,180*18}}},
	--	anti_coldres_p={{{1,10},{30,20}},{{1,60*18},{2,180*18}}},
	},
	
	cangsong_yingke={ --Thuong Tung Nghenh khach
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		colddamage_v={
			[1]={{1,10},{20,30},{26,40},{32,50}},
			[3]={{1,10},{20,30},{26,40},{32,50}}
		},
		deadlystrike_p={{{1,10},{20,38},{21,38}},{{1,-1},{2,-1}}},
		physicsenhance_p={
			[1]={{1,1},{20,80},{21,85}},
		},
		reduceskillcd1={
			[1]={{1,1363},{2,1363}},
			[3]={{1,6},{20,18*1}}
		},
		reduceskillcd2={
			[1]={{1,1368},{2,1368}},
			[3]={{1,6},{20,18*1}}
		},
		addskilldamage1={
			[1]={{1,1363},{2,1363}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1355},{2,1355}},
			[3]={{1,1},{20,80}}
		},
		skill_misslenum_v={{{1,1},{10,1},{11,2},{15,2},{19,3},{20,3}}},
		--skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,30},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_desc=
			function(level)
				local nTia = floor(Link(level,SKILLS.cangsong_yingke.skill_misslenum_v[1]))
				local nMag = floor(Link(level,SKILLS.poanqi_pozhang.candetonate1[3]))
				return format("Kh¾c chÕ kü n¨ng\n<color=blue>V« ¶nh Xuyªn<color>, <color=blue>ThiÕt Liªn Tø S¸t<color>, <color=blue>Cµn Kh«n NhÊt TrÞch<color>\ntrong ph¹m vi <color=orange>%d<color>.\n", nMag)
			end,
	},
	
	poanqi_pozhang={ --ÆÆÌÆÃÅ
		candetonate1={
			[1]={{1,331*256+1},{2,331*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate2={
			[1]={{1,332*256+1},{2,332*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		candetonate3={
			[1]={{1,333*256+1},{2,333*256+1}},
			[3]={{1,10},{15,25},{26,128},{27,128}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	
--	liushui={--Á÷Ë®1
--		fastwalkrun_p={{{1,9},{20,66}},{{1,18},{2,18}}}
--	},
	duoming_lianhuan={ --Thai Nhac Thanh Tang 2
		physicsenhance_p={{{1,10},{15,156},{20,230}}},
		seriesdamage_p={{{1,10},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{20,65}},
			[3]={{1,10},{20,65}}
		},
		fatallystrike_p={{{1,1},{20,10}}},
		deadlystrike_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,1368},{2,1368}},
			[3]={{1,1},{20,50}}
		},
		
		skill_misslenum_v={{{1,1},{10,1},{11,2},{19,2},{20,3},{30,3}}},
--		missle_speed_v={{{1,28},{20,32},{21,32}}},
--		skill_attackradius={{{1,448},{20,512},{21,512}}},
--		skill_cost_v={{{1,30},{20,35}}}
		
	},
	duoming_start={ --Doat Menh Lien Hoan Tam Lien Kich
		--autoreplyskill={{{1,1363*256 + 1},{20,1363*256 + 20},{21,1363*256 + 21}},{{1,10*60*18},{20,10*60*18}},{{1,15*18*256 + 1},{20,15*18*256 + 3},{31,15*18*256 + 3},{32,15*18*256 + 3}}},
		autoattackskill={
				{{1,1363*256 + 1},{20,1363*256 + 20},{21,1363*256 + 21}},
				{{1,10*60*18},{20,10*60*18}},	
				{{1,10*18*256 + 5},{20,10*18*256 + 5},{31,10*18*256 + 5},{32,10*18*256 + 5}}},
		-- manamax_p={{{1,-500},{20,-500}},{{1,-1},{2,-1}}},
		-- manareplenish_v={{{1,-10000},{20,-10000}},{{1,10*60*18},{2,10*60*18}}},
		-- manareplenish_p={{{1,-200},{20,-200}},{{1,10*60*18},{2,10*60*18}}},
		skill_cost_v={{{1,10},{20,20}}},

		skill_skillexp_v={{	
							{1,SkillExpFunc(5330,1.15,1,8,1)},
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
		skill_desc=
			function(level)
				local nMag = floor(Link(level,SKILLS.duoming_start.autoattackskill[3])-10*18*256)  
				local nKiem = floor(Link(level,SKILLS.duoming_lianhuan.skill_misslenum_v[1]))
				local nPois = floor(Link(level,SKILLS.duoming_start.autoattackskill[3])/2/18/256)
				return format("<color=red>§éc C« Cöu KiÕm<color>\n§ßn ®¸nh cã <color=orange>%d%%<color> tû lÖ xuÊt <color=blue>Th¸i Nh¹c Thanh Phong<color>\nThêi gian håi chiªu: <color=orange>%d<color> gi©y", nMag,nPois)
			end,
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	
	zixia_jianqi={ --Tu Ha Kiem Khi
		autorescueskill={{{1,1366*256 + 1},{20,1366*256 + 15},{21,1366*256 + 16}},{{1,-1},{20,-1}},{{1,20*18*256 + 1},{20,20*18*256 + 70},{21,20*18*256 + 70}}},
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
			skill_desc=
			function(level)
				local nMag =  floor(Link(level,SKILLS.zixia_jianqi.autorescueskill[3]) - 20*18*256)
				local nPois = floor(Link(level,SKILLS.zixia_xiaoguo.lifereplenish_v[1]))
				local nTime = floor(Link(level,SKILLS.zixia_xiaoguo.lifereplenish_v[2])/18)
				local nCast = floor(Link(level,SKILLS.zixia_jianqi.autorescueskill[3])/(18*256))
				return format("Khi sinh mÖnh hao tæn vÒ d­íi <color=red>25%%<color> sÏ cã x¸c suÊt <color=orange>%d%%<color> håi phôc\n <color=red>%d<color> ®iÓm mçi nöa gi©y, kÐo dµi trong <color=orange>%d<color> gi©y.\nTrong vßng <color=orange>%d<color> gi©y sau míi cã thÓ thi triÓn tiÕp\n", nMag, nPois, nTime, nCast)
			end,
	},
	
	zixia_xiaoguo={
		lifereplenish_v={{{1,100},{20,1000}},{{1,18*1},{20,18*5},{22,18*5},{24,18*6},{25,18*6}}},
	},
	
	jiujian_heyi={ --Doc Co 9 Kiem
		physicsenhance_p={{{1,3},{15,70},{20,100}}},
		seriesdamage_p={{{1,10},{20,70},{21,71}}},
		fatallystrike_p={{{1,1},{20,20}}},
		colddamage_v={
			[1]={{1,15},{20,100}},
			[3]={{1,15},{20,100}}
		},
		deadlystrike_p={{{1,15},{20,30}}},
		skill_misslenum_v={{{1,4},{20,9},{21,9}}},
--		missle_speed_v={{{1,28},{20,32},{21,32}}},
--		skill_attackradius={{{1,448},{20,512},{21,512}}},
--		skill_cost_v={{{1,30},{20,35}}}

	},
	
	jiujian_start={ --Cuu Kiem Hop Nhat 	
		autoattackskill={
				{{1,1368*256 + 1},{20,1368*256 + 20},{21,1368*256 + 21}},
				{{1,10*60*18},{20,10*60*18}},	
				{{1,15*18*256 + 5},{20,15*18*256 + 10},{31,15*18*256 + 15},{32,15*18*256 + 15}}},
		manareplenish_v={{{1,-10000},{20,-10000}},{{1,10*60*18},{2,10*60*18}}},
		manareplenish_p={{{1,-200},{20,-200}},{{1,10*60*18},{2,10*60*18}}},
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
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
		skill_desc=
			function(level)
				local nMag = floor(Link(level,SKILLS.jiujian_start.autoattackskill[3])-15*18*256)
				local nPois = floor(Link(level,SKILLS.jiujian_start.autoattackskill[3])/18/256)
				return format("§ßn ®¸nh cã <color=orange>%d%%<color> tû lÖ xuÊt <color=blue>§éc C« Cöu KiÕm<color>,\nThêi gian håi chiªu: <color=orange>%d<color> gi©y.", nMag,nPois)
			end,
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	
	haoran_zhiqi={ -- H¹o Nhiªn Chi KhÝ
		block_rate={
			[1]={{1,1},{20,5},{21,5}},
			[2]={{1,-1},{20,-1}},
			[3]={{1,1},{19,1},{20,2},{30,3},{31,3}},
		},
		skill_desc=
			function(level)
				--local nMag = floor(Link(level,SKILLS.haoran_zhiqi.addblockrate[3]))
				local nPois = floor(Link(level,SKILLS.haoran_zhiqi.block_rate[1]))
				return format ("§ång ®éi xung quanh ®­îc t¨ng %d%% tØ lÖ hãa gi¶i s¸t th­¬ng.\n", nPois)
				--return format ("%d ®ång ®éi xung quanh ®­îc t¨ng %d%% tØ lÖ hãa gi¶i s¸t th­¬ng.", nMag, nPois)
			end,
			skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},
	},
	
	wuji_jianqi1={ --ÎÞ¼«½£Æø1
		lifemax_p={{{1,5},{20,50},{31,100},{32,100}},{{1,10},{31,18},{32,18}}},
		-- lifemax_yan_p={{{1,5},{25,60},{31,70},{32,70}},{{1,10},{31,18},{32,18}}},
		lifereplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		colddamage_v={
			[1]={{1,24},{15,420},{20,730},{23,942},{26,1148}},
			[3]={{1,36},{15,480},{20,900},{23,1164},{26,1596}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,30},{20,400},{26,500},{31,800},{32,800}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng bïng næ t¹o thµnh <color=orange>%d<color> ®iÓm s¸t th­¬ng thuéc tÝnh b¨ng,\n®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%.2f<color> gi©y,\n", nMag, nPois)
			end,
		
	},
	
	qingfeng_songshuang={ --Thanh Van Tong sang
			seriesdamage_p={{{1,1},{20,20}}},
			skill_cost_v={{{1,10},{20,20},{26,20}}},
			colddamage_v={
				[1]={{1,10},{20,220}},
				[3]={{1,20},{20,220}}
			},
			addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,50}}
			},
			skill_eventskilllevel={{{1,1},{20,20}}},
			skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	
	wuji_jianqi2={ --ÎÞ¼«½£Æø2
		candetonate1={
			[1]={{1,419*256+0},{2,419*256+0}},
			[3]={{1,100},{26,180},{31,300},{32,300}},
		},
	},
	
	longraoshen={ --Hoa Son chuong phap
		addcoldmagic_v={{{1,20},{20,350}},{{1,-1},{2,-1}}},
	},
	
	haina_baichuan={ --Hai Bach Nap Xuyen
	--	damage2addmana_p={{{1,1},{20,10}},{{1,-1},{20,-1}}},
		skill_enhance={{{1,1},{20,40}},{{1,-1},{20,-1}}},
		-- fastwalkrun_p={{{1,20},{20,56}},{{1,-1},{20,-1}}},

	},
	
	longxuan_jianqi2={  --Long Huyen Kiem Khi 2
		candetonate1={
			[1]={{1,421*256+0},{2,421*256+0}},
			[3]={{1,360},{26,360},{31,360},{32,360}},
		},
	},
	
	longxuan_jianqi1={ --ÁúÐý½£Æø1
		sorbdamage_p={{{1,5},{20,15}},{{1,18},{2,18}}},
	--	anti_do_hurt_p={{{1,1},{15,3},{20,5},{31,5},{32,5}},{{1,18},{2,18}}},
		lifemax_p={{{1,2},{20,40},{21,40}},{{1,18},{2,18}}},
		lifereplenish_v={{{1,1},{20,10}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,5}},{{1,18},{2,18}}},
		skill_enhance={{{1,1},{20,20}},{{1,18},{2,18}}},
	--	lifemax_yan_p={{{1,5},{15,10},{25,15},{31,20},{32,20}},{{1,10},{31,18},{32,18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,20},{20,200}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng bïng næ t¹o thµnh <color=orange>%d<color> ®iÓm s¸t th­¬ng thuéc tÝnh b¨ng, ®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%.2f<color> gi©y,\n", nMag, nPois)
			end,
		addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,80}}
			},
	},
	
	qizhen_shanhe={ --Khi Chan Son ha
	--	castspeed_v={{{1,12},{20,85},{23,93},{25,99},{28,109},{42,111},{43,119},{44,122}},{{1,-1},{2,-1}}},
		coldenhance_p={{{1,1},{20,30}},{{1,-1},{2,-1}}},

	},
	
	qiguan_changhong={ --Khi Quang truong hong
		addcoldmagic_v={{{1,20},{20,200}},{{1,-1},{2,-1}}},
		addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,35}}
			},
	},
	
	moyun_jianqi2={ --Ä¦ÔÆ½£Æø2
		candetonate1={
			[1]={{1,423*256+0},{2,423*256+0}},
			[3]={{1,360},{26,360},{31,360},{32,360}},
		},
	},
	
	moyun_jianqi1={ --Ä¦ÔÆ½£Æø1
		fastwalkrun_p={{{1,-1},{15,-15},{20,-20},{32,-32},{33,-32}},{{1,18},{2,18}}},
		skill_enhance={
			[1]={{1,-1},{15,-5},{20,-20},{33,-20},{34,-20}},
			[2]={{1,18},{20,18}},
			[3]={},
			},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,30},{20,400},{26,500},{31,800},{32,800}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng bïng næ t¹o thµnh <color=orange>%d<color> ®iÓm s¸t th­¬ng thuéc tÝnh b¨ng,\n®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%.2f<color> gi©y,\n", nMag, nPois)
			end,
		addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,80}}
			},
	},
	
	shenguang_xuanrao={ --Ma Van Kiem Khi
		fastwalkrun_p={{{1,-5},{15,-20},{20,-40},{32,-52}},{{1,18},{2,18}}},
		-- skill_enhance={
			-- [1]={{1,-5},{15,-25},{20,-85},{33,-135},{34,-137}},
			-- [2]={{1,18},{20,18}},
			-- [3]={},
			-- },
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,20},{20,200}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng sau <color=orange>10 gi©y<color> sÏ ph¸t næ\nG©y ra <color=orange>%d<color> b¨ng s¸t,\n®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%s<color>.\n", nMag, nPois)
			end,
			addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,60},{31,70}}
			},
	},
	
	qisha_qichang2={ --ÆßÉ±Æø³¡2
		candetonate1={
			[1]={{1,419*256+0},{2,419*256+0}},
			[3]={{1,360},{26,360},{31,360},{32,360}},
		},
		candetonate2={
			[1]={{1,428*256+0},{2,428*256+0}},
			[3]={{1,360},{26,360},{31,360},{32,360}},
		},
	},
	shenguang_xuanrao1={ -- ThÇn Quang Toµn NhiÔu
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,10},{15,300},{20,1100},{26,1300},{31,1500},{32,1600}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng sau <color=orange>%s<color> sÏ ph¸t næ\nG©y ra <color=orange>%d<color> b¨ng s¸t,\n®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%s<color>.\n", nMag, nPois)
			end,
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
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	
	new_wuji={ --Kiem Khi Vo Cap Tang 2 
	--	sorbdamage_p={{{1,1},{20,20},{21,21}},{{1,18},{2,18}}},
	--	anti_do_hurt_p={{{1,1},{15,5},{20,10},{31,20},{32,21}},{{1,18},{2,18}}},
	--	lifemax_p={{{1,5},{15,25},{20,80},{31,100}},{{1,10},{31,18},{32,18}}},
	--	lifereplenish_p={{{1,1},{15,20},{25,25},{31,25}},{{1,10},{31,18},{32,18}}},
	--	lifereplenish_v={{{1,1},{15,4},{25,15},{26,15}},{{1,18},{2,18}}},
	--	manareplenish_v={{{1,1},{15,4},{25,15},{26,15}},{{1,18},{2,18}}},
		allres_p={{{1,1},{20,10},{21,10}},{{1,-1},{2,-1}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		skill_cost_v={{{1,30},{20,400},{26,500},{31,800},{32,800}}},
		skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				return format("KhÝ tr­êng bïng næ t¹o thµnh <color=orange>%d<color> ®iÓm s¸t th­¬ng thuéc tÝnh b¨ng,\n®ång thêi lµm kÎ ®Þch ®øng yªn <color=orange>%s<color> gi©y,\n", nMag, nPois)
			end,
	},
	
	longxuan2={ --ÁúÐý2
		seriesdamage_p={{{1,10},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,40},{20,1000},{28,1400}},
			[3]={{1,40},{20,1000},{28,1400}}
		},
		frozen_action=
			{
				[1]={{1,1},{20,1}},
				[2]={{1,1},{15,3},{20,18},{31,18},{32,18}},
				[3]={{1,1},{20,1}}
			},
		
	},
	
	pishi_poyu={ --Phach Thach Pha Ngoc
		seriesdamage_p={{{1,10},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,36},{20,700}},
			[3]={{1,46},{20,950}}
		},
		skill_cost_v={{{1,30},{20,65}}},
		skill_misslenum_v={{{1,1},{10,1},{11,2},{15,2},{16,3},{20,3}}},
		-- skill_desc=
			-- function(level)
				-- return "<color=red>Lôc M¹nh ThÇn C«ng<color>\nSè l­îng khÝ c«ng xuÊt ra: <color=orange>"..floor(Link(level,SKILLS.pishi_poyu.skill_misslenum_v[1])).."<color> khÝ\n"
			-- end,
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	
							{1,SkillExpFunc(5330,1.15,1,8,1)},
							{2,SkillExpFunc(5330,1.15,2,8,1)},
							{3,SkillExpFunc(5330,1.16,3,8,1)},
							{4,SkillExpFunc(5330,1.17,4,8,1)},
							{5,SkillExpFunc(5330,1.18,5,8,1)},
							{6,SkillExpFunc(5330,1.19,6,8,1)},
							{7,SkillExpFunc(5330,1.20,7,8,1)},
							{8,SkillExpFunc(5330,1.21,8,8,1)},
							{9,SkillExpFunc(5330,1.22,9,8,1)},
							{10,SkillExpFunc(5330,1.23,10,8,1)},
							{11,SkillExpFunc(5330,1.24,11,10,1)},
							{12,SkillExpFunc(5330,1.23,12,10,1)},
							{13,SkillExpFunc(5330,1.22,13,10,1)},
							{14,SkillExpFunc(5330,1.21,14,10,1)},
							{15,SkillExpFunc(5330,1.20,15,10,1)},
							{16,SkillExpFunc(5330,1.19,16,14,1)},
							{17,SkillExpFunc(5330,1.18,17,14,1)},
							{18,SkillExpFunc(5330,1.17,18,14,1)},
							{19,SkillExpFunc(5330,1.16,19,14,1)},
							{20,SkillExpFunc(5330,1.15,20,14,1)},
						}},
	},
	pishi_poyu2={ -- Thien Dinh Cong
		seriesdamage_p={{{1,10},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,36},{15,280},{20,500},{23,964},{26,1396}},
			[3]={{1,46},{15,424},{20,860},{23,1483},{26,2544}}
					},
		-- missle_speed_v={{{1,28},{20,32},{21,32}}},
		-- skill_misslenum_v={{{1,4},{20,9},{21,9}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--¸ù¾Ý2¸öµã£¬ÇóÏßÐÎº¯Êýf(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--µ±x2=x1, ÓÐx=c,¸ÃÖ±ÏßÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£º
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--¸ù¾Ý2¸öµã£¬Çó2´ÎÐÎº¯Êýf(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--µ±x1»òÕßx2 < 0 ,y =0
--µ±x2=x1, ÓÐx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£ºextrac
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
--¸ù¾Ý2¸öµã£¬Çó-2´ÎÐÎº¯Êýf(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--µ±x2»òÕßx1<0, y=0,
--µ±x1=x2,ÓÐx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£ºextrac
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
--Ãè»æÁ¬½ÓÏß:Link(x,points)
--¸ù¾ÝpointsÌá¹©µÄÒ»ÏµÁÐµã£¬ÓÃÏàÁÚµÄÁ½¸öµãÃè»æÇúÏß
--return yÖµ
--x ÊäÈëÖµ
--points µã¼¯ºÏ
--ÐÎÈç£ºpointsÊÇÐÎÈç{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}µÄÓ³Éä
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
--¼¼ÄÜÉè¶¨¸ñÊ½ÈçÏÂ£º
--SKILLS={
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¡£¡£¡£¡£¡£
--}
--Èç£º
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--Ä§·¨ÊôÐÔphysicsenhance_p²ÎÊý1£¬1¼¶Ê±Îª35£¬20¼¶Ê±Îª335£¬ÇúÏß²»Ìî£¬Ä¬ÈÏÏßÐÎ
--			[2]={{1,0},{20,0}},
--		},--Ã»ÓÐ[3]£¬±íÊ¾Ä§·¨ÊôÐÔphysicsenhance_p²ÎÊý2£¬Ä¬ÈÏÎªÈÎºÎÊ±ºò¶¼ÊÇ0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--ÒÔÉÏÃèÊö¼¼ÄÜ¡°Èý»·Ì×ÔÂ¡±µÄÄ§·¨ÊôÐÔºÍÊýÖµ
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

