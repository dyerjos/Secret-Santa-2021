extends Node

export var current_scene = "MainMenu"

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
	}

func load(dict):
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
