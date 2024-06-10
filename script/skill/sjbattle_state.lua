-------------------------------------------------------------------------
-- FileName		:	sjbattle_state.lua - K� N�ng B� Tr�
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/sjbattle_state.lua
-------------------------------------------------------------------------
Include("\\script\\skill\\head.lua")

SKILLS={
	--T�ng Sinh l�c (%) 		1298
	add_lifemaxp = 
	{
		lifemax_yan_p={{{1,10},{25,250}},{{1,18*60*3},{30,18*60*3}}},
		},

	--T�ng N�i l�c (%) 		1299
	add_manamaxp =
	{
		manamax_yan_p={{{1,10},{10,100}},{{1,18*60*3},{2,18*60*3}}},
		},
		
	--Gi�m th� th��ng		1300
	min_fasyan = 
	{
		fasthitrecover_yan_v={{{1,3},{10,30}},{{1,18*60*3},{2,18*60*3}}},
		},
		
	--Gi�m th�i gian tr�ng ��c		1301
	min_poitime =
	{
		poisontimereduce_p={{{1,5},{10,50}},{{1,18*60*3},{2,18*60*3}}},
		},
		
	--Gi�m th�i gian tr� ho�n		1302
	min_coldtime =
	{
		freezetimereduce_p={{{1,5},{10,50}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--Gi�m th�i gian cho�ng		1303
	min_stuntime=
	{
		stuntimereduce_p={{{1,5},{10,50}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	
	--T�ng kh�ng ho�n to�n		1304
	add_allres=
	{
		allres_yan_p={{{1,10},{10,100}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng m�u, mana ho�n to�n 1305
	add_lifemana=
	{
		lifemax_yan_p={{{1,5},{10,50}},{{1,18*60*3},{2,18*60*3}}},
		manamax_yan_p={{{1,5},{10,50}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng t�c �� ch�y 1306
	add_speed=
	{
		fastwalkrun_yan_p={{{1,10},{10,100}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng n� tr�nh 1307
	add_defen=
	{
		adddefense_v={{{1,500},{10,5000}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng �� ch�nh x�c
	add_attrate=
	{
		attackrating_v={{{1,1000},{10,10000}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng t�c �� xu�t chi�u 1039
	add_attspeed =
	{
		attackspeed_yan_v={{{1,1},{10,30}},{{1,18*60*3},{2,18*60*3}}},
		castspeed_yan_v={{{1,1},{10,30}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--H�p th�nh k� n�ng c�ng k�ch	1310
	add_skillgong=
	{
		skill_enhance={{{1,10},{10,100}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T�ng t� l� tr�ng k�ch 1311
	add_heavyatt=
	{
		enhancehit_rate={{{1,3},{10,15}},{{1,18*60*3},{2,18*60*3}}},
		},
	
	--T� l� gi�m tr�ng k�ch 1312
	min_heavyatt=
	{
		anti_enhancehit_rate={{{1,3},{10,15}},{{1,18*60*3},{2,18*60*3}}},
		},
	
}
