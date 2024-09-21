-------------------------------------------------------------------------
-- FileName		:	cuiyan.lua - Thóy Yªn
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/cuiyan.lua
-------------------------------------------------------------------------
szVMDTScript = "\\script\\skill\\cuiyan_fix.lua";
nVMDTScriptId = FileName2Id(szVMDTScript);
szVMDTScript2 = "\\script\\skill\\cuiyan_fix2.lua";
nVMDTScriptId2 = FileName2Id(szVMDTScript2);
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/10)
end


SKILLS={--Thóy yªn
	
	fenghua_xueyue={ --Phong Hoa TuyÕt NguyÖt
		physicsenhance_p={{{1,5},{20,85}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,336},{2,336}},
			[3]={{1,1},{20,55}}
		},
		addskilldamage2={
			[1]={{1,108},{2,108}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage4={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,45}}
		},
		colddamage_v={
			[1]={{1,5},{20,80}},
			[3]={{1,5},{20,150}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	cuiyan_daofa={ --Thóy Yªn §ao ph¸p Hç trî bÞ ®éng
		addphysicsdamage_p={{{1,45},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,6},{20,35,Conic}},{{1,-1},{2,-1}}}
	},
	cuiyan_shuangdao={ --Thóy Yªn Song ®ao	Hç trî bÞ ®éng
		addcoldmagic_v={{{1,20},{20,215}},{{1,-1},{2,-1}}}
	},
	huti_hanbing={ --Hé ThÓ Hµn B¨ng
		meleedamagereturn_p={{{1,5},{20,20}},{{1,18*120},{20,18*120}}},
		rangedamagereturn_p={{{1,5},{20,20}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,40},{20,60}}}
	},
	fengjuan_canxue={ --Phong QuyÓn Tµn TuyÕt	C«ng kÝch néi c«ng
		seriesdamage_p={{{1,1},{20,10}}},
		physicsdamage_v={
			[1]={{1,25},{20,235}},
			[3]={{1,25},{20,375}},
		},
		addskilldamage1={
			[1]={{1,337},{2,337}},
			[3]={{1,1},{20,115}}
		},
		addskilldamage2={
			[1]={{1,111},{2,111}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1065},{2,1065}},
			[3]={{1,1},{20,95}}
		},
		addskilldamage4={
			[1]={{1,1093},{2,1093}},
			[3]={{1,1},{20,95}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	bingxin_qianying={ --B¨ng T©m Tr¸i ¶nh
		lifereplenish_v={{{1,130},{20,700}},{{1,8},{2,8}}},
		skill_cost_v={{{1,21},{20,40}}}
	},
	yuda_lihua={ --Vò §¶ Lª Hoa
		physicsenhance_p={{{1,10},{20,140}}},
		seriesdamage_p={{{1,5},{20,30}}},
		addskilldamage1={
			[1]={{1,382},{2,382}},
			[3]={{1,15},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,42}}
		},
		colddamage_v={
			[1]={{1,10},{20,100}},
			[3]={{1,10},{20,250}}
		},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,20},{20,30}}}
	},
	xueying={--TuyÕt ¶nh
		execscript=
		{
			[1]={{1,nVMDTScriptId},{20,nVMDTScriptId}},
			[2]={{1,1},{20,1}},
			[3]={{1,1},{20,20}}
		},
		attackspeed_v={{{1,12},{20,86},{23,93},{25,110},{28,119},{42,131},{43,139},{44,142}},{{1,18*120},{20,18*180}}},
		castspeed_v={{{1,12},{20,86},{23,93},{25,110},{28,119},{42,131},{43,139},{44,142}},{{1,18*120},{20,18*180}}},
		fastwalkrun_p={{{1,17},{20,55}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,40},{20,140}}}
	},
	taxue_wuhen={ --§¹p TuyÕt V« Ng©n 
--		fastwalkrun_p={{{1,17},{20,55}},{{1,18*120},{20,18*180}}},
--		skill_cost_v={{{1,24},{20,100}}}
	},
	muye_liuxing={ --Môc D· L­u Tinh	C«ng kÝch ngo¹i c«ng
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,30},{20,271}}},
		colddamage_v={
			[1]={{1,20},{20,246}},
			[3]={{1,20},{20,426}}
		},
		addskilldamage1={
			[1]={{1,336},{2,336}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage3={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,50}}
		},
		skill_attackradius={{{1,448},{20,480},{21,480}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	fuyun_sanxue={ --Phï V©n T¸n TuyÕt
		colddamage_v={
			[1]={{1,40},{20,375}},
			[3]={{1,40},{20,575}}
		},
		seriesdamage_p={{{1,5},{20,30}}},
		addskilldamage1={
			[1]={{1,338},{2,338}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,1065},{2,1065}},
			[3]={{1,1},{20,83}}
		},
		addskilldamage3={
			[1]={{1,1093},{2,1093}},
			[3]={{1,1},{20,83}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,50},{20,50}}}
	},
	bihai_chaosheng={ --BÝch H¶i TriÒu Sinh
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsdamage_v={
			[1]={{1,20},{20,200}},
			[3]={{1,20},{20,200}},
		},
		colddamage_v={
			[1]={{1,43},{20,704}},
			[3]={{1,43},{20,1214}}
		},
		addskilldamage1={
			[1]={{1,337},{2,337}},
			[3]={{1,2},{20,70}}
		},
		addskilldamage2={
			[1]={{1,338},{2,338}},
			[3]={{1,2},{20,65}}
		},
		addskilldamage3={
			[1]={{1,1065},{2,1065}},
			[3]={{1,1},{20,58}}
		},
		addskilldamage4={
			[1]={{1,1093},{2,1093}},
			[3]={{1,1},{20,58}}
		},
		skill_cost_v={{{1,65},{20,65}}}
	},
	binggu_xuexin={ --B¨ng Cèt TuyÕt T©m
		addcoldmagic_v=
		{
			{
				{1,60},{30,315}
			},
			{
				{1,-1},{2,-1}
			}
		},
		addcolddamage_v={{{1,30},{30,275}},{{1,-1},{2,-1}}},
		addphysicsmagic_v={{{1,30},{30,275}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,5},{30,40,Conic}},{{1,-1},{2,-1}}},
		--fasthitrecover_v={{{1,5},{30,49},{31,49}},{{1,-1},{2,-1}}},
		coldenhance_p={{{1,10},{30,75}},{{1,-1},{2,-1}}},
		lifemax_p=
		{
			{
				{1,10},{35,20},{36,20}
			},
			{
				{1,-1},{30,-1}
			}
		},
	},
	bingzong_wuying={ --b¨ng tung v« ¶nh TYD tang 1
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}}, -- fix dame 1.7 > 2.0
		physicsenhance_p={{{1,30},{15,200},{20,292}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			-- [1]={{1,10},{15,140},{20,173}}, -- fix dame 1.0 cßn 0.7
			-- [3]={{1,50},{15,200},{20,276}}
			[1]={{1,7},{15,98},{20,121}},
			[3]={{1,35},{15,140},{20,193}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,382},{20,382}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,5},{21,5}}},
		skill_skillexp_v={{	{1,SkillExpFunc(8000,1.25,1,1,1)},
							{2,SkillExpFunc(8000,1.15,2,1,1)},
							{3,SkillExpFunc(8000,1.16,3,1,1)},
							{4,SkillExpFunc(8000,1.17,4,1,1)},
							{5,SkillExpFunc(8000,1.18,5,1,1.5)},
							{6,SkillExpFunc(8000,1.19,6,1,1.5)},
							{7,SkillExpFunc(8000,1.20,7,1,1.5)},
							{8,SkillExpFunc(8000,1.21,8,1,1.5)},
							{9,SkillExpFunc(8000,1.22,9,1,1.5)},
							{10,SkillExpFunc(8000,1.23,10,1,2)},
							{11,SkillExpFunc(8000,1.24,11,1,2)},
							{12,SkillExpFunc(8000,1.23,12,1,2)},
							{13,SkillExpFunc(8000,1.22,13,1,2)},
							{14,SkillExpFunc(8000,1.21,14,1,2)},
							{15,SkillExpFunc(8000,1.20,15,1,3)},
							{16,SkillExpFunc(8000,1.19,16,1,3)},
							{17,SkillExpFunc(8000,1.18,17,1,3)},
							{18,SkillExpFunc(8000,1.17,18,1,3)},
							{19,SkillExpFunc(8000,1.16,19,1,3)},
							{20,SkillExpFunc(8000,1.15,20,1,4)},
							}},
	},
	bingxin_yuling={ --B¨ng T©m Ngäc L¨ng 	C«ng kÝch néi c«ng
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		physicsenhance_p={{{1,15},{20,115}}},
		colddamage_v={
			[1]={{1,10},{20,440}},
			[3]={{1,10},{20,440}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{15,0},{15,1},{20,1}},
			[3]={{1,382},{20,382}}
		},
		skill_showevent={{{1,0},{15,0},{15,4},{20,4}}},
	},
	daocuiyan150={ --B¨ng Vò L¹c Tinh
		physicsenhance_p={{{1,90},{15,600},{20,900},{23,1260},{26,1440}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,60},{15,850},{20,1050},{23,1290},{26,1410}},
			[3]={{1,300},{15,1200},{20,1655},{23,2201},{26,2474}}
		},
		missle_speed_v={{{1,24},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,48},{20,72},{23,79}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1064},{20,1064}}
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
	daocuiyan150_2={ --B¨ng Ng­ng Hµn Yªn
		physicsenhance_p={{{1,18},{15,120},{20,175},{23,241},{26,274}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,12},{15,168},{20,210},{23,260},{26,285}},
			[3]={{1,60},{15,240},{20,331},{23,440},{26,494}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_misslenum_v={{{1,1},{5,1},{20,5},{21,5}}},
	},
	bingxin_xuelian={ --B¨ng T©m TuyÕt Liªn TYD tang 2
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		-- physicsenhance_p={{{1,15},{20,115}}}, fix dame 1.7 > 2.0
		physicsenhance_p={{{1,30},{20,230}}},
		colddamage_v={
			-- [1]={{1,10},{20,220}}, -- fix dame 0.6
			-- [3]={{1,10},{20,220}}
			[1]={{1,6},{20,132}},
			[3]={{1,6},{20,132}}
		},
	},
	bingxin_xianzi={ -- TYSD tang 1
		seriesdamage_p={{{1,20},{15,20},{20,70},{21,72}}},
		physicsdamage_v={
			-- [1]={{1,5},{15,100},{20,358}}, -- fix dame 4.2 > 4.4
			-- [3]={{1,5},{15,100},{20,358}},
			[1]={{1,22},{15,440},{20,1075}},
			[3]={{1,22},{15,440},{20,1075}},
		},
		colddamage_v={
			-- [1]={{1,15},{15,240},{20,581}}, -- fix dame 2.2
			-- [3]={{1,15},{15,240},{20,581}}
			[1]={{1,15},{15,240},{20,1281}},
			[3]={{1,15},{15,240},{20,1281}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,45},{20,75}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,3},{2,3}},
			[3]={{1,338},{20,338}}
		},
		addskilldamage1={
			[1]={{1,1065},{2,1065}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,1093},{2,1093}},
			[3]={{1,1},{20,45}}
		},
		skill_showevent={{{1,0},{10,0},{10,2},{20,2}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(13000,1.25,1,1,1)},
							{2,SkillExpFunc(13000,1.15,2,1,1)},
							{3,SkillExpFunc(13000,1.16,3,1,1)},
							{4,SkillExpFunc(13000,1.17,4,1,1)},
							{5,SkillExpFunc(13000,1.18,5,1,1)},
							{6,SkillExpFunc(13000,1.19,6,1,1)},
							{7,SkillExpFunc(13000,1.20,7,1,1)},
							{8,SkillExpFunc(13000,1.21,8,1,1)},
							{9,SkillExpFunc(13000,1.22,9,1,1)},
							{10,SkillExpFunc(13000,1.23,10,1,1)},
							{11,SkillExpFunc(13000,1.24,11,1,1)},
							{12,SkillExpFunc(13000,1.23,12,1,1)},
							{13,SkillExpFunc(13000,1.22,13,1,1)},
							{14,SkillExpFunc(13000,1.21,14,1,1)},
							{15,SkillExpFunc(13000,1.20,15,1,1)},
							{16,SkillExpFunc(13000,1.19,16,1,1)},
							{17,SkillExpFunc(13000,1.18,17,1,1)},
							{18,SkillExpFunc(13000,1.17,18,1,1)},
							{19,SkillExpFunc(13000,1.16,19,1,1)},
							{20,SkillExpFunc(13000,1.15,20,1,1)},
							}},
	},
	fengxue_bingtian={ -- TYSD tang 2
		seriesdamage_p={{{1,20},{20,70},{21,72}}},
		colddamage_v={
			-- [1]={{1,45},{20,400}}, -- fix dame 2.25 > 2.5
			-- [3]={{1,45},{20,400}}
			[1]={{1,45},{20,1000}},
			[3]={{1,45},{20,1000}}
		},
	},
	neicuiyan150={ --Thñy Anh Man Tó	C«ng kÝch néi c«ng
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsdamage_v={
			[1]={{1,6},{15,120},{20,430},{23,802},{26,988}},
			[3]={{1,6},{15,120},{20,430},{23,802},{26,988}},
		},
		colddamage_v={
			[1]={{1,18},{15,290},{20,700},{23,1192},{26,1438}},
			[3]={{1,18},{15,290},{20,700},{23,1192},{26,1438}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,55},{20,90},{23,101}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[2]={{1,2},{2,2}},
			[3]={{1,1093},{20,1093}}
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
	neicuiyan150_2={ --Khinh Sa Phï Thñy
		seriesdamage_p={{{1,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,55},{20,720},{23,930},{26,1035}},
			[3]={{1,55},{20,720},{23,930},{26,1035}}
		},
	},
	cuiyan120={ --Ngù TuyÕt Èn	Hç trî chñ ®éng	713
		execscript=
		{
			[1]={{1,nVMDTScriptId2},{20,nVMDTScriptId2}},
			[2]={{1,1},{20,1}},
			[3]={{1,1},{20,20}}
		},
		skill_cost_v={{{1,35},{20,80},{21,80}}},
		hide={{{1,1},{20,1}},{{1,5*18},{15,25*18},{20,30*18},{21,30*18}}},
		skill_mintimepercast_v={{{1,60*18},{15,45*18},{20,40*18},{21,40*18}}},
		skill_mintimepercastonhorse_v={{{1,60*18},{15,45*18},{20,40*18},{21,40*18}}},
		skill_desc=
			function(level)
				return "Thêi gian kh«i phôc chiªu thøc: <color=orange>"..floor(Link(level,SKILLS.cuiyan120.skill_mintimepercast_v[1]) / 18).." gi©y<color>\n"
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
		--	{1,17851239},--17tr exp
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
}

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

