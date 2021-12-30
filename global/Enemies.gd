extends Node


func wild_monster_saw_magic_trick_fn():
	print("monster growls in response to the magic trick")
	#TODO: TextLog() the message to main text box
var ankheg = {
	"name" : "ankheg",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "group",
	"size" : "large",
	"attack_name" : "bite",
	"attack_base_damage" : 8,
	"attack_modifier" : 1,
	"attack_number" : 1,
	"attack_tag" : "",
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 10,
	"max_hp": 10,
	"stun_points": 0,
	"armor" : 3,
	"special_treasure" : null,
	"special_qualities" : "borrowing",
	"instinct" : "to undermine",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
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
	assert(location != null)
	if location["monsters"] != null:
		var potential_enemies = location["monsters"]
		var duplicated = potential_enemies.duplicate(true) 
		var enemy_type = null
		if duplicated.size() > 1:
			var shuffled = duplicated.shuffle()
			assert(shuffled.size() > 0)
			enemy_type = shuffled.pop_back()
		else:
			enemy_type = duplicated[0] #converts to dict
			assert(typeof(enemy_type) != 19) #19 is array
		var organization = enemy_type["organization"]
		print("organization: %s" % organization)
		var number_of_enemies = 0
		match organization:
			"group":
				number_of_enemies = Utilities.random_number_in_range(2, 5)
			"horde":
				number_of_enemies = Utilities.random_number_in_range(6, 10)
			"solitary":
				number_of_enemies = 1
		print("number of enemies: %s" % number_of_enemies)
		assert(number_of_enemies > 0)
		for enemy in range(number_of_enemies):
			CharacterSheet.battle_targets.append(enemy_type.duplicate(true))
		assert(CharacterSheet.battle_targets.size() > 0)
	else:
		print("this location has no monsters")
		assert(CharacterSheet.battle_targets.size() == 0)



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
