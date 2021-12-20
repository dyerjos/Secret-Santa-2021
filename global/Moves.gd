extends Node


var common_moves = [
	hack_and_slash,
	volley,
	defy_danger,
	defend,
	# aid_or_interfere, #TODO: implement once bonds are setup
	spout_lore,
	discern_realities,
	parley,
]

var special_moves = [
	last_breath,
	encumbrance,
	make_camp,
	take_watch,
	# carouse, #TODO: implement later
	# undertake_perilous_journey, #TODO: implement later
	supply,
	recover,
	# recruit, #TODO: implement later
	# outstanding_warrants, #TODO: implement later
	# bolster, #TODO: implement later
	level_up,
	# end_of_session, #TODO: implement later
]

var wizard_common_moves = [
	cast_spell,
	prepare_spells,
	add_to_spellbook,
	spell_defense,
	# ritual, #TODO: implement later
]

#* ------COMMON MOVES------------------------------------------------

#NOTE: deal_damage(number, base_damage, target_armor, damage_bonuses, attack_tag)
func hack_and_slash_fn(targets, reckless=false, player_weapon_used=null):
	#TODO: test- what happens when player_weapon_used is null?
	print("calling move!")
	var stat_for_attack = ""
	if "precise" in player_weapon_used["weapon_tags"]:
		stat_for_attack = CharacterSheet.player_dex
	else:
		stat_for_attack = CharacterSheet.player_str
	var roll_result = Utilities.roll_dice_for_success(stat_for_attack)
	match roll_result:
		"critical":
			for target in targets:
				print("target: %s" % target)
				damage_to_npc(2, 6, target, stat_for_attack, player_weapon_used)
				if reckless:
					print("reckless also")
					damage_to_npc(1, 6, target, stat_for_attack, player_weapon_used)
			if reckless:
				damage_to_player(targets)
		"partial":
			for target in targets:
				damage_to_npc(2, 6, target, stat_for_attack, player_weapon_used)
			damage_to_player(targets)
		"fail":
			CharacterSheet.player_exp += 1
			print("GM says what happens")
			#TODO: add something extra here?
			damage_to_player(targets)
var hack_and_slash = {
	"name" : "hack and slash",
	"type" : "basic",
	"description" : "When you attack an enemy in melee",
	"execute" : funcref(self, "hack_and_slash_fn")
}

#TODO: have player choose what will happen if their volley does partially fail (opt=1, opt=2, opt=3)
func volley_fn(target, player_weapon_used, fail_opt):
	print("volley")
	var stat_for_attack = CharacterSheet.player_dex
	var roll_result = Utilities.roll_dice_for_success(stat_for_attack)
	match roll_result:
		"critical":
			print("target: %s" % target)
			damage_to_npc(2, 6, target, stat_for_attack, player_weapon_used)
		"partial":
			match fail_opt:
				1:
					CharacterSheet.player_in_danger = true
					damage_to_npc(2, 6, target, stat_for_attack, player_weapon_used)
				2:
					damage_to_npc(1, 6, target, stat_for_attack, player_weapon_used)
				3:
					player_weapon_used["ammo_count"] -= 1
					#TODO: add "ammo_count" to weapons that need ammo
					#TODO: test - make sure ammo count goes down
					damage_to_npc(2, 6, target, stat_for_attack, player_weapon_used)
		"fail":
			CharacterSheet.player_exp += 1
			print("GM says what happens")
			#TODO: add something extra here? player in danager OR lose ammo?
			print("danger increases or player now in danger")
			CharacterSheet.player_in_danger = true
			#TODO: or "bad footing" meaning player loses a turn
			player_weapon_used["ammo_count"] -= 1
var volley = {
	"name" : "volley",
	"type" : "basic",
	"description" : "When you take aim and shoot at an enemy at range",
	"execute" : funcref(self, "volley_fn")
}

func defy_danger_fn(stat_choice):
	#TODO: only certain stats should be allowed based on the situation (can't use charisma to dodge a falling rock)
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			CharacterSheet.player_in_danger = false
		"partial":
			print("you stumble, hestitate, or flinch. worse outcome, hard bargain, or ugly choice")
			print("still in danger or are in greater danger")
			#TODO: implement levels of danger (low, medium, severe?)
		"fail":
			print("imminent threat happens to you now at the current danger level")
			#TODO: maybe defy_danger_fn() returns a true or false to indicate that code should proceed to execute the threat
var defy_danger = {
	"name" : "defy danger",
	"type" : "basic",
	"description" : "When you act despite an imminent threat or suffer a calamity, say how you deal with it",
	"execute" : funcref(self, "defy_danger_fn")
}

func defend_fn():
	#TODO: implement defense mechanics (when npc or player being attacked, defense can be triggered and hold can be spent) (spend_hold() method? or call this stand_in_defense())
	#TODO: add "is_defended" field to npc's, player, items, and locations
	#TODO: add global script for locations
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_con)
	match roll_result:
		"critical":
			CharacterSheet.player_hold = 3
		"partial":
			CharacterSheet.player_hold = 1
		"fail":
			CharacterSheet.player_hold = 0
var defend = {
	"name" : "defend",
	"type" : "basic",
	"description" : "When you stand in defense of a person, item, or location under attack",
	"execute" : funcref(self, "defend_fn")
}

#TODO: only implement this when bonds are implemented
func aid_or_interfere_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var aid_or_interfere = {
	"name" : "aid or interfere",
	"type" : "basic",
	"description" : "When you help or hinder someone you have a bond with",
	"execute" : funcref(self, "aid_or_interfere_fn")
}

func spout_lore_fn(object):
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_int)
	match roll_result:
		"critical":
			print("tell player something interesting and useful about the subject relevant to your situation")
			#TODO: maybe add a field like "useful_info" and "interesting_info" to monsters, objects, and locations
			print("reveal object['useful_info']") # how fact is immediately useful
		"partial":
			print("reveal object['interesting_info']") # fact but not how it's useful
		"fail":
			print("you don't know anything about this object")
			print("reveal an unwelcome truth (goblin moved around behind you) / instead of having an advantage to situation you are at a disadvantage")
var spout_lore = {
	"name" : "spout lore",
	"type" : "basic",
	"description" : "When you consult your accumulated knowledge about something",
	"execute" : funcref(self, "spout_lore_fn")
}

func discern_realities_fn():
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_wis)
	match roll_result:
		"critical":
			print("ask 3 questions and take +1 forward when acting on the answers")
			#TODO: implement questions as fields in location or target
			#TODO: player asks a question "question1 - question6" or questions are randomly chosen
			#TODO: sometimes question reveals nothing
		"partial":
			print("ask 1 questions and take +1 forward when acting on the answers")
		"fail":
			pass
var discern_realities = {
	"name" : "discern realities",
	"type" : "basic",
	"description" : "When you closely study a situation or person",
	"execute" : funcref(self, "discern_realities_fn")
}

func parley_fn(target):
	#TODO: must have leverage to use this (maybe setup a leveraged field on npc's?)
	#NOTE: you don't have to actually keep your promise (maybe have an honor or reputation field for player :D )
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_cha)
	match roll_result:
		"critical":
			print("they do what you ask if you first promise what they ask of you")
		"partial":
			print("they will do what you ask but need some concrete assurance of your promise right now")
		"fail":
			print("they don't do what you ask them")
var parley = {
	"name" : "parley",
	"type" : "basic",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "parley_fn")
}

#* ------SPECIAL MOVES------------------------------------------------

func last_breath_fn():
	var roll_result = Utilities.roll_dice_for_success()
	match roll_result:
		"critical":
			print("you cheated death and are now stabilized")
			#TODO: add cheated_death boolean on player charactersheet
			CharacterSheet.player_hitpoints = 0.5 #TODO: and setup code so that player can't move if hp is less than 1?
		"partial":
			print("death offers a bargain or refuse and die")
			#TODO: add deal_with_death boolean on player charactersheet
			CharacterSheet.player_hitpoints = 0.5
		"fail":
			print("player dies. Normally you would create a new character")
			#TODO: being a solo game, maybe npc can ressurect the player 1 time, it costs money, or offer to load game at a checkpoint, OR death comes slowly
			#TODO: add marked_for_death boolean on player charactersheet so that player dies in dramatic way after final boss
var last_breath = {
	"name" : "last breath",
	"type" : "special",
	"description" : "When you are dying you catch a glimpse of what lies beyond the Black Gates of Death's Kingdom",
	"execute" : funcref(self, "last_breath_fn")
	}

func encumbrance_fn():
	var max_load = CharacterSheet.max_load()
	var _load = CharacterSheet.current_load()
	var overloaded = _load + 2
	if _load <= max_load:
		CharacterSheet.ongoing_encumberance_moves_modifier = 0
		CharacterSheet.inventory_locked = false
	elif _load <= overloaded:
		print("player takes -1 ongoing until burden is lightened")
		CharacterSheet.ongoing_encumberance_moves_modifier = -1
		CharacterSheet.inventory_locked = true
	else:
		print("drop at least 1 weight and roll at -1 or automatically fall")
		#TODO: drop weight and penalty or don't let player add item to inventory in this case...
		CharacterSheet.ongoing_encumberance_moves_modifier = -2
		CharacterSheet.inventory_locked = true
var encumbrance = {
	"name" : "encumbrance",
	"type" : "special",
	"description" : "When you make a move while carrying weight",
	"execute" : funcref(self, "encumbrance_fn")
	}
	
func make_camp_fn(location):
	if location["is_dangerous"]: #TODO: add "is_dangerous" field to locations
		var safe = is_camp_safe()
		if not safe:
			take_watch_fn(location)
			CharacterSheet.failed_camp = true
			return # attempt to rest fails and battle has started
	CharacterSheet.failed_camp = false
	if location["includes_food"] != true:
		consume_rations()
	level_up_fn()
	recover_fn()
var make_camp = {
	"name" : "make camp",
	"type" : "special",
	"description" : "When you settle in to rest consume a ration. If you are somewhere dangerous decide the watch order as well.",
	"execute" : funcref(self, "make_camp_fn")
	}

func take_watch_fn(location):
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_wis)
	match roll_result:
		"critical":
			print("you’re able to wake the camp and prepare a response, everyone in the camp takes +1 forward")
			setup_random_monster_encounter(location, 1, true)
		"partial":
			print("no time to prepare and now battle")
			setup_random_monster_encounter(location, 0 , true )
		"fail":
			print("battle and monster gets first attack")
			setup_random_monster_encounter(location, 0, false)
var take_watch = {
	"name" : "take watch",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "take_watch_fn")
	}

# TODO: FUTURE
# func carouse_fn():
# 	var roll_result = Utilities.roll_dice_for_success(stat_choice)
# 	match roll_result:
# 		"critical":
# 			pass
# 		"partial":
# 			pass
# 		"fail":
# 			pass
# var carouse = {
# 	"name" : "carouse",
# 	"type" : "special",
# 	"description" : "When you you have leverage on a GM character and manipulate them",
# 	"execute" : funcref(self, "carouse_fn")

func undertake_perilous_journey_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var undertake_perilous_journey = {
	"name" : "undertake perilous journey",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "undertake_perilous_journey_fn")
	}

func supply_fn():
	var rations = CharacterSheet.player_inventory["dungeon_rations"]
	rations.uses = 5

	#TODO: FUTURE
	# var roll_result = Utilities.roll_dice_for_success(stat_choice)
	# match roll_result:
	# 	"critical":
	# 		pass
	# 	"partial":
	# 		pass
	# 	"fail":
	# 		pass
var supply = {
	"name" : "supply",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "supply_fn")
	}

func recover_fn(days=0):
	if days >= 3:
		#TODO: cure a debility of choice instead of all
		CharacterSheet.player_debilities.clear()
		CharacterSheet.player_hitpoints = CharacterSheet.max_hitpoints()
	elif days >= 1:
		CharacterSheet.player_hitpoints = CharacterSheet.max_hitpoints()
	else:
		var half_health = CharacterSheet.max_hitpoints() / 2
		CharacterSheet.player_hitpoints = clamp((CharacterSheet.player_hitpoints + half_health), 0, CharacterSheet.max_hitpoints())
var recover = {
	"name" : "recover",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "recover_fn")
	}

func recruit_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var recruit = {
	"name" : "recruit",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "recruit_fn")
	}
	
func outstanding_warrants_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var outstanding_warrants = {
	"name" : "outstanding warrants",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "outstanding_warrants_fn")
	}

func bolster_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var bolster = {
	"name" : "bolster",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "bolster_fn")
	}

func level_up_fn():
	var exp_for_next_level = CharacterSheet.player_level + 7
	if CharacterSheet.player_exp >= exp_for_next_level:
		CharacterSheet.player_exp -= exp_for_next_level
		CharacterSheet.player_level += 1
		if CharacterSheet.player_class == "wizard":
			print("add a new spell to your spellbook")
			#TODO: add spell on level up
		print("choose a stat and increase it by 1")
		#TODO: stat increase screen needed (could be as simple as a button for each stat and you click one)
		#TODO: if player_con increases, make sure to increase current hp by the increase in hp
var level_up = {
	"name" : "level up",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "level_up_fn")
	}

func end_of_session_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var end_of_session = {
	"name" : "end of session",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "end_of_session_fn")
	}

#* Wizard basic moves

func cast_spell_fn(spell):
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_int)
	match roll_result:
		"critical":
			spell["execute"].call_func()
		"partial":
			Moves.hack_and_slash["execute"].call_func()
			#TODO: player chooses to draw unwelcome attention, take -1 ongoing to spells, or for spell to be forgotten
			CharacterSheet.ongoing_spell_modifier = -1
		"fail":
			CharacterSheet.ongoing_spell_modifier = -1
var cast_spell = {
	"name" : "cast spell",
	"type" : "wizard_common",
	"description" : "Release a spell you have prepared",
	"execute" : funcref(self, "cast_spell_fn")
	}

func prepare_spells_fn():
	print("ongoing spell modifier back to 0")
	CharacterSheet.ongoing_spell_modifier = 0
	# CharacterSheet.prepared_spells.clear() #! don't clear spells if there is no time to make spell picker scene
	print("prepares spells in your spellbook")
	#TODO: need UI for choosing spells again
var prepare_spells = {
	"name" : "prepare spells",
	"type" : "special",
	"description" : "Release a spell you have prepared",
	"execute" : funcref(self, "prepare_spells_fn")
	}


func add_to_spellbook_fn():
	print("add one additional spell to your spellbook")
var add_to_spellbook = {
	"name" : "cast spell",
	"type" : "special",
	"description" : "Release a spell you have prepared",
	"execute" : funcref(self, "add_to_spellbook_fn")
	}

func spell_defense_fn():
	if CharacterSheet.ongoing_spell:
		var level = CharacterSheet.ongoing_spell["level"]
		CharacterSheet.ongoing_spell = {}
		return level
	else:
		return 0
var spell_defense = {
	"name" : "cast spell",
	"type" : "special",
	"description" : "Release a spell you have prepared",
	"execute" : funcref(self, "spell_defense_fn")
	}


func ritual_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var ritual = {
	"name" : "cast spell",
	"type" : "special",
	"description" : "Release a spell you have prepared",
	"execute" : funcref(self, "ritual_fn")
	}



#* Wizard intermediate moves
#TODO: FUTURE
#* Wizard advanced moves
#TODO: FUTURE

func process_damage_to_npc(damage, target, player_weapon_used) -> void: 
#	damage = "net_damage": 0, "stun": stun, "forceful" : forceful, "messy": messy, "needs_reloaded": needs_reloaded
	if damage["stun"] == true:
		target["stun_points"] -= damage["net_damage"]
	else:
		 target["hp"] -= damage["net_damage"]
	if damage["messy"] == true:
		print("do damage to building, area, or person (missing arm?)") 
		#TODO: damage is done to person, item, or location (make global location script with fields like hp, description)
	if damage["forceful"] == true:
		print("chance to knock down or knock target back")
	if damage["needs_reloaded"] == true:
		player_weapon_used["needs_reloaded"] = true

func process_damage_to_player(damage) -> void:
	if damage["stun"] == true:
		CharacterSheet.player_stunpoints -= damage["net_damage"]
		#TODO: does this stun player?
	else:
		damage["net_damage"] -= spell_defense_fn() #TODO: this should be a player's choice and not automatic
		CharacterSheet.player_hitpoints -= damage["net_damage"]
		#TODO: notify player whenever they take damage?
	if damage["messy"] == true:
		print("do damage to building, area, or person (missing arm?)") 
		#TODO: damage is done to person, item, or location (make global location script with fields like hp, description)
	if damage["forceful"] == true:
		print("chance to knock down or knock target back")
#	if damage["needs_reloaded"] == true:
#		player_weapon_used["needs_reloaded"] = true

func damage_to_player(targets):
	var best_damage = 0
	var best_damage_dict = {}
	for target in targets:
		var damage = Utilities.deal_damage(target["attack_number"], target["attack_base_damage"], CharacterSheet.total_armor(), target["attack_modifier"], target["attack_tag"])
		if damage["net_damage"] > best_damage:
			best_damage = damage["net_damage"]
			best_damage_dict = damage
	process_damage_to_player(best_damage_dict)

func damage_to_npc(number, base_damage, target, stat_for_attack, player_weapon_used):
	var damage = Utilities.deal_damage(number, base_damage, target["armor"], CharacterSheet.damage_bonuses(Utilities.stat_to_modifier(stat_for_attack)), player_weapon_used["weapon_tags"])
	process_damage_to_npc(damage, target, player_weapon_used)

func consume_rations(distance=null, trailblazer_bonus=0):
	var rations = CharacterSheet.player_inventory["dungeon_rations"]
	if rations["uses"] == 0 or rations == null:
		CharacterSheet.ongoing_rations_moves_modifier = -1
		print("tell player they are hungry and they need to go to nearest town")
		return
	if distance == null:
		rations.uses -= 1
	else:
		rations.uses -= distance - trailblazer_bonus

func is_camp_safe():
	if CharacterSheet.failed_camp == true:
		CharacterSheet.failed_camp = false
		return true
	var result = Utilities.roll_dice_for_success(CharacterSheet.player_str)
	match result:
		"success":
			print("no monsters")
			return true
		"partial":
			print("no monsters")
			return true
		"fail":
			return false

func setup_random_monster_encounter(location, watch_bonus, players_attack_first):
	CharacterSheet.ongoing_watch_bonus = watch_bonus
	print("generating monsters from location")
	generate_monsters(location)
	print("player now in battle")
	CharacterSheet.player_in_battle = true
	#TODO: UI changes for battle
	print("trigger UI changes for battle here")

func generate_monsters(location):
	#TODO: location needs "monster_setting" field
	var potential_enemeies = Enemies.location["monster_setting"].duplicate(true).shuffle()
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
