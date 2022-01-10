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
	"special_qualities" : [],
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
	"special_qualities" : ["borrowing"],
	"instinct" : "to undermine",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["undermine the ground", "burst from the earth", "spray forth acid, eating away at metal and flesh"]
}
var cave_rat = {
	"name" : "cave rat",
	"description": "A giant rat",
	"useful_info": "be careful, their attacks can pierce armor",
	"interesting_info": "it has big teeth",
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
	"special_qualities" : [],
	"instinct" : "to devour",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["swarm", "rip something apart"]
}
var choker = {
	"name" : "choker",
	"description": "a zombie like creature with wet rubbery skin",
	"useful_info": "don't let it get close enough to grab you",
	"interesting_info": "looks like a zombie",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "normal",
	"attack_name" : "choke",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["stealthy", "intelligent"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 15,
	"max_hp": 15,
	"stun_points": 0,
	"armor" : 2,
	"special_treasure" : null,
	"special_qualities" : ["flexible"],
	"instinct" : "to deny light",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["hold a creature", "fling a held creature"]
}
var cloaker = {
	"name" : "cloaker",
	"description": "an animated cloak",
	"useful_info": "don't put on the cloak",
	"interesting_info": "it looks like a cloak",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "normal",
	"attack_name" : "constrict",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["stealthy"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close"],
	"hp" : 12,
	"max_hp": 12,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : ["looks like a cloak"],
	"instinct" : "to engulf",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["engulf the unsuspecting"]
}
var dwarven_warrior = {
	"name" : "dwarven warrior",
	"description": "a dwarven warrior",
	"useful_info": "it's probably defending something",
	"interesting_info": "it's a dwarf",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "small",
	"attack_name" : "axe",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["organized"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 7,
	"max_hp": 7,
	"stun_points": 0,
	"armor" : 2,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to defend",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["drive them back", "call up reinforcements"]
}
var earth_elemental = {
	"name" : "earth elemental",
	"description": "an earth spirit",
	"useful_info": "it can only attack at reach. it can't attack you if you stay close enough",
	"interesting_info": "a big rock creature",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "huge",
	"attack_name" : "smash",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+5 damage", "forceful"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["reach"],
	"hp" : 27,
	"max_hp": 27,
	"stun_points": 0,
	"armor" : 4,
	"special_treasure" : null,
	"special_qualities" : ["made of stone"],
	"instinct" : "to show the strength of earth",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["turn the ground into a weapon", "meld into stone"]
}
var goliath = {
	"name" : "goliath",
	"description": "it's a giant",
	"useful_info": "it can only attack at reach. try staying very close to it",
	"interesting_info": "it a huge giant and it's not happy",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "group",
	"size" : "huge",
	"attack_name" : "mace",
	"attack_base_damage" : 8,
	"attack_number" : 1,
	"attack_tags" : ["+7 damage"],
	"monster_tags" : ["organized", "intelligent"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["reach"],
	"hp" : 14,
	"max_hp": 14,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to retake",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["shake the earth", "retreat, only to come back stronger"]
}
var fire_beetle = {
	"name" : "fire beetle",
	"description": "a fire beetle",
	"useful_info": "this kind of beetle can shoot fire",
	"interesting_info": "looks like a red beetle of some sort",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "small",
	"attack_name" : "flames",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : ["ignores armor"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["near"],
	"hp" : 3,
	"max_hp": 3,
	"stun_points": 0,
	"armor" : 3,
	"special_treasure" : null,
	"special_qualities" : ["full of flames"],
	"instinct" : "to enflame",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["undermine the ground", "burst from the earth", "spray forth flames"]
}
var gargoyle = {
	"name" : "gargoyle",
	"description": "a winged reptile",
	"useful_info": "it's likely guarding something",
	"interesting_info": "it's a big winged reptile",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "normal",
	"attack_name" : "claw",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["hoarder", "stealthy"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close"],
	"hp" : 3,
	"max_hp": 3,
	"stun_points": 0,
	"armor" : 2,
	"special_treasure" : null,
	"special_qualities" : ["wings"],
	"instinct" : "to guard",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["attack with the element of surprise", "take to the air", "blend into stonework"]
}
var gelatinous_cube = {
	"name" : "gelatinous cube",
	"description": "a gelatinous cube",
	"useful_info": "be careful, it's attack ignores armor",
	"interesting_info": "it's a large jelly cube",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "engulf",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+1 damage", "ignores armor"],
	"monster_tags" : ["stealthy", "amorphous"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["hand"],
	"hp" : 20,
	"max_hp": 20,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to clean",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["fill an empty space", "dissolve"]
}
var goblin = {
	"name" : "goblin",
	"description": "a goblin",
	"useful_info": "don't let it call more friends!",
	"interesting_info": "its small and green",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "small",
	"attack_name" : "spear",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["intelligent", "organized"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 3,
	"max_hp": 3,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to multiply",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["charge!", "call more goblins", "retreat and return with many more"]
}
var goblin_orkaster = {
	"name" : "goblin_orkaster",
	"description": "a goblin that knows magic",
	"useful_info": "be careful, it's attack can ignore armor",
	"interesting_info": "it's a small green goblin",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "small",
	"attack_name" : "acid orb",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+1 damage", "ignores armor"],
	"monster_tags" : ["magical", "intelligent"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["near", "far"],
	"hp" : 12,
	"max_hp": 12,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to tap power beyond their stature",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["unleash a poorly understood spell", "pour forth magical chaos", "use other goblins for shields"]
}
var otyugh = {
	"name" : "otyugh",
	"description": "a large creature with tentacles",
	"useful_info": "be careful, it can infect creatures with filth fever",
	"interesting_info": "it has lots of tentacles",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "tentacles",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+3 damage", "forceful"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 20,
	"max_hp": 20,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : ["filth fever"],
	"instinct" : "to befoul",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["infect someone with filth fever", "fling someone or something"]
}
var maggot_squid = {
	"name" : "maggot-squid",
	"description": "a small squid",
	"useful_info": "it's tentacles can paralyze",
	"interesting_info": "it has tentacles",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "small",
	"attack_name" : "chew",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close"],
	"hp" : 3,
	"max_hp": 3,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : ["amphibious", "paralyzing tentacles"],
	"instinct" : "",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["paralyze with a touch"]
}
var purple_worm = {
	"name" : "purple worm",
	"description": "a huge purple worm",
	"useful_info": "it can burrow through earth and stone",
	"interesting_info": "it has alot of teeth",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "huge",
	"attack_name" : "bite",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+5 damage", "forceful"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["reach"],
	"hp" : 20,
	"max_hp": 20,
	"stun_points": 0,
	"armor" : 2,
	"special_treasure" : null,
	"special_qualities" : ["burrowing"],
	"instinct" : "to consume",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["swallow whole", "tunnel through stone and earth"]
}
var roper = {
	"name" : "roper",
	"description": "a rock-like predator",
	"useful_info": "it looks like a rock formation and likes to ambush",
	"interesting_info": "it looks like a rock",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "bite",
	"attack_base_damage" : 10,
	"attack_number" : 1,
	"attack_tags" : ["+1 damage"],
	"monster_tags" : ["stealthy", "intelligent"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 16,
	"max_hp": 16,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : ["rock-like flesh"],
	"instinct" : "to ambush",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["ensnare the unsuspecting", "disarm a foe", "chew on someone"]
}
var rot_grub = {
	"name" : "rot grub",
	"description": "a grub that eats meat",
	"useful_info": "beware, it can lay eggs in creatures",
	"interesting_info": "it looks like a tiny grub",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "horde",
	"size" : "tiny",
	"attack_name" : "burrow",
	"attack_base_damage" : 6,
	"attack_number" : 1,
	"attack_tags" : ["-2 damage"],
	"monster_tags" : [],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["hand"],
	"hp" : 3,
	"max_hp": 3,
	"stun_points": 0,
	"armor" : 0,
	"special_treasure" : null,
	"special_qualities" : ["burrow into flesh"],
	"instinct" : "to infect",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["burrow under flesh", "lay eggs", "burst forth from an infected creature"]
}
var spiderlord = {
	"name" : "spiderlord",
	"description": "a large spider",
	"useful_info": "it can weave webs",
	"interesting_info": "it has big mandibles",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "solitary",
	"size" : "large",
	"attack_name" : "mandibles",
	"attack_base_damage" : 8,
	"attack_number" : 1,
	"attack_tags" : ["+4 damage"],
	"monster_tags" : ["devious", "intelligent"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close", "reach"],
	"hp" : 16,
	"max_hp": 16,
	"stun_points": 0,
	"armor" : 3,
	"special_treasure" : null,
	"special_qualities" : ["burrowing"],
	"instinct" : "to weave webs",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["enmesh in webbing", "put a plot into motion"]
}
var troglodyte = {
	"name" : "troglodyte",
	"description": "an ape-man",
	"useful_info": "where there's one, there's likely more",
	"interesting_info": "it has a large club",
	"friend_foe" : "[Enemy]", # "[Ally]" for friend
	"organization" : "group",
	"size" : "normal",
	"attack_name" : "club",
	"attack_base_damage" : 8,
	"attack_number" : 1,
	"attack_tags" : [],
	"monster_tags" : ["organized"],
	"is_charmed": false,
	"telepathic_bond_with_player" : false,
	"is_invisible" : false,
	"range_tags" : ["close"],
	"hp" : 10,
	"max_hp": 10,
	"stun_points": 0,
	"armor" : 1,
	"special_treasure" : null,
	"special_qualities" : [],
	"instinct" : "to prey on civilization",
	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
	"addtional_moves" : ["raid and retreat", "use scavenged weapons or magic"]
}

#* ------ swamp monsters -------------
#var template = {
#	"name" : "template",
#	"description": "",
#	"useful_info": "",
#	"interesting_info": "",
#	"friend_foe" : "[Enemy]", # "[Ally]" for friend
#	"organization" : "solitary",
#	"size" : "large",
#	"attack_name" : "attack_name",
#	"attack_base_damage" : 0,
#	"attack_number" : 1,
#	"attack_tags" : [],
#	"monster_tags" : [],
#	"is_charmed": false,
#	"telepathic_bond_with_player" : false,
#	"is_invisible" : false,
#	"range_tags" : ["close", "reach"],
#	"hp" : 100,
#	"max_hp": 100,
#	"stun_points": 0,
#	"armor" : 0,
#	"special_treasure" : null,
#	"special_qualities" : [],
#	"instinct" : "",
#	"saw_magic_trick" : funcref(self, "wild_monster_saw_magic_trick_fn"),
#	"addtional_moves" : []
#}
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
