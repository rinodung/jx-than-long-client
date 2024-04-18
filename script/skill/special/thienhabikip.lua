SKILLS={
	thieulam={
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	thienvuong={
		attackrating_v={{{1,4},{30,120}},{{1,-1},{2,-1}}},
		ignoredefense_p={{{1,1},{30,1}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	duongmon={
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	ngudoc={
		addpoisonmagic_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addpoisondamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	ngamy={
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addcoldmagic_v={{{1,5},{30,150}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	thuyyen={
		addphysicsmagic_v={{{1,7},{30,210}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	caibang={
		addfiremagic_v={{{1,5},{30,150}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	thiennhan={
		addfiremagic_v={{{1,5},{30,150}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	vodang={
		addlightingmagic_v={{{1,5},{30,150}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	conlon={
		addlightingmagic_v={{{1,7},{30,150}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	hoason={
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addcoldmagic_v={{{1,5},{30,150}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
	tieudao={
		addlightingmagic_v={{{1,7},{30,150}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,1},{30,10},{31,11}},{{1,-1},{2,-1}}},
		addphysicsdamage_v={{{1,1},{30,30}},{{1,-1},{2,-1}}},
		addphysicsdamage_p={{{1,2},{30,60}},{{1,-1},{2,-1}}},
	},
}
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