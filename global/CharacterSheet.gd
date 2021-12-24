extends Node

export var debug_mode = true

export var player_class = ""
export var player_race = ""
export var player_name = ""
export var player_body = ""
export var player_eyes = ""
export var player_decoration = ""
export var player_clothes = ""

export var player_str = ""
export var player_dex = ""
export var player_con = ""
export var player_int = ""
export var player_wis = ""
export var player_cha = ""

export var player_hitpoints = ""
export var class_base_hitpoints = ""
export var player_stunpoints = 0

export var class_base_damage = 4 #TODO: hardcoded wizard stat - have character creation set this in future
export var move_damage_bonus = 0 #* what class has this?
export var weapon_damage_bonus = 0
export var effect_damage_bonus = 0

export var ongoing_spell_modifier = 0
export var ongoing_encumberance_moves_modifier = 0
export var ongoing_rations_moves_modifier = 0
export var ongoing_watch_bonus = 0

export var player_level = 1
export var player_exp = 0

export var player_equipped_armor = 0 #* shields, body armor, etc
export var player_circumstantial_armor = 0 #* if hiding behind cover
export var player_move_armor = 0 #* some class moves provide armor

export var player_coins = 0

export var player_base_load_limit = 7 #TODO: hardcoded wizard stat - have character creation set this in future

export var player_in_danger = false
export var player_hold = 0
export var inventory_locked = false
export var player_in_battle = false
export var game_mode = "character creation"
export var active_weapon = {} 

export var has_a_light = false
export var has_unseen_servant = false
export var has_set_alarm = false

var ongoing_spell = {}

var current_location = {}
var current_scene = "res://menu/MainMenu.tscn"

var missing_items = []
var player_inventory = []
var spells_in_spellbook = []
var prepared_spells = []
var known_cantrips = []
var player_moves = []
var battle_targets = []
var player_debilities = []
var telepathic_bonds = []
var has_leverage_on = []



func save_dict():
	return {
		"current_scene" : current_scene,
		"player_class" : player_class,
		"player_race" : player_race,
		"player_name" : player_name,
		"player_body" : player_body,
		"player_eyes" : player_eyes,
		"player_decoration" : player_decoration,
		"player_clothes" : player_clothes,
		"player_str" : player_str,
		"player_dex" : player_dex,
		"player_con" : player_con,
		"player_int" : player_int,
		"player_wis" : player_wis,
		"player_cha" : player_cha,
		"class_base_hitpoints" : class_base_hitpoints,
		"player_hitpoints" : player_hitpoints,
		"spells_in_spellbook" : spells_in_spellbook,
		"known_cantrips" : known_cantrips,
		"player_level" : player_level,
		"player_exp" : player_exp,
		"player_equipped_armor" : player_equipped_armor,
		"player_circumstantial_armor" : player_circumstantial_armor,
		"class_base_damage" : class_base_damage,
		"player_coins" : player_coins,
		"player_inventory" : player_inventory,
		"move_damage_bonus" : move_damage_bonus,
		"weapon_damage_bonus" : weapon_damage_bonus,
		"effect_damage_bonus" : effect_damage_bonus,
		"player_move_armor" : player_move_armor,
		"player_stunpoints" : player_stunpoints,
		"player_in_danger" : player_in_danger,
		"player_hold" : player_hold,
		"ongoing_spell_modifier" : ongoing_spell_modifier,
		"inventory_locked" : inventory_locked,
		"ongoing_encumberance_moves_modifier" : ongoing_encumberance_moves_modifier,
		"ongoing_rations_moves_modifier" : ongoing_rations_moves_modifier,
		"ongoing_watch_bonus" : ongoing_watch_bonus,
		"player_in_battle" : player_in_battle,
		"battle_targets" : battle_targets,
		"player_debilities" : player_debilities,
		"ongoing_spell" : ongoing_spell,
		"has_a_light" : has_a_light,
		"prepared_spells" : prepared_spells,
		"has_unseen_servant" : has_unseen_servant,
		"telepathic_bonds" : telepathic_bonds,
		"has_set_alarm" : has_set_alarm,
		"player_moves" : player_moves,
		"missing_items" : missing_items,
		"current_location" : current_location,
		"player_base_load_limit" : player_base_load_limit,
		"game_mode" : game_mode,
		"active_weapon" : active_weapon,
		"has_leverage_on" : has_leverage_on,
		
	}

	
func load(dict):
	current_scene = dict["current_scene"]
	player_class = dict["player_class"]
	player_race = dict["player_race"]
	player_name = dict["player_name"]
	player_body = dict["player_body"]
	player_eyes = dict["player_eyes"]
	player_decoration = dict["player_decoration"]
	player_clothes = dict["player_clothes"]
	player_str = dict["player_str"]
	player_dex = dict["player_dex"]
	player_con = dict["player_con"]
	player_int = dict["player_int"]
	player_wis = dict["player_wis"]
	player_cha = dict["player_cha"]
	class_base_hitpoints = dict["class_base_hitpoints"]
	player_hitpoints = dict["player_hitpoints"]
	spells_in_spellbook = dict["spells_in_spellbook"]
	known_cantrips = dict["known_cantrips"]
	player_level = dict["player_level"]
	player_exp = dict["player_exp"]
	player_equipped_armor = dict["player_equipped_armor"]
	player_circumstantial_armor = dict["player_circumstantial_armor"]
	class_base_damage = dict["class_base_damage"]
	player_coins = dict["player_coins"]
	player_inventory = dict["player_inventory"]
	move_damage_bonus = dict["move_damage_bonus"]
	weapon_damage_bonus = dict["weapon_damage_bonus"]
	effect_damage_bonus = dict["effect_damage_bonus"]
	player_move_armor = dict["player_move_armor"]
	player_stunpoints = dict["player_stunpoints"]
	player_in_danger = dict["player_in_danger"]
	player_hold = dict["player_hold"]
	ongoing_spell_modifier = dict["ongoing_spell_modifier"]
	inventory_locked = dict["inventory_locked"]
	ongoing_encumberance_moves_modifier = dict["ongoing_encumberance_moves_modifier"]
	ongoing_rations_moves_modifier = dict["ongoing_rations_moves_modifier"]
	ongoing_watch_bonus = dict["ongoing_watch_bonus"]
	player_in_battle = dict["player_in_battle"]
	battle_targets = dict["battle_targets"]
	player_debilities = dict["player_debilities"]
	ongoing_spell = dict["ongoing_spell"]
	has_a_light = dict["has_a_light"]
	prepared_spells = dict["prepared_spells"]
	has_unseen_servant = dict["has_unseen_servant"]
	telepathic_bonds = dict["telepathic_bonds"]
	has_set_alarm = dict["has_set_alarm"]
	player_moves = dict["player_moves"]
	missing_items = dict["missing_items"]
	current_location = dict["current_location"]
	player_base_load_limit = dict["player_base_load_limit"]
	game_mode = dict["game_mode"]
	active_weapon = dict["active_weapon"]
	has_leverage_on = dict["has_leverage_on"]

	

func damage_bonuses(ability_modifier=0):
	return move_damage_bonus + effect_damage_bonus + ability_modifier

func total_armor():
	return player_circumstantial_armor + player_equipped_armor + player_move_armor

func max_load():
	return player_base_load_limit + Utilities.stat_to_modifier(player_str)

func current_load():
	var _load = 0
	for item in player_inventory:
		assert(item["weight" != null])
		_load += item["weight"]
	return _load

func ongoing_moves_modifier():
	return ongoing_encumberance_moves_modifier + ongoing_rations_moves_modifier + ongoing_watch_bonus

func max_hitpoints():
	return player_con + class_base_hitpoints
