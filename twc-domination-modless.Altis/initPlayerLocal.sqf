//makes sure headless clients don't run this:
if (!hasInterface) exitWith {};
waitUntil{!isNull player};
//runs stuff only on the client
execVM "client\init.sqf";
//disables fatigue and makes aiming easier:
player enableFatigue false;
player setCustomAimCoef 0.4;
player addEventHandler ["Respawn",{player enableFatigue false; player setCustomAimCoef 0.4;}];