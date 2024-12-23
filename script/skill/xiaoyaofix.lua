--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--剑逍遥
	wugoushuangxue={ --Ng� c﹗ sng tuy誸
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,5*1.5},{20,60*1.5}}},
		lightingdamage_v={
			[1]={{1,15},{20,110}},
			[3]={{1,15},{20,160}}
		},
		addskilldamage1={
			[1]={{1,1887},{2,1887}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage2={
			[1]={{1,1892},{2,1892}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage3={
			[1]={{1,1896},{2,1896}},
			[3]={{1,1},{20,50}}
		},
		skill_cost_v={{{1,10},{20,10}}}
	},

	xiaoyaojianfa ={ --Ti猽 dao ki誱 ph竝
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		deadlystrikeenhance_p={{{1,5},{20,25}},{{1,-1},{2,-1}}}
	},

	yigonghuanyu={ --Di cung ho竛 v�
		addphysicsdamage_p={{{1,25},{20,215}},{{1,18*60},{20,18*60}}},
		deadlystrikeenhance_p={{{1,1},{20,35}},{{1,18*60},{20,18*60}}},

		--poisontimereduce_p={{{1,1},{20,30}},{{1,-1},{2,-1}}},
		-- skill_desc=
			-- function(level)
				-- return "M鏸 <color=orange>"..floor(Link(level,SKILLS.yigonghuanyu.autocastskill[3]) / 18/256).." gi﹜<color> t� ng t╪g <color=orange>"..floor(Link(level,SKILLS.yinlv.special_point_add[3])).." [ Giai]<color>\n"
				-- .."最多拥有<color=orange>"..floor(Link(level,SKILLS.yigonghuanyu.special_point_base[3])).."层【音律】<color>"
			-- end,
		-- autocastskill = {
			-- {{1,1884*256 + 1},{20,1884*256 + 20}},--目标技能id * 256 + 等级
			-- {{1,-1},{20,-1}},-- 为1表示算CD，不算CD填-1
			-- {{1, (1*18*256 + 100)},{20, (1*18*256 + 100)}},-- 间隔帧数 * 256 + 发动几率
		-- },
		-- special_point_base={
			-- {{1,1883},{20,1883}},-- 目标技能id
			-- {{1,-1},{20,-1}},-- 配在主动技能属性上填0，作为buff属性填-1
			-- {{1,10},{20,10}},-- 增加个数
		-- }
	-- },
	-- yinlv={ --移宫换羽-音律（主动）
		-- special_point_add={
			-- {{1,1883},{20,1883}},-- 目标技能id
			-- {{1,0},{20,0}},-- 配在主动技能属性上填0，作为buff属性填-1
			-- {{1,1},{20,1}},-- 增加个数
		-- }
	},

	sataliuxing={ --T竝 p l璾 tinh
		-- cost_sp={
			-- {{1,1883},{20,1883}},  -- 目标技能id
			-- {{1,0},{20,0}}, -- 填零
			-- {{1,8},{20,3},{21,3}}, -- 吃几个
		-- },
		skill_param1_v={{{1,480},{15,480}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_mintimepercast_v={{{1,25*18},{20,15*18},{30,10*18},{31,10*18},{32,10*18}}},
		skill_desc=
			function(level)
				return "<color=red>L╪g Ba Vi B�<color>\n"..
				"Kho竛g c竎h t鑙 產 <color=orange>"..floor(Link(level,SKILLS.sataliuxing.skill_param1_v[1])).."<color>\n"..
				"Th阨 gian kh玦 ph鬰 chi猽 th鴆: <color=orange>"..floor(Link(level,SKILLS.sataliuxing.skill_mintimepercast_v[1]) / 18).." gi﹜<color>\n"
			end,
	},
	
	yijianfutian={ --Nh蕋 ki誱 ph竧 thi猲
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,55},{20,350}}},
		stun_p={{{1,5},{20,15},{21,15}},{{1,1},{20,12},{21,12}}},
		lightingdamage_v={
			[1]={{1,45},{20,360}},
			[3]={{1,45},{20,420}}
		},
		addskilldamage1={
			[1]={{1,1891},{2,1891}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1896},{2,1896}},
			[3]={{1,1},{20,50}}
		},
		skill_cost_v={{{1,15},{20,40}}}
	},

	yinanbaima={ --Ng﹏ y猲 b筩h m�
		fastwalkrun_p={{{1,22},{20,60}},{{1,-1},{20,-1}}},
	},

	xiagurouqing={	--cao son luu thuy
		dynamicmagicshield_v={{{1,100},{20,550},{21,550}},{{1,-1},{20,-1}}},
		returnres_p={{{1,1},{20,30},{21,30}}},
		-- unravel_effect={{{1,7},{2,15},{40,300},{41,300}},{{1,-1},{20,-1}}},
	},

	qianliduxing={ --Thi猲 l� c h祅h
		deadlystrikeenhance_p={{{1,6},{30,15}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,25},{30,65},{34,73},{35,90},{36,92}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,25},{20,65},{33,92},{35,118},{38,124},{39,126}},{{1,-1},{30,-1}}},
		addlightingmagic_v={{{1,30},{30,815}},{{1,-1},{2,-1}}},
		addlightingdamage_v={{{1,45},{30,315}},{{1,-1},{2,-1}}},
	--	magicenhance_p={{{1,1},{30,20},{31,20}}},
	--	anti_lightingres_p={{{1,1},{30,20},{31,20}}},
	--	lifemax_p={{{1,21},{35,80},{36,81}},{{1,-1},{30,-1}}},
	},

------------------------------------TungEns 24/09/2022 Test SKill
	jianjuefuyun={ --傲雪啸风
		physicsenhance_p={{{1,5},{15,150},{20,450}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,673}},
			[3]={{1,39},{15,200},{20,673}}
		},
		stun_p={{{1,5},{20,25},{21,25}},{{1,1},{20,12},{21,12}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,25},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},

		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1893},{20,1893}}
		},
		-- addskilldamage1={
			-- [1]={{1,1080},{2,1080}},
			-- [3]={{1,1},{20,35}}
		-- },
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,1891},{2,1891}},{{1,1},{20,1}},{{1,0},{2,0}}},
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

------------------------------------------------------------------------------------------------------------
	jianjuefuyun_2={ --Ph� v﹏ ki誱 quy誸
		physicsenhance_p={{{1,5},{15,150},{20,450}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,673}},
			[3]={{1,39},{15,200},{20,673}}
		},
		stun_p={{{1,5},{20,25},{21,25}},{{1,1},{20,12},{21,12}}},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,25},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1892},{20,1892}}
		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1892},{20,1892}}
		},
		-- addskilldamage1={
			-- [1]={{1,1080},{2,1080}},
			-- [3]={{1,1},{20,35}}
		-- },
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

	loichandaidia={ --loi chan dai dia
		physicsenhance_p={{{1,25},{20,450}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		stun_p={{{1,5},{20,20},{21,20}},{{1,1},{20,12},{21,12}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,500}},
			[3]={{1,39},{15,200},{20,750}}
		},
	},

	danzhichishang={ --Чm ch輈h tr� trng
		autoattackskill={
			{{1,1895*256 + 1},{20,1895*256 + 20},{21,1895*256 + 21}},--技能id*256 + 技能等级
			{{1,-1},{20,-1}},
			{{1,20*18*256 + 1},{30,20*18*256 + 10},{31,20*18*256 + 10}}--冷却时间*256+概率
		},
		skill_desc=
			function(level)
				return "Khi t蕁 c玭g, c� <color=orange>"..floor(Link(level,SKILLS.danzhichishang.autoattackskill[3]) - 20*18*256).."%<color> t� l� k輈h ho箃 v� k� <color=water>B綾 Minh Th莕 C玭g<color>\n"..
				"Trong v遪g <color=orange>"..floor((Link(level,SKILLS.danzhichishang.autoattackskill[3]) *3 / (18*256))).." gi﹜<color> s� kh玭g k輈h ho箃 l筰\n\n"..
				"B� t辌h <color=water>B綾 Minh Th莕 C玭g<color> L鵦 c玭g k輈h <color=orange>"..floor(Link(level,SKILLS.danzhichishang_Buff.add_damage_p[1])).."%<color>\n"..
				"Duy tr� <color=orange>"..floor(Link(level,SKILLS.danzhichishang_Buff.add_damage_p[2]) / 18).."<color> gi﹜"
			end,
		skill_skillexp_v={
			{
				{1,17851239},
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
			}
		},
	},
	danzhichishang_Buff={ --啖炙持觞_Buff
		add_damage_p={{{1,1},{20,5},{24,6}},{{1,10*18},{20,10*18},{21,10*18}}},
	},

	shibuyisha={ --Th藀 b� nh蕋 s竧
		physicsenhance_p={{{1,35},{20,400}}},
		seriesdamage_p={{{1,20},{15,20},{20,50},{21,52}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,500}},
			[3]={{1,39},{15,200},{20,1000}}
		},
		deadlystrike_p={{{1,20},{20,50},{21,51}}},
		stun_p={{{1,5},{20,25},{21,25}},{{1,1},{20,12},{21,12}}},
		-- cost_sp={
			-- {{1,1883},{20,1883}},  -- 目标技能id
			-- {{1,0},{20,0}}, -- 填零
			-- {{1,3},{20,3}}, -- 吃几个
		-- },
		skill_cost_v={{{1,35},{20,60}}},
		skill_mintimepercast_v={{{1,20*18},{20,15*18},{30,15*18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_desc=
			function(level)
				return "<color=red>Duy Ng� чc T玭<color>\n"..
				"Th阨 gian kh玦 ph鬰 chi猽 th鴆: <color=orange>"..floor(Link(level,SKILLS.shibuyisha.skill_mintimepercast_v[1]) / 18).." gi﹜<color>\n"
			end,
		-- skill_showevent={{{1,1},{20,1}}},
		-- skill_collideevent={
			-- [1]={{1,0},{10,0},{10,1},{20,1}},
			-- [3]={{1,1881},{20,1881}}
		-- },
		skill_skillexp_v={
			{
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
			}
		},
	},

	shibuyisha_Buff={ --十步一杀_Buff
		-- hidebodyunlock={{{1,1},{2,1}},{{1,14},{2,14}}},
		-- forbit_attack={{{1,1},{2,1}},{{1,14},{2,14}}},
		-- frozen_action={{{1,1},{2,1}},{{1,14},{2,14}}},
		-- invincibility={{{1,1},{2,1}},{{1,14},{2,14}}},
		hide={{{1,1},{20,1}},{{1,1*18},{20,1*18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},

	suiyiqu={ --T飝 � kh骳
		lightingdamage_v={
			[1]={{1,30},{20,225}},
			[3]={{1,30},{20,225}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,1909},{2,1909}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage2={
			[1]={{1,1910},{2,1910}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1911},{2,1911}},
			[3]={{1,1},{20,50}}
		},
		skill_cost_v={{{1,15},{20,20}}}
	},

	xiaoyaoqinfa={ --Ti猽 dao c莔 ph竝
		addlightingmagic_v={{{1,20},{20,250}},{{1,-1},{2,-1}}}
	},

	luoyanpingsha={ --L筩 nh筺 b譶h sa
		seriesdamage_p={{{1,5},{20,30}}},
		lightingdamage_v={
			[1]={{1,30},{20,500}},
			[3]={{1,30},{20,500}}
		},
	--	addskilldamage1={
	--		[1]={{1,1910},{2,1910}},
	--		[3]={{1,1},{20,40}}
	--	},
	--	addskilldamage2={
	--		[1]={{1,1911},{2,1911}},
		--	[3]={{1,1},{20,50}}
	--	},
		stun_p={{{1,2},{20,30},{21,31}},{{1,1},{20,12},{21,12}}},
		skill_cost_v={{{1,30},{20,70}}},
		-- cost_sp={
			-- {{1,1883},{20,1883}},  -- 目标技能id
			-- {{1,0},{20,0}}, -- 填零
			-- {{1,8},{20,8}}, -- 吃几个
		-- },
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{20,1}}},
		skill_desc=
			function(level)
				return "<color=red>Dng Ca Thi猲 Qu﹏<color>\n"..
				"V� k� duy tr� trong <color=orange>"..floor(Link(level,SKILLS.xiaoyaoyu.addlightingmagic_v[2])/18).." gi﹜<color>\n"
			end,
	},
	xiaoyaoyu={ --Ti猽 dao kh骳
		addlightingmagic_v={{{1,15},{20,300}},{{1,60*18},{20,60*18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},

	guanglingsan={ --Qu秐g l╪g t竛
		lightingdamage_v={
			[1]={{1,30},{20,550}},
			[3]={{1,30},{20,550}}
		},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		skill_misslenum_v={{{1,1},{20,2},{23,3},{26,4},{29,5},{30,5}}},
		skill_cost_v={{{1,30},{20,50}}},
		addskilldamage1={
			[1]={{1,1910},{2,1910}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage2={
			[1]={{1,1911},{2,1911}},
			[3]={{1,1},{20,50}}
		},
		skill_desc=
			function(level)
				return "<color=red>Thi猲 S琻 L鬰 Dng<color>\nS� lng tia xu蕋 ra: <color=orange>"..floor(Link(level,SKILLS.guanglingsan.skill_misslenum_v[1])).."<color>/5 tia\n"
			end,
	},

	gaoshanliushui={ --Ng筼 s琻 l璾 th駓
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,30},{20,937}},
			[3]={{1,30},{20,937}}
		},
		stun_p={{{1,2},{20,40},{21,42},{30,60},{31,60}},{{1,1},{20,12},{21,12}}},
		addskilldamage1={
			[1]={{1,1911},{2,1911}},
			[3]={{1,1},{20,60}}
		},
		skill_cost_v={{{1,30},{20,60}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={
			{
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
}
		},
	},

	meihuasannong={ --Mai hoa tam l閚g
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		lightingdamage_v={
			[1]={{1,100},{20,1000}},
			[3]={{1,100},{20,1000}}
		},
		stun_p={{{1,1},{20,20},{21,22},{30,40},{31,40}},{{1,1},{20,12},{21,12}}},
		-- deadlystrike_p={{{1,1},{20,20},{21,21}}},
		skill_misslenum_v={{{1,1},{20,1},{26,1},{30,1}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,0},{10,0},{11,4},{20,4}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_desc=
			function(level)
				return "<color=red>Dng Quang Tam Kh骳<color>\nS� lng l筩 nh筺 ph鉵g ra: <color=orange>"..floor(Link(level,SKILLS.meihuasannong.skill_misslenum_v[1])).."<color>/3 nh筺\n"
			end,
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
	yangguansandie={ --Dng quan tam kh骳
		seriesdamage_p={{{1,20},{15,20},{20,50},{21,52}}},
		stun_p={{{1,5},{20,20},{21,21}},{{1,1},{20,12},{21,12}}},
		lightingdamage_v={
			[1]={{1,30},{20,500}},
			[3]={{1,30},{20,1500}}
		},
		-- deadlystrike_p={{{1,1},{20,20},{21,21}}},
	},

	zhizunyinjian={ --逍遥派至尊印鉴技能
		special_point_base={
			{{1,1883},{20,1883}},-- 目标技能id
			{{1,-1},{20,-1}},-- 配在主动技能属性上填0，作为buff属性填-1
			{{1,2},{20,2}},-- 增加个数
		}
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
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
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
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

