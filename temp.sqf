
comment "Exported from Arsenal by ivat-home";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "rhs_weap_ak74m";
this addPrimaryWeaponItem "rhs_acc_dtk";
this addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";
this addWeapon "rhs_weap_rpg7";
this addSecondaryWeaponItem "rhs_acc_pgo7v3";
this addSecondaryWeaponItem "rhs_rpg7_PG7VL_mag";

comment "Add containers";
this forceAddUniform "rhs_uniform_vdv_emr";
this addVest "rhs_6b23_digi_rifleman";
this addBackpack "rhs_rpg";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "rhs_30Rnd_545x39_7N10_AK";};
for "_i" from 1 to 5 do {this addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
this addItemToVest "rhs_mag_rgn";
this addItemToBackpack "rhs_rpg7_PG7VL_mag";
this addItemToBackpack "rhs_rpg7_OG7V_mag";
this addItemToBackpack "rhs_rpg7_TBG7V_mag";
this addHeadgear "rhs_6b28";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";

comment "Set identity";
[this,"RHS_WhiteHead_07","male02rus"] call BIS_fnc_setIdentity;
