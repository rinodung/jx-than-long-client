-------------------------------------------------------------------------
-- FileName		:	double_restore.lua - Kü n¨ng håi phôc nhanh
-- Author		:	jxdocs.com
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	/jxser/server1/script/skill/double_restore.lua
-------------------------------------------------------------------------
SKILLS=
{
	
	DoubleRestore={ --¾ÅÃüÍè
		lifereplenish_v={{{1,15},{2,30}, {3,60}, {4, 2750},{5,3000},{6,3250}    },{{1,18*1},{20,18*1}}},
		manareplenish_v={{{1,15},{2,30}, {3,60}, {4, 2750},{5,3000},{6,3250}    },{{1,18*1},{20,18*1}}}
		
	},	
	DoubleReduce={
		lifereplenish_v={{{1,-1000},{2,-2000}, {3,-3000}},{{1,18*1},{20,18*1}}},
		manareplenish_v={{{1,-1000},{2,-2000}, {3,-3000}},{{1,18*1},{20,18*1}}}
	}
}

Include("\\script\\skill\\head.lua")