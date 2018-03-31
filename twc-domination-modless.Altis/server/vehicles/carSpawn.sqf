_dir = 0;
if(whatMap == "Altis")then{_dir = 136.25};
_abandenTime = 1800;
_deadTime = 120;

_veh1 = "B_MRAP_01_F" createVehicle (getMarkerPos "veh1");
_veh1 setdir _dir;
clearItemCargoGlobal _veh1;
clearMagazineCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
clearBackpackCargoGlobal _veh1;
[_veh1, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh2 = "B_MRAP_01_F" createVehicle (getMarkerPos "veh2");
_veh2 setdir _dir;
clearItemCargoGlobal _veh2;
clearMagazineCargoGlobal _veh2;
clearWeaponCargoGlobal _veh2;
clearBackpackCargoGlobal _veh2;
[_veh2, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh3 = "B_MRAP_01_hmg_F" createVehicle (getMarkerPos "veh3");
_veh3 setdir _dir;
clearItemCargoGlobal _veh3;
clearMagazineCargoGlobal _veh3;
clearWeaponCargoGlobal _veh3;
clearBackpackCargoGlobal _veh3;
[_veh3, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh4 = "B_MRAP_01_hmg_F" createVehicle (getMarkerPos "veh4");
_veh4 setdir _dir;
clearItemCargoGlobal _veh4;
clearMagazineCargoGlobal _veh4;
clearWeaponCargoGlobal _veh4;
clearBackpackCargoGlobal _veh4;
[_veh4, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh5 = "B_MRAP_01_gmg_F" createVehicle (getMarkerPos "veh5");
_veh5 setdir _dir;
clearItemCargoGlobal _veh5;
clearMagazineCargoGlobal _veh5;
clearWeaponCargoGlobal _veh5;
clearBackpackCargoGlobal _veh5;
[_veh5, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh6 = "B_MRAP_01_gmg_F" createVehicle (getMarkerPos "veh6");
_veh6 setdir _dir;
clearItemCargoGlobal _veh6;
clearMagazineCargoGlobal _veh6;
clearWeaponCargoGlobal _veh6;
clearBackpackCargoGlobal _veh6;
[_veh6, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";

_veh7 = "B_APC_Tracked_01_rcws_F" createVehicle (getMarkerPos "veh7");
_veh7 setdir _dir;
clearItemCargoGlobal _veh7;
clearMagazineCargoGlobal _veh7;
clearWeaponCargoGlobal _veh7;
clearBackpackCargoGlobal _veh7;
[_veh7, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";
	
_veh8 = "B_APC_Tracked_01_rcws_F" createVehicle (getMarkerPos "veh8");
_veh8 setdir _dir;
clearItemCargoGlobal _veh8;
clearMagazineCargoGlobal _veh8;
clearWeaponCargoGlobal _veh8;
clearBackpackCargoGlobal _veh8;
[_veh8, _deadTime, _abandenTime, -1, FALSE] execVM "server\vehicles\vehicleRespawn.sqf";