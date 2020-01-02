

private _playerGrp = group player;
_playerGrp setFormation "LINE";
private _ukritie = 0;
private _pos1 = getPosATL sold1;
private _pos_new = [];
while {true} do
{
    private _nearestBush = nearestTerrainObjects [getPos player, ["BUSH", "SMALL TREE"], 60];
    private _nearestSmallTree = nearestTerrainObjects [getPos player, ["SMALL TREE"], 60];
    private _nearestTree = nearestTerrainObjects [getPos player, ["TREE"], 60];

    //sold1 disableAI "FSM";
    //sold1 setBehaviour "CARELESS";
//    hint format["Bush-%1, Tree-%2, Stoped-%3", count _nearestBush, count _nearestTree, stopped sold1];

     _pos1 = getPosATL sold1;
    if( ((speed player) < 1) && ((_pos1 distance2D _pos_new) > 1) ) then
    {
        if( (count _nearestBush) > 1 ) then
        {
                _ukritie = 1;
                _pos_new = getPosATL (_nearestBush#1);
        };
        if( ((count _nearestTree) > 1) && (_ukritie == 0)) then
        {
                _ukritie = 2;
                _pos_new = getPosATL (_nearestTree#1);
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
    if( (_ukritie != 0) && ((speed sold1) < 1)) then
    {
        sold1 doMove _pos_new;
        _ukritie = 0;
        hint "Сменить позицию";
    };

    sleep 2;

};
