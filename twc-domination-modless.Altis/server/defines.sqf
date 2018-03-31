/*
Written by [TWC] jayman
Holds all defines included the #include for server side functions and other variables
Variables allow the mission to easily be switched to different mods and maps.
*/
//Calls all server side functions.
#include "func\init.sqf";

//creates the badAO's array based on map given in /init
if (whatMap == "Altis")then{badAOs = ["Agia Triada","Telos"];};

//sets up enemy variables based on mods
tank = ["O_MBT_02_cannon_F"];
ifv = ["O_APC_Tracked_02_cannon_F"];
apc = ["O_APC_Wheeled_02_rcws_F"];
squad = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad");
squadAT = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam_AT");
squadAA = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam_AA");
aa = ["O_APC_Tracked_02_AA_F"];
radioTower = "Land_TTowerBig_2_F";
mortar = ["O_Mortar_01_F"];
arty = ["O_MBT_02_arty_F"];
tankaaCombined = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Armored" >> "OIA_TankPlatoon_AA");
enemyFlag = "flag_CSAT";
bunkerMarkerClass = "n_unknown";