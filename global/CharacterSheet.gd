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

export var player_level_one_spells = []
export var known_cantrips = []
export var player_moves = []

export var player_hitpoints = ""
export var class_base_hitpoints = ""

export var class_base_damage = ""

export var player_level = 1
export var player_exp = 0

export var player_equipped_armor = 0 #* shields, body armor, etc
export var player_circumstantial_armor = 0 #* if hiding behind cover

export var player_coins = 0

export var player_max_load = 0
export var player_current_load = 0
export var player_inventory = []

var current_scene = "res://menu/MainMenu.tscn"


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

func stat_to_modifier(stat):
	assert(stat >= 1)
	assert(stat <= 18)
	if stat >= 1 and stat <= 3:
		return -3
	elif stat == 4 or stat == 5:
		return -2
	elif stat >= 6 and stat <=8:
		return -1
	elif stat >= 9 and stat <= 12:
		return 0
	elif stat >= 13 and stat <= 15:
		return 1
	elif stat >= 16 and stat <= 17:
		return 1
	elif stat == 18:
		return 3
	else:
		print("stat shouldn't be %s" % stat)
		
