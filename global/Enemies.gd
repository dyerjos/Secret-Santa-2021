extends Node

#TODO: order monsters by biome
var cavern = [
	ankheg,
]
var swamp = []
var undead = []
var woods = []
var hordes = []
var experiments = []
var underdark = []
var planar = []

#TODO: add "needs_reloaded" field
var ankheg = {
	"name" : "ankheg",
	"organization" : "group",
	"size" : "large",
	"attack_name" : "bite",
	"attack_base_damage" : 8,
	"attack_modifier" : 1,
	"attack_number" : 1,
	"attack_tag" : "",
	"monster_tags" : [],
	"range_tags" : ["close", "reach"],
	"hp" : 10,
	"max_hp": 10,
	"stun_points": 0,
	"armor" : 3,
	"special_qualities" : "borrowing",
	"instinct" : "to undermine",
	"addtional_moves" : ["undermine the ground", "burst from the earth", "spray forth acid, eating away at metal and flesh"]
}


func setup_random_monster_encounter(location, watch_bonus, players_attack_first):
	#TODO: move this to location or enemy script
	CharacterSheet.ongoing_watch_bonus = watch_bonus
	print("generating monsters from location")
	generate_monsters(location)
	print("player now in battle")
	CharacterSheet.player_in_battle = true
	#TODO: UI changes for battle
	print("trigger UI changes for battle here")


func generate_monsters(location):
	#TODO: location needs "monster_setting" field
	var potential_enemeies = location["monster_setting"].duplicate(true).shuffle()
	#TODO: fix line 50
	var enemy_type = potential_enemeies.pop_back()
	var organization = enemy_type["organization"]
	var number_of_enemies = 0
	match organization:
		"group":
			print("2-5 of them")
			number_of_enemies = Utilities.random_number_in_range(2, 5)
		"horde":
			print("over 5 of them")
			number_of_enemies = Utilities.random_number_in_range(6, 10)
		"solitary":
			print("only 1")
			number_of_enemies = 1
	assert(number_of_enemies > 0)
	for enemy in number_of_enemies:
		CharacterSheet.battle_targets.append(enemy_type.duplicate(true))
