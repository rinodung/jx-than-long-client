--	加载帮会npc的脚本
--	lixin	2005.12.22
--	Include by tong_mix.lua
--  该脚本GS和relay的均须同步更新！
aTongNpcPos = {}
function GenPos(szPos)
	local index = strfind(szPos, ',', 1)
	return {x=tonumber(strsub(szPos, 1, index-1)), y=tonumber(strsub(szPos, index+1, strlen(szPos)-1))}
end

if (MODEL_GAMESERVER == 1) then
	IncludeLib("FILESYS")
	function LoadPosSetting()
		if TabFile_Load("\\settings\\tong\\npcpos.txt", "table_npcpos") ~= 1 then
			print("тc t藀 tin 甶襲 ph� t鋋  npc th蕋 b筰!")
			return
		end
		local nRowCount = TabFile_GetRowCount("table_npcpos")
		for y = 2, nRowCount do
			aTongNpcPos[y-1] = {}
			for x = 2, 100 do 
				local szHead = tonumber(TabFile_GetCell("table_npcpos", 1, x))
				if szHead then	
					aTongNpcPos[y-1][szHead]=GenPos(TabFile_GetCell("table_npcpos", y, x))
				else
					break	
				end		
			end	
		end	
		--TabFile_UnLoad("table_npcpos")
	end
	LoadPosSetting()
end

--公共地图
aPublicMap = {
	587,
	588,
	589,
	590,
	591,
	593,
	594,
}

--动态地图模板
aDynMapCopy = {
	587,
	588,
	589,
	590,
	591,
	593,
	594,
}
--动态地图模板名
aDynMapCopyName = {
	[587]="S琻 Th祅h",
	[588]="Mi猽 Cng",
	[589]="Sa M筩",
	[590]="Kinh S�",
	[591]="Bi猲 秈",
	[593]="Giang Nam",
	[594]="Tuy誸 L躰h",				
}

aRevPos = {x=1660,y=3257}
aMapEnterPosDef = {x=1702,y=3304}	--默认进入点
aMapEnterPos = {[591] = {x=1702,y=3304} } --进入点
function GetMapEnterPos(nMapCopy)
	if (aMapEnterPos[nMapCopy])then
		return aMapEnterPos[nMapCopy]
	end
	return aMapEnterPosDef
end

citymap = {586,587,588,589,590,591,593,594,595,596,597};
--第二列表示坐标在表中的位置
citytong_npc={
{198,1,"\\script\\tong\\npc\\bingjia_zongguan.lua","T鎛g Qu秐 Binh Gi竝 Phng"},
{200,2,"\\script\\tong\\npc\\tiangong_zongguan.lua","T鎛g Qu秐 Thi猲 C玭g Phng"},
{375,3,"\\script\\tong\\npc\\mianju_zongguan.lua","T鎛g Qu秐 D� Dung Phng"},
{455,4,"\\script\\tong\\npc\\tianyi_zongguan.lua","T鎛g Qu秐 Thi猲 � Phng"},
{769,5,"\\script\\tong\\npc\\shilian_zongguan.lua","T鎛g Qu秐 Th� Luy謓 Phng"},
{377,6,"\\script\\tong\\npc\\liwu_zongguan.lua","T鎛g Qu秐 L� Ph萴 Phng"},
{308,7,"\\script\\tong\\npc\\huodong_zongguan.lua","T鎛g Qu秐 Ho箃 чng Phng"},
{235,8,"\\script\\tong\\npc\\tong_chefu.lua","Xa Phu"},
{625,9,"\\script\\tong\\npc\\tong_chuwuxiang.lua","Rng Ch鴄 у"},
{329,10,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{649,18,"\\script\\tong\\npc\\zhandouqu_zongguan.lua","T鎛g Qu秐 Khu Chi課 u"},
{649,19,"\\script\\tong\\npc\\zhandouqu_zongguan.lua","T鎛g Qu秐 Khu Chi課 u"},
}

buildingmap = {586,587,588,589,590,591,593,594,595,596,597};

--索引表示作坊类型
--第二列表示坐标在表中的位置
building ={
[1] = {1151,11,"\\script\\tong\\npc\\bingjia_zongguan.lua","Khu Binh gi竝 "},
[2] = {1156,12,"\\script\\tong\\npc\\tiangong_zongguan.lua","Khu Thi猲 C玭g "},
[3] = {1165,13,"\\script\\tong\\npc\\mianju_zongguan.lua","Khu M苩 n� "},
[4] = {1170,15,"\\script\\tong\\npc\\shilian_zongguan.lua","Khu Luy謓 t藀"},
[5] = {1175,14,"\\script\\tong\\npc\\tianyi_zongguan.lua","Khu Thi猲 � "},
[6] = {1180,16,"\\script\\tong\\npc\\liwu_zongguan.lua","Khu L� v藅 "},
[7] = {1185,17,"\\script\\tong\\npc\\huodong_zongguan.lua","Khu ho箃 ng "},
}

--作坊的各级npc模板
building_figure ={
[1] = {1155,1151,1151,1152,1152,1152,1153,1153,1154,1155},
[2] = {1164,1156,1156,1157,1157,1157,1162,1162,1163,1164},
[3] = {1169,1165,1165,1166,1166,1166,1167,1167,1168,1169},
[4] = {1174,1170,1170,1171,1171,1171,1172,1172,1173,1174},
[5] = {1179,1175,1175,1176,1176,1176,1177,1177,1178,1179},
[6] = {1184,1180,1180,1181,1181,1181,1182,1182,1183,1184},
[7] = {1189,1185,1185,1186,1186,1186,1187,1187,1188,1189},
}

jijiumap = {586,587,588,589,590,591,593,594,595,596,597};
jijiu={
{329,1672,3256,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,1682,3249,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{1192,1657,3262,"\\script\\tong\\npc\\tong_totempole.lua","C閠 bi觰 tng bang h閕"},
{1191,1664,3255,"\\script\\tong\\npc\\tong_totempole.lua","C閠 bi觰 tng bang h閕"},
}
jijiu_city={
{329,1,1562,3252,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,11,3096,5025,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,37,1697,3117,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,78,1580,3204,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,80,1693,3066,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,162,1520,3159,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
{329,176,1561,2942,"\\script\\tong\\npc\\jitan.lua","T� T鰑"},
}


function add_tongnpc()

	if (GetProductRegion() == "cn_ib") then
		-- 加城市祭酒
		for i = 1, getn(jijiu_city) do
			local SId = SubWorldID2Idx(jijiu_city[i][2]);
			if (SId >= 0) then
				local npcindex = AddNpc(jijiu_city[i][1], 1, SId, jijiu_city[i][3]*32, jijiu_city[i][4]*32, 1, jijiu_city[i][6]);

				local npcindex1 = AddNpc(jijiu[i][1], 1, SId, jijiu[i][2]*32, jijiu[i][3]*32, 1, jijiu[i][6]);

				AddNpcSkillState(npcindex1, 739, 1, 1, 18*60*60*24*30)
				
				SetNpcScript(npcindex, jijiu_city[i][5]);
			end
		end
		-- 加帮会模板地图建筑
		for i = 1, getn(aPublicMap) do
			local SId = SubWorldID2Idx(aPublicMap[i]);
			if (SId >= 0) then
				add_one_citytong_npc(SId, aPublicMap[i]);
				add_one_allbuilding(SId, aPublicMap[i]);
			end
		end
		return
	end;
	
	add_citytong_npc();	--加帮会公共地图、模板地图npc
	add_tongbuilding();	--加帮会公共地图建筑
	add_jijiu();
end


function add_one_citytong_npc(SId, mapcopy)
	for j=1,getn(citytong_npc) do
		local pos = aTongNpcPos[citytong_npc[j][2]][mapcopy]
		if pos then
			local npcindex = AddNpc(citytong_npc[j][1],1,SId,pos.x*32,pos.y*32,1,citytong_npc[j][4]);
			SetNpcScript(npcindex, citytong_npc[j][3]);						
		else
			print("addtongnpc Error: pos is nil!, mapcopy:"..mapcopy)	
		end	
	end
end

function add_citytong_npc()	
	for i=1,getn(citymap) do
		local SId = SubWorldID2Idx(citymap[i]);
		if (SId >= 0) then
			add_one_citytong_npc(SId, citymap[i])
		end	
	end	
end;

-- add_one_building(地图id，地图模板，作坊类型，作坊等级)
function add_one_building(map_index, map_copy, nType, nLevel)
	local pos = aTongNpcPos[building[nType][2]][map_copy]
	local npcindex
	if pos then
		npcindex = AddNpc(building_figure[nType][nLevel],1,map_index,pos.x*32,
			pos.y*32,1,building[nType][4]);
		SetNpcScript(npcindex, building[nType][3]);
	else
		print("addtongnpc Error: pos is nil!, mapcopy:"..map_copy)	
	end	
	return npcindex
end

function add_one_allbuilding(SId, mapcopy)
	for j = 1, getn(building) do
		add_one_building(SId, mapcopy, j, 10);
	end
end

function add_one_citybuildings(SId, mapcopy)
	for j=1,getn(building) do
		add_one_building(SId, mapcopy, j, 1)
	end;
end

function add_tongbuilding()
	for i=1,getn(buildingmap) do
		local SId = SubWorldID2Idx(buildingmap[i]);
		if (SId >= 0) then
			add_one_citybuildings(SId, buildingmap[i])
		end
	end	
end

function add_jijiu()
	for i=1,getn(jijiumap) do
		SId = SubWorldID2Idx(jijiumap[i]);
		if (SId >= 0) then
			for j=1,getn(jijiu) do
				npcindex = AddNpc(jijiu[j][1],1,SId,jijiu[j][2]*32,jijiu[j][3]*32,1,jijiu[j][5]);
				SetNpcScript(npcindex, jijiu[j][4]);
			end;
		end;
	end	
end
