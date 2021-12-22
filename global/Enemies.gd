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
	if location["monsters"] != null:
		potential_enemies = location["monsters"].shuffle()
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
	else:
		print("this location has no monsters")

func generate_treasure(target):
	var modifier = 0
	modifier += target["attack_modifier"]
	var best_of_two = false
	var roll = 0
	for tag in monster_tags:
		match tag:
			"hoarder": 
				best_of_two = true
			"far_from_home": 
				var rations = CharacterSheet.player_inventory["dungeon_rations"]
				rations.uses += 2
			"magical":
				#TODO: player finds a magical item
			"divine" :
				#TODO: player finds a holy item
			"planar" :
				#TODO: player finds a planar item
			"lord_over_others":
				modifier += Utilities.roll_dice_for_total(1, 4)
			"ancient_and_noteworthy":
				modifier += Utilities.roll_dice_for_total(1, 4)
	if best_of_two:
		roll = Utilities.best_dice(target["attack_number"], target["attack_base_damage"])
	else:
		roll = Utilities.roll_dice_for_total(target["attack_number"], target["attack_base_damage"])
	var treasure_rating = roll + modifier
	roll_again = false
	match treasure_rating:
		1: 
			# A few coins, 2d8 or so
			return Utilities.roll_dice_for_total(2, 8)
		2: 
			# An item useful to the current situation
		3: 
			# Several coins, about 4d10
			return Utilities.roll_dice_for_total(4, 10)
		4:
			# A small item (gem, art) of considerable value, worth as much as
			# 2d10×10 coins, 0 weight
			return Utilities.roll_dice_for_total(2, 100)

		5:
			# Some minor magical trinket
		6:
			# Useful information (in the form of clues, notes, etc.)
		7:
			# A bag of coins, 1d4×100 or thereabouts. 1 weight per 100.
			return Utilities.roll_dice_for_total(1, 400)
		8:
			# A very valuable small item (gem, art) worth 2d6×100, 0 weight 
			return Utilities.roll_dice_for_total(2, 600)
		9:
			# 	A chest of coins and other small valuables. 1 weight but worth
			# 3d6×100 coins.
			return Utilities.roll_dice_for_total(3, 600)
		10:
			# A magical item or magical effect
		11:
			# Many bags of coins for a total of 2d4×100 or so
			return Utilities.roll_dice_for_total(2, 400)
		12:
			# A sign of office (crown, banner) worth at least 3d4×100 coins 
			return Utilities.roll_dice_for_total(3, 400)
		13:
			# A large art item worth 4d4×100 coins, 1 weight
			return Utilities.roll_dice_for_total(4, 400)
		14:
			# A unique item worth at least 5d4×100 coins
			return Utilities.roll_dice_for_total(5, 400)
		15:
			# All the information needed to learn a new spell and roll again
			roll_again = true
		16:
			# A portal or secret path (or directions to one) and roll again
			roll_again = true
		17:
			# Something relating to one of the characters and roll again
			roll_again = true
		18:
			# A hoard: 1d10×1000 coins and 1d10×10 gems worth 2d6×100 each
			return Utilities.roll_dice_for_total(1, 100) * Utilities.roll_dice_for_total(2, 600)
	if roll_again:
		roll_again = false
		#TODO: finish this. break out treaure rating to new function to clean this up

