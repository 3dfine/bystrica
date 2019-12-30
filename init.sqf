

private _playerGrp = group player;
_playerGrp setFormation "LINE";
while {true} do
{
    private _nearestBush = nearestTerrainObjects [getPos player, ["BUSH", "SMALL TREE"], 100];
    private _nearestSmallTree = nearestTerrainObjects [getPos player, ["SMALL TREE"], 100];
    private _nearestTree = nearestTerrainObjects [getPos player, ["TREE"], 100];

    //sold1 disableAI "FSM";
    //sold1 setBehaviour "CARELESS";
    hint format["Bush-%1, Tree-%2, Speed-%3", count _nearestBush, count _nearestTree, speed player];

    private _pos1 = [];
    if( (speed player) < 1 ) then
    {
        private _ukritie = 0;
        if( (count _nearestBush) > 1 ) then
        {
                _ukritie = 1;
                _pos1 = getPosATL (_nearestBush#1);
                sold1 doMove _pos1;
        };
        if( ((count _nearestTree) > 1) && (_ukritie == 0)) then
        {
                _ukritie = 2;
                _pos1 = getPosATL (_nearestTree#1);
                sold1 doMove _pos1;
        };
        if(_ukritie == 0) then
        {
            if( (group sold1) != _playerGrp ) then
            {
                [sold1] join player;
            };
            sold1 doFollow player;
        };
    };

    sleep 2;

};
