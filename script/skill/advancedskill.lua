-------------------------------------------------------------------------
-- FileName		:	advancedskill.lua - Kü n¨ng n©ng cao
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/advancedskill.lua
-------------------------------------------------------------------------
SKILLS=
{
	sl_adskill={ --ThiÕu L©m
		skill_desc=
			function(level)
				return format("Dïng <color=water>[Minh KÝnh V« Di]<color> t¨ng khi b¶n th©n bÞ c«ng kÝch gÇn vµ xa <color=orange>%d%%<color> håi phôc s¸t th­¬ng, duy tr× <color=orange>%d gi©y <color>\n", floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[1])), floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[2]) / 18))
			end,
		autoreplyskill=
		{
			{{1,1230 * 256 + 1},{20,1230 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3},{19,20*18*256 + 5},{20,20*18*256 + 5}}
		},
		meleedamagereturn_p={{{1,10},{20,50},{21,50}},{{1,10*18},{20,15*18}}},
		rangedamagereturn_p={{{1,10},{20,50},{21,50}},{{1,10*18},{20,15*18}}},
							},
		tw_adskill={ --Thiªn V­¬ng
		skill_desc=
			function(level)
				return format("Dïng <color=water>[Du Long Ch©n KhÝ]<color> cã <color=orange>%d%%<color> tØ lÖ lµm cho b¶n th©n miÔn dÞch víi tr¹ng th¸i tiªu cùc, duy tr× <color=orange>%d gi©y <color>\n",floor(100 - Link(level,SKILLS.tw_adskill.missle_missrate[1])), floor(Link(level,SKILLS.tw_adskill.ignorenegativestate_p[2]) / 18))
			end,
		autoreplyskill=
		{
			{{1,1231 * 256 + 1},{20,1231 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1},{19,10*18*256 + 3},{20,10*18*256 + 3}}
		},
		autoattackskill=
		{
			{{1,738*256 + 1},{20,738*256 + 20}},
			{{1,10},{20,40}},
			{{1,10*18*256 + 10},{20,4*18*256 + 50}}
		},
		missle_missrate={{{1,80},{20,20},{21,20}}},
		ignorenegativestate_p=
		{
			{{1,100},{15,100},{20,100},{21,100}},
			{{1,1*18},{20,3*18},{21,3*18}},
		},
							},
	wu_adskill ={ --Ngò §éc
		skill_desc=
			function(level)
				return format("Môc tiªu cã <color=orange>%d%%<color> tØ lÖ kÝch ho¹t cÊp ®é t­¬ng øng cña <color=water>[Hån NhËt Tïng Sinh]<color>\n sau mçi lÇn kÝch ho¹t trong <color=orange>%d gi©y <color> kh«ng thÓ kÝch ho¹t n÷a\n",floor(Link(level,SKILLS.wu_adskill.autoattackskill[3]) - 1*18*256), floor((Link(level,SKILLS.wu_adskill.autoattackskill[3]) / (18*256))))
			end,
		autoattackskill=
		{
			{{1,1232*256 + 1},{20,1232*256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,1*18*256 + 20},{20,1*18*256 + 60}}
		},
							},
	tm_adskill ={ --§­êng M«n
		skill_desc=
			function(level)
				return format("Khi sinh lùc thÊp h¬n 25%% cã <color=orange>%d%%<color> tØ lÖ ng¨n chÆn kÝch ho¹t 100%%\n sau mçi lÇn kÝch ho¹t trong <color=orange>%d gi©y <color> kh«ng thÓ kÝch ho¹t n÷a\n ", floor(Link(level,SKILLS.tm_adskill.autorescueskill[3]) - 10*18*256), floor((Link(level,SKILLS.tm_adskill.autorescueskill[3]) / (18*256))))
			end,	
		block_rate={{{1,100},{2,100}},{{1,18*2},{20,18*5}}},
		autorescueskill=
		{
			{
				{1,1233*256 + 1},{20,1233*256 + 20},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,10*18*256 + 5},
				{20,10*18*256 + 20},
			}
		},
								},
	em_adskill ={ --Nga My
		skill_desc=
			function(level)
				return format("Môc tiªu cã <color=orange>%d%%<color> tØ lÖ thi triÓn cÊp ®é t­¬ng øng cña <color=water>[Tõ Hµng Phæ §é]<color>\n sau mçi lÇn kÝch ho¹t trong <color=orange>%d gi©y <color> kh«ng thÓ kÝch ho¹t n÷a\n",floor(Link(level,SKILLS.em_adskill.autoattackskill[3]) - 3*18*256),floor((Link(level,SKILLS.em_adskill.autoattackskill[3]) / (18*256))))
			end,
		autoattackskill=
		{
			{{1,1234*256 + 1},{20,1234*256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,3*18*256 + 10},{20,3*18*256 + 30}}
		},
							},
	cy_adskill ={ --Thóy Yªn
		skill_desc=
			function(level)
				return format("Dïng <color=water>[Dung TuyÕt V« Tung]<color> lµm cho b¶n th©n tµng h×nh, mçi lÇn tµng h×nh duy tr× <color=orange>%d gi©y <color>\n", floor(Link(level,SKILLS.cy_adskill.hide[2]) / 18))
			end,
		autoreplyskill=
		{
			{{1,1235 * 256 + 1},{20,1235 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,20*18*256 + 5},{19,10*18*256 + 10},{20,10*18*256 + 10}}
		},
		hide=
		{
			{{1,2},{20,5}},
			{{1,2*18},{20,5*18}}
		},
								},				
	tr_adskill ={ --Thiªn NhÉn
		autoreplyskill=
		{
			{{1,1236 * 256 + 1},{20,1236 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1},{19,20*18*256 + 3},{20,20*18*256 + 3}}
		},
								},
	gb_adskill={ --C¸i Bang
		skill_desc=
			function(level)
				return format("Khi dïng <color=water>[Thiªn Hµnh KhÝ C«ng]<color> cã thÓ n©ng cao[Hçn Thiªn KhÝ C«ng]tØ lÖ kÝch ho¹t <color=orange>%d%%<color>, \n vµ bá qua háa phßng cña ®èi ph­¬ng: <color=orange>%d%% (d­¬ng) <color>, duy tr× hiÖu øng <color=orange>%d gi©y <color>\n ",floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[1])),floor(Link(level,SKILLS.gb_adskill.anti_fireres_yan_p[1])),floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18))
				end,
		autoreplyskill=
		{
			{{1,1237 * 256 + 1},{20,1237 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3},{19,20*18*256 + 10},{20,20*18*256 + 10}}
		},
		enhance_714_auto=
		{
			{{1,2},{20,20}},
			{{1,5*18 },{20,15*18}}
		},
		anti_fireres_yan_p=
		{
			{{1,6},{20,20}},
			{{1,5*18 },{20,15*18}}
		},
								},
	wd_adskill ={ --Vâ §ang
		skill_desc=
			function(level)
				return format("Khi dïng <color=water>[¢m D­¬ng KhÝ QuyÕt]<color> cã thÓ lµm cho <color=orange>%d%%<color> s¸t th­¬ng chuyÓn hãa thµnh néi lùc, duy tr× hiÖu øng <color=orange>%d gi©y <color>\n",floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[1])),floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[2])/18))
				end,
		autoreplyskill=
		{
			{{1,1238 * 256 + 1},{20,1238 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3},{19,20*18*256 + 5},{20,20*18*256 + 5}}
		},
		damage2addmana_p=
		{
			{{1,50},{20,200}},
			{{1,5*18 },{20,15*18}}
		}
								},
	kl_adskill ={ --C«n L«n
		skill_desc=
			function(level)
				return format("Khi dïng <color=water>[Tiªn Thiªn C­¬ng KhÝ]<color> cã thÓ n©ng cao?L­ìng Nghi Ch©n KhÝ]tØ lÖ kÝch ho¹t <color=orange>%d%%<color>, \n vµ bá qua l«i phßng cña ®èi ph­¬ng: <color=orange>%d%% (d­¬ng) <color>, duy tr× hiÖu øng <color=orange>%d gi©y <color>\n ",floor(Link(level,SKILLS.kl_adskill.enhance_717_auto[1])), floor(Link(level,SKILLS.kl_adskill.anti_lightingres_yan_p[1])),floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18))
				end,
		autoreplyskill=
		{
			{{1,1239 * 256 + 1},{20,1239 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3},{19,20*18*256 + 5},{20,20*18*256 + 5}}
		},
		enhance_717_auto=
		{
			{{1,3},{20,15}},
			{{1,5*18 },{20,15*18}}
		},
		anti_lightingres_yan_p=
		{
			{{1,5},{20,15}},
			{{1,5*18 },{20,15*18}}
		},
								},
}
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