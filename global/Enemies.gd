extends Node

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
	CharacterSheet.ongoing_watch_bonus = watch_bonus
	print("generating monsters from location")
	generate_monsters(location)
	print("player now in battle")
	CharacterSheet.player_in_battle = true
	print("trigger UI changes for battle here")


func generate_monsters(location):
	#TODO: location needs "monster_setting" field
	var potential_enemies = []
	assert(location != null)
	if location["monster_setting"]:
		var monster_setting = location["monster_setting"]
		assert(Enemies.monster_setting != null)
		potential_enemies = Enemies.monster_setting.duplicate(true).shuffle()
		assert(potential_enemies.size() > 0)
	var enemy_type = potential_enemies.pop_back()
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
