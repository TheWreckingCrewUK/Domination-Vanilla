/*
player addEventHandler ["GetInMan",{
	params["_unit","_role","_vehicle","_turret"];
	
	hint format["%1, %2, %3, %4",_unit, _role, _vehicle, _turret];
}];
*/
player addEventHandler ["GetInMan",{
	params["_unit","_role","_vehicle","_turret"];
	
	if(typeOf _vehicle == "I_Heli_light_03_unarmed_F")then{
		if(_role in ["cargo","gunner"] || player == helo1)exitWith{};
		hint "You cannot Fly this Helicopter";
		moveOut player;
	};
	if(typeOf _vehicle == "B_Heli_Transport_01_F")then{
		if(_role in ["cargo","gunner"] || player == helo2)exitWith{};
		hint "You cannot Fly this Helicopter";
		moveOut player;
	};
}];