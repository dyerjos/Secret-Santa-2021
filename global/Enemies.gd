extends Node


func wild_monster_saw_magic_trick_fn():
	print("monster growls in response to the magic trick")
	#TODO: TextLog() the message to main text box

var template = {
	"name" : "template",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}

#Notes: monster tags include amorphous, cautious, construct, devious, hoarder,
# intelligent, magical, planar, stealthy, terrifying

#* ------ cavern monsters -------------

var ankheg = {
	"name" : "ankheg",
	"description": "A hide like plate armor and great crushing mandibles are problematic. A stomach full of acid that can burn a hole through a stone wall makes them all the worse. They would be bad enough if they were proper insect-sized, but these things have the gall to be as long as any given horse. It is just not natural! ",
	"useful_info": "it can only attack from close range",
	"interesting_info": "it's a giant insect",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "group",
	"size" : "large",
	"attack_name" : "bite",
	"attack_base_damage" : 8,
	"attack_number" : 1,
	"attack_tags" : ["+1 damage"],
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
var cave_rat = {
	"name" : "cave rat",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "small",
	"attack_name" : "gnaw",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : ["messy", "+1 piercing"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close"],
	"hp" : 7,
	"max_hp": 7,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "to devour",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["swarm", "rip something apart"]
}
var choker = {
	"name" : "choker",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var cloaker = {
	"name" : "cloaker",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var dwarven_warrior = {
	"name" : "dwarven warrior",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var earth_elemental = {
	"name" : "earth elemental",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var goliath = {
	"name" : "goliath",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var fire_beetle = {
	"name" : "fire beetle",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var gargoyle = {
	"name" : "gargoyle",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var gelatinous_cube = {
	"name" : "gelatinous cube",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var goblin = {
	"name" : "goblin",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var goblin_orkaster = {
	"name" : "goblin_orkaster",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var otyugh = {
	"name" : "otyugh",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var maggot_squid = {
	"name" : "maggot squid",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var purple_worm = {
	"name" : "purple worm",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var roper = {
	"name" : "roper",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var spiderlord = {
	"name" : "spiderlord",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
var troglodyte = {
	"name" : "troglodyte",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}

#* ------ swamp monsters -------------
var template = {
	"name" : "template",
	"description": "",
	"useful_info": "",
	"interesting_info": "",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "attack_name",
	"attack_base_damage" : 0,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 100,
	"max_hp": 100,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : "",
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : []
}
#* ------ undead monsters -------------

#* ------ woods monsters -------------

#* ------ hordes monsters -------------

#* ------ experiments monsters -------------

#* ------ underdark monsters -------------

#* ------ planar monsters -------------


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
	cave_rat,
	choker,
	cloaker,
	dwarven_warrior,
	earth_elemental,
	goliath,
	fire_beetle,
	gargoyle,
	gelatinous_cube,
	goblin,
	goblin_orkaster,
	otyugh,
	maggot_squid,
	purple_worm,
	roper,
	spiderlord,
	troglodyte,
]
var swamp = []
var undead = []
var woods = []
var hordes = []
var experiments = []
var underdark = []
var planar = []
