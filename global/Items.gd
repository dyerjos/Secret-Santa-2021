extends Node

#TODO: Finish
var template = { 
	"name" : "name",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

#---------Misc Items----------------

var no_weapon = {
	"name" : "no weapon",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": ["close", "hand"],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": true,
	"is_ranged": false,
	"is_melee": true,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : null,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

var spellbook = { 
	"name" : "spellbook",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : null,
	"weight": 1,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

#TODO: make unseen servant an npc instead of an item in the future
var unseen_servant = { 
	"name" : "unseen servant",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : null,
	"weight": -3,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

#---------Ranged Weapons----------------
#TODO: Finish
var crossbow = { 
	"name" : "crossbow",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var fine_bow = { 
	"name" : "fine bow",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var hunters_bow = { 
	"name" : "hunters bow",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var ragged_bow = { 
	"name" : "ragged bow",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var bundle_of_arrows = { 
	"name" : "bundle of arrows",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var elven_arrows = { 
	"name" : "elven arrows",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#---------Melee Weapons----------------
#TODO: Finish
var club = { 
	"name" : "club",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var dagger = { 
	"name" : "dagger",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var dueling_rapier = { 
	"name" : "dueling rapier",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var halberd = { 
	"name" : "halberd",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var long_sword = { 
	"name" : "long sword",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var battle_axe = { 
	"name" : "battle axe",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var flail = { 
	"name" : "flail",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var rapier = { 
	"name" : "rapier",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var short_sword = { 
	"name" : "short sword",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var axe = { 
	"name" : "axe",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var warhammer = { 
	"name" : "warhammer",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var mace = { 
	"name" : "mace",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var spear = { 
	"name" : "spear",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var staff = { 
	"name" : "staff",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#TODO: Finish
var throwing_dagger = { 
	"name" : "throwing dagger",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

#---------Armor----------------
#TODO: Finish
var template = { 
	"name" : "template",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
var leather_armor = {
	"name" : "leather armor",
	"tags" : ["worn"],
	"coin" : 10,
	"weight": 1,
	"armor" : 1,
}
#---------Gear----------------
var dungeon_rations = {
	"name" : "dungeon rations",
	"tags" : ["ration"],
	"coin" : 3,
	"weight": 1,
	"uses" : 5,
}
var bag_of_books = {
	"name" : "bag of books",
	"tags" : [],
	"coin" : 10,
	"weight": 2,
	"uses" : 5,
}
var healing_potion = {
	"name" : "healing potion",
	"tags" : [],
	"coin" : 50,
	"weight": 0,
}
var antitoxin = {
	"name" : "antitoxin",
	"tags" : [],
	"coin" : 10,
	"weight": 0,
}
#---------Poisons----------------
#TODO: Finish
var template = { 
	"name" : "name",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}

#---------Gifts----------------
#TODO: Finish
var template = { 
	"name" : "name",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#---------Property Deeds / Keys----------------
#TODO: Finish
var template = { 
	"name" : "name",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}
#---------Magic Items----------------
#TODO: Finish
var template = { 
	"name" : "name",
	"attack_tags": [],
	"weapon_tags": [],
	"range_tags": [],
	"general_tags": [],
	"armor_tags": [],
	"needs_repaired": false,
	"needs_reloaded": false,
	"is_weapon": false,
	"is_ranged": false,
	"is_melee": false,
	"is_armor": false,
	"is_gear": false,
	"is_poison": false,
	"is_gift": false,
	"is_certificate": false,
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"coin" : 0,
	"weight": 0,
	"future_item_field_1": "",
	"future_item_field_2": "",
	"future_item_field_3": "",
	"future_item_field_4": "",
	"future_item_field_5": "",
}



#TODO: organize the items
var magical_items = [
]
var minor_magical_items = [
]
var holy_items = [
]
var planar_items = [
]
var ranged_weapons = [
]
var melee_weapons = [
]
var armor = []
var gear = []
var poisons = []
var gifts = []
var property_deeds = [] #TODO: in locations script?

# TODO: services in a global script
func generate_treasure(target):
	var modifier = 0
	modifier += target["attack_modifier"]
	var best_of_two = false
	var found_treasure = {
		"coins": 0,
		"special_items" : []
	}
	for tag in target["monster_tags"]:
		match tag:
			"hoarder": 
				best_of_two = true
			"far_from_home": 
				var rations = CharacterSheet.player_inventory["dungeon_rations"]
				rations.uses += 2
			"magical":
				print("player finds a magical item")
				found_treasure["special_items"].append(generate_special_item(magical_items))
			"divine" :
				print("player finds a holy item")
				found_treasure["special_items"].append(generate_special_item(holy_items))
			"planar" :
				print("player finds a planar item")
				found_treasure["special_items"].append(generate_special_item(planar_items))
			"lord_over_others":
				modifier += Utilities.roll_dice_for_total(1, 4)
			"ancient_and_noteworthy":
				modifier += Utilities.roll_dice_for_total(1, 4)
	var treasure = roll_for_treasure(best_of_two, target, modifier, found_treasure)
	print("treasure: %s" % treasure)
	return treasure



func roll_for_treasure(best_of_two, target, modifier, found_treasure):
	var roll = 0
	var treasure = found_treasure
	if best_of_two:
		roll = Utilities.best_dice(target["attack_number"], target["attack_base_damage"])
	else:
		roll = Utilities.roll_dice_for_total(target["attack_number"], target["attack_base_damage"])
	var treasure_rating = roll + modifier
	match treasure_rating:
		1: 
			# A few coins, 2d8 or so
			treasure["coins"] += Utilities.roll_dice_for_total(2, 8)
		2: 
			# An item useful to the current situation
			print("An item useful to the current situation")
			#TODO: FUTURE - make this more story based
			treasure["special_items"].append(healing_potion)
		3: 
			# Several coins, about 4d10
			treasure["coins"] +=  Utilities.roll_dice_for_total(4, 10)
		4:
			# A small item (gem, art) of considerable value, worth as much as
			# 2d10×10 coins, 0 weight
			treasure["coins"] +=  Utilities.roll_dice_for_total(2, 100)
		5:
			# Some minor magical trinket
			print("Some minor magical trinket")
			treasure["special_items"].append(generate_special_item(minor_magical_items))
		6:
			# Useful information (in the form of clues, notes, etc.)
			print("Useful information (in the form of clues, notes, etc.)")
			treasure["special_items"].append(generate_special_item(CharacterSheet.current_location["useful_information"]))
		7:
			# A bag of coins, 1d4×100 or thereabouts. 1 weight per 100.
			treasure["coins"] +=  Utilities.roll_dice_for_total(1, 400)
		8:
			# A very valuable small item (gem, art) worth 2d6×100, 0 weight 
			treasure["coins"] +=  Utilities.roll_dice_for_total(2, 600)
		9:
			# 	A chest of coins and other small valuables. 1 weight but worth
			# 3d6×100 coins.
			treasure["coins"] +=  Utilities.roll_dice_for_total(3, 600)
		10:
			# A magical item or magical effect
			treasure["special_items"].append(generate_special_item(magical_items))
		11:
			# Many bags of coins for a total of 2d4×100 or so
			treasure["coins"] +=  Utilities.roll_dice_for_total(2, 400)
		12:
			# A sign of office (crown, banner) worth at least 3d4×100 coins 
			treasure["coins"] +=  Utilities.roll_dice_for_total(3, 400)
		13:
			# A large art item worth 4d4×100 coins, 1 weight
			treasure["coins"] +=  Utilities.roll_dice_for_total(4, 400)
		14:
			# A unique item worth at least 5d4×100 coins
			treasure["coins"] +=  Utilities.roll_dice_for_total(5, 400)
		15:
			print("learning new spell")
			Moves.add_to_spellbook_fn()
			print("roll again")
			return roll_for_treasure(best_of_two, target, modifier, found_treasure)
		16:
			#TODO: A portal or secret path (or directions to one) and roll again
			#TODO: give player an option to go in one-time portal like a enter_random_portal() in moves
			print("opening portal or secret path")
			# TODO: implement later
			# Locations.generate_random_portal()
			print("roll again")
			return roll_for_treasure(best_of_two, target, modifier, found_treasure)
		17:
			print("found a missing item")
			print("roll again")
			var missing_item = CharacterSheet.missing_items.duplicate(true).shuffle().pop_back()
			print("found missing item: %s" % missing_item)
			assert(missing_item != null)
			treasure["special_items"].append(CharacterSheet.missing_items.duplicate(true).shuffle().pop_back())
			return roll_for_treasure(best_of_two, target, modifier, found_treasure)
		18:
			# A hoard: 1d10×1000 coins and 1d10×10 gems worth 2d6×100 each
			treasure["coins"] +=  Utilities.roll_dice_for_total(1, 100) * Utilities.roll_dice_for_total(2, 600)
	print("total treasure: %s" % treasure)
	return treasure

func generate_special_item(item_type):
	var potential_items = item_type.duplicate(true)
	var shuffled = potential_items.shuffle()
	assert(shuffled.size() > 0)
	return shuffled.pop_back()
