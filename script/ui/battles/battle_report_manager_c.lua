if MODEL_GAMECLIENT ~= 1 then
	return
end

BattleReportManager = {}

function BattleReportManager:UpdateSongJinPlayer(nSongPlayer, nJinPlayer)
	BattleReport_AddNumberOfSongJinPlayer(nSongPlayer, nJinPlayer);
end
