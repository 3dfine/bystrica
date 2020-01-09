
player allowDamage false;

private _posend = getMarkerPos "mark1";
private _vectdir = _posend vectorDiff (getPos player);
private _vectdirnorm = vectorNormalized _vectdir;
private _newVector = _vectdirnorm vectorMultiply 80;
private _newVectorTree = _vectdirnorm vectorMultiply -1.5;
private _pos1 = _newVector vectorAdd (getPos player);

sold1 forceWeaponFire ["rhs_weap_rpg7", "Single"];
sold1 commandFire tar1;

sold1 doArtilleryFire [position tar1, "rhs_weap_rpg7", 1];

/*
find_tree = {
    private _tree_coord2 = [0,0,0] ; //координата дерева
    private _tree_coord = (getPosATL (_this select 0)) vectorAdd [0,0,0.7] ; //координата дерева
    private _target_coord = _this select 1; //координата цели
    private _grid_cell_size = 0.2;
    private _grid_cell_count = 40;
    private _vec_to_target = vectorNormalized( _target_coord vectorDiff _tree_coord ); //вектор на цель
    _vec_to_target = [1,0,0];
    private _vec_orto_to_target = vectorNormalized( [ -1 * (_vec_to_target#1)/(_vec_to_target#0), 1, (_vec_to_target#2) ] );  //сделать проверку деления на НОЛЬ!!!
    _vec_orto_to_target = [0,1,0];
    private _start_point = _tree_coord vectorDiff ( _vec_to_target vectorMultiply (0.5 * _grid_cell_size * _grid_cell_count) );
    private _start_point0 = _tree_coord vectorDiff ( _vec_to_target vectorMultiply (-0.5 * _grid_cell_size * _grid_cell_count) );
    private _start_point1 = _start_point vectorDiff ( _vec_orto_to_target vectorMultiply (0.5 * _grid_cell_size * _grid_cell_count) );
    private _start_point2 = _start_point vectorDiff ( _vec_orto_to_target vectorMultiply (-0.5 * _grid_cell_size * _grid_cell_count) );
    private _start_point3 = _start_point0 vectorDiff ( _vec_orto_to_target vectorMultiply (0.5 * _grid_cell_size * _grid_cell_count) );
    private _kromka1x =  0;
    private _kromka2x =  0;
    private _kromkaXold =  0;
    private _kromka1y =  0;
    private _kromka2y =  0;
    private _kromkaYold =  0;
    private _find_tree = false;
    for "_i" from 0 to _grid_cell_count do
    {
        private _coord_A = _grid_cell_size * _i;
        private _pos1 =  _start_point1 vectorAdd (_vec_to_target vectorMultiply _coord_A);
        private _pos2 =  _start_point2 vectorAdd (_vec_to_target vectorMultiply _coord_A);
        private _intersections = lineIntersectsObjs [ATLToASL _pos1, ATLToASL _pos2, objNull, objNull, false, 4];
        if( (_this#0 in _intersections) && (!_find_tree) ) then
        {
            _find_tree = true;
            _kromka1x = _kromkaXold;
        //    createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        };
        if( !(_this#0 in _intersections) && (_find_tree) ) then
        {
            _find_tree = false;
            _kromka2x = _pos1#0;
        //    createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        };
        _kromkaXold = _pos1#0;
        //createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        //createVehicle ["Sign_Sphere25cm_F", _pos2, [], 0, "CAN_COLLIDE"];
    };
    _find_tree = false;
    for "_i" from 0 to _grid_cell_count do
    {
        private _coord_A = _grid_cell_size * _i;
        private _pos1 =  _start_point3 vectorAdd (_vec_orto_to_target vectorMultiply _coord_A);
        private _pos2 =  _start_point1 vectorAdd (_vec_orto_to_target vectorMultiply _coord_A);
        private _intersections = lineIntersectsObjs [ATLToASL _pos1, ATLToASL _pos2, objNull, objNull, false, 4];
        if( (_this#0 in _intersections) && (!_find_tree) ) then
        {
            _find_tree = true;
            _kromka1y = _kromkaYold;
        //    createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        };
        if( !(_this#0 in _intersections) && (_find_tree) ) then
        {
            _find_tree = false;
            _kromka2y = _pos1#1;
        //    createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        };
        _kromkaYold = _pos1#1;
        //createVehicle ["Sign_Sphere25cm_F", _pos1, [], 0, "CAN_COLLIDE"];
        //createVehicle ["Sign_Sphere25cm_F", _pos2, [], 0, "CAN_COLLIDE"];
    };
    _tree_coord2 set [0, (_kromka1x + _kromka2x)/2];
    _tree_coord2 set [1, (_kromka1y + _kromka2y)/2];
    _tree_coord2 set [2, 0];

    if( (_tree_coord2 distance2D _tree_coord) > 50) then
    {
        _tree_coord2 = _tree_coord;
    };
//    createVehicle ["Sign_Sphere200cm_F", _tree_coord2 vectorAdd _newVectorTree, [], 0, "CAN_COLLIDE"];

    _tree_coord2
};
[obj1, _posend] call find_tree;


private _terrobj = nearestTerrainObjects [_pos1, ["BUSH", "SMALL TREE", "TREE"], 40];
private _terrobj_sorted =
[
    _terrobj,
    [],
    { _x distance2D player; },
    "ASCEND"
] call BIS_fnc_sortBy;
hint format["%1", count _terrobj ];
{
    private _tree1 = _terrobj_sorted#_forEachIndex;
    _x doMove ( ([_tree1, _posend] call find_tree) vectorAdd _newVectorTree  );
} forEach units grp1;

while {true} do
{
    //private _intersections = lineIntersectsWith [eyePos player, getPosASL obj1];
    //[begPosASL, endPosASL, ignoreObj1, ignoreObj2, sortMode, maxResults, LOD1, LOD2, returnUnique]
    private _intersections = lineIntersectsObjs [(eyePos player),(getPosASL obj1),objNull,objNull,false,4];
//    hint format["%1", _intersections ];
    sleep 0.5;
};
