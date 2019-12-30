//fdfbfggfnf
//for net


private _playerGrp = group player;
_playerGrp setFormation "LINE";
while {true} do
{
    private _nearestArr = nearestTerrainObjects [getPos player, ["BUSH"], 100];
    //sold1 disableAI "FSM";
    //sold1 setBehaviour "CARELESS";
    hint format["%1", count _nearestArr];

    if( (count _nearestArr) > 1 ) then
    {
        _pos1 = getPosATL (_nearestArr#1);
        sold1 doMove _pos1;
    } else
    {
        [sold1] join player;

    };

    sleep 2;

};
