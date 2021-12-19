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

export var class_base_damage = 0
export var move_damage_bonus = 0 #* what class has this?
export var weapon_damage_bonus = 0
export var effect_damage_bonus = 0

export var player_level = 1
export var player_exp = 0

export var player_equipped_armor = 0 #* shields, body armor, etc
export var player_circumstantial_armor = 0 #* if hiding behind cover
export var player_move_armor = 0 #* some class moves provide armor

export var player_coins = 0

export var player_max_load = 0
export var player_current_load = 0

export var player_in_danger = false


var current_scene = "res://menu/MainMenu.tscn"
var player_inventory = []
var player_level_one_spells = []
var known_cantrips = []
var player_moves = []




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
		"player_level_one_spells" : player_level_one_spells,
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
		"player_move_armor" : player_move_armor,
		"player_stunpoints" : player_stunpoints,
		"player_in_danger" : player_in_danger
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
	player_level_one_spells = dict["player_level_one_spells"]
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
	

func damage_bonuses(ability_modifier=0):
	return move_damage_bonus + effect_damage_bonus + ability_modifier

func total_armor():
	return player_circumstantial_armor + player_equipped_armor + player_move_armor
