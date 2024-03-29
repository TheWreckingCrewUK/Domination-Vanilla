/*
* Function to spawn an AO
*
* params["_pos","_name"];
*
* returns nothing, but creates the AO
*/

params["_pos","_name"];

//Creates ao marker, tasks, and hints
_markerstr = createMarker ["aoCenterMarker",_pos];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType enemyFlag;

[West,[_name],["Complete any side missions and clear out hostiles to complete the AO",format["%1 AO",_name],""],(getMarkerPos  _markerstr),True,1,True,"attack",False] call BIS_fnc_taskCreate;

parseText format["<t align='center'><t size='2' color='#ff0000'>AO created at </t><br/><t align='center'><t size='1.5' color='#ffffff'> %1</t><br/><t align='center'>---------------------<br/></t><t align='left'><t size='1' shadow='1.1' shadowColor='#000000' color='#CC4D00'>Complete any side missions and clear out hostiles to complete the AO </t>", _name] remoteExec ["hint"];

//Defines/Resets variables for capturing the AO
lowPlayerCount = 0;
twc_aoBoolArray = [];

compositionObjects = [];

/*
Side Mission List:
twc_fnc_arty
twc_fnc_mortar
twc_fnc_armour
*/

//Main Objective and Trigger
areaCleared = false;
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["EAST", "PRESENT", false];
_trg setTriggerTimeout [10,10,10,True];
_trg setTriggerStatements ["((EAST countSide thisList) < 12 && ({_x isKindOf 'landVehicle' && side _x == EAST} count thisList == 0))","areaCleared = true", ""];
twc_aoBoolArray pushback areaCleared;

//Bunker 1
_spawnPos = [_pos,[150,350],[10,110],0,[1,100]] call SHK_pos;
bunker1 = "land_BagBunker_Large_F" createVehicle _spawnPos;
_dir = [_spawnPos, _pos] call BIS_fnc_dirTo;
bunker1 setDir _dir;
	
sleep 1;
	
_unit = [_spawnPos, EAST, squad] call BIS_fnc_spawnGroup;
[_unit, _spawnPos, 20] call twc_fnc_defend;
	
_markerstr = createMarker ["aoBunkerOne",_spawnPos];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType bunkerMarkerClass;
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerSize [0.5,0.5];

aoBunkerOne = false;
_trg = createTrigger ["EmptyDetector", _spawnPos];
_trg setTriggerArea [10,10,_dir,True];
_trg setTriggerTimeout [5,5,5,True];
_trg setTriggerActivation ["WEST", "Present", False];
_trg setTriggerStatements ["this","'Bunker A Captured' remoteExec ['hint']; aoBunkerOne = true; 'aobunkerone' setMarkerColor 'colorWEST'; ['Bunker_A','Succeeded'] call bis_fnc_taskSetState",""];
[West,["Bunker_A"],["Capture bunker A","Bunker A",""],(getMarkerPos  _markerstr),false,1,false,"A",False] call BIS_fnc_taskCreate;
twc_aoBoolArray pushback aoBunkerOne;

//Bunker 2
_spawnPos = [_pos,[150,250],[130,230],0,[1,100]] call SHK_pos;
bunker2 = "land_BagBunker_Large_F" createVehicle _spawnPos;
_dir = [_spawnPos, _pos] call BIS_fnc_dirTo;
bunker2 setDir _dir;
	
sleep 1;
	
_unit = [_spawnPos, EAST, squad] call BIS_fnc_spawnGroup;
[_unit, _spawnPos, 20] call twc_fnc_defend;
		
_markerstr = createMarker ["aobunkertwo",_spawnPos];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType bunkerMarkerClass;
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerSize [0.5,0.5];

aoBunkerTwo = false;
_trg = createTrigger ["EmptyDetector", _spawnPos];
_trg setTriggerArea [10,10,_dir,True];
_trg setTriggerTimeout [5,5,5,True];
_trg setTriggerActivation ["WEST", "Present", False];
_trg setTriggerStatements ["this","'Bunker B Captured' remoteExec ['hint']; aoBunkerTwo = true; 'aobunkertwo' setMarkerColor 'colorWEST'; ['Bunker_B','Succeeded'] call bis_fnc_taskSetState",""];
[West,["Bunker_B"],["Capture bunker B","Bunker B",""],(getMarkerPos  _markerstr),false,1,false,"B",False] call BIS_fnc_taskCreate;
twc_aoBoolArray pushback aobunkerTwo;

//if there is more than 8 players it spawns the side missions and a 3rd bunker
_script = "";
if((count allPlayers) > 0) then{

	_script = [_pos,_name] spawn twc_fnc_highPlayers;
}else{

	_script = [_pos,_name] spawn twc_fnc_lowPlayers;
};
//Waits to set order of objectives correctly. Cause autism or something.
waitUntil{scriptDone _script};

//Artillery Base
artilleryOBJ = false;
_spawnPos = [_pos,[200,400],random 360,0,[1,100]] call SHK_pos;
_dir = [_spawnPos, getMarkerPos "respawn_west"] call BIS_fnc_dirTo;
_unit = [_spawnPos, EAST, spg] call BIS_fnc_spawnGroup;
(vehicle (leader _unit)) setFuel 0;
(vehicle (leader _unit)) setDir _dir;
(vehicle (leader _unit)) addEventHandler ["Killed",{[]spawn{sleep 1; artilleryOBJ = true; ["SPGOBJ","SUCCEEDED"] call BIS_fnc_taskSetState}}];
["comp_artilleryBaseSmall", ((getDir (vehicle (leader _unit))) - 90), _spawnPos] execVM "server\sys_compositions\createComposition.sqf";
twc_aoBoolArray pushback artilleryOBJ;

[West,["SPGOBJ"],["Destroy the enemy Artillery","Destroy Artillery Site"],_spawnPos,false,1,false,"destroy",False] call BIS_fnc_taskCreate;

waitUntil{twc_aoBoolArray = [aoBunkerOne, aoBunkerTwo, aoBunkerThree, artilleryOBJ, radioTowerObj]; !(false in twc_aoBoolArray)};

//updates Tasks
[_name, "Succeeded",true] spawn BIS_fnc_taskSetState;
["SPGOBJ"] call bis_fnc_deleteTask;
["Bunker_A"] call bis_fnc_deleteTask;
["Bunker_B"] call bis_fnc_deleteTask;
["Bunker_C"] call bis_fnc_deleteTask;
["radioTowerObj"] call bis_fnc_deleteTask;

hint "AO captured";
deleteMarker "aobunkerone";
deleteMarker "aobunkertwo";
deleteMarker "aoCenterMarker";
deleteVehicle bunker1;
deleteVehicle bunker2;
if (lowPlayerCount == 0)then{
	deleteMarker "aobunkerthree";
	deleteVehicle bunker3;
	
	_wreck = (getMarkerPos "radioMarker") nearestObject "Land_TTowerBig_2_ruins_F";
	deleteVehicle _wreck;
	deleteMarker "radioMarker";
};
lastAO = _name;
{
	deleteVehicle _x
}forEach compositionObjects;

{
	deleteVehicle _x
}forEach allDeadMen;
{
	deleteVehicle _x
}forEach allDead;

{
	deleteGroup _x
}forEach allGroups;

execVM "server\ao\getAO.sqf";