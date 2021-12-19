extends Node


var common_moves = [
	hack_and_slash,
	volley,
	defy_danger,
	defend,
	aid_or_interfere,
	spout_lore,
	discern_realities,
	parley,
]

var special_moves = [
	last_breath,
	encumbrance,
	make_camp,
	take_watch,
	carouse,
	undertake_perilous_journey,
	supply,
	recover,
	recruit,
	outstanding_warrants,
	bolster,
	level_up,
	end_of_session,
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
	stat_for_attack = CharacterSheet.player_dex
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
			CharacterSheet.player_in_danger = true
			player_weapon_used["ammo_count"] -= 1
var volley = {
	"name" : "volley",
	"type" : "basic",
	"description" : "When you take aim and shoot at an enemy at range",
	"execute" : funcref(self, "volley_fn")
}

func defy_danger_fn(stat_choice):
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass


var defy_danger = {
	"name" : "defy danger",
	"type" : "basic",
	"description" : "When you act despite an imminent threat or suffer a calamity, say how you deal with it",
	"execute" : funcref(self, "defy_danger_fn")
}

func defend_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var defend = {
	"name" : "defend",
	"type" : "basic",
	"description" : "When you stand in defense of a person, item, or location under attack",
	"execute" : funcref(self, "defend_fn")
}

func aid_or_interfere_fn():
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

func spout_lore_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var spout_lore = {
	"name" : "spout lore",
	"type" : "basic",
	"description" : "When you consult your accumulated knowledge about something",
	"execute" : funcref(self, "spout_lore_fn")
}

func discern_realities_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var discern_realities = {
	"name" : "discern realities",
	"type" : "basic",
	"description" : "When you closely study a situation or person",
	"execute" : funcref(self, "discern_realities_fn")
}

func parley_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var parley = {
	"name" : "parley",
	"type" : "basic",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "parley_fn")
}

#* ------SPECIAL MOVES------------------------------------------------

func last_breath_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var last_breath = {
	"name" : "last breath",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "last_breath_fn")

func encumbrance_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var encumbrance = {
	"name" : "encumbrance",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "encumbrance_fn")

func make_camp_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var make_camp = {
	"name" : "make camp",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "make_camp_fn")

func take_watch_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var take_watch = {
	"name" : "take watch",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "take_watch_fn")

func carouse_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var carouse = {
	"name" : "carouse",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "carouse_fn")

func undertake_perilous_journey_fn():
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

func supply_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var supply = {
	"name" : "supply",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "supply_fn")

func recover_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var recover = {
	"name" : "recover",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "recover_fn")

func recruit_fn():
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

func outstanding_warrants_fn():
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

func bolster_fn():
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

func level_up_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			pass
var level_up = {
	"name" : "level up",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "level_up_fn")

func end_of_session_fn():
	var roll_result = Utilities.roll_dice_for_success(stat_choice)
	match roll_result:
		"critical":
			pass
		"partial":
			pass
		"fail":
			passÍ
var end_of_session = {
	"name" : "end of session",
	"type" : "special",
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "end_of_session_fn")

#* Wizard basic moves

#* Wizard intermediate moves

#* Wizard advanced moves

func process_damage_to_npc(damage, target, player_weapon_used) -> void: 
#	damage = "net_damage": 0, "stun": stun, "forceful" : forceful, "messy": messy, "needs_reloaded": needs_reloaded
	if damage["stun"] == true:
		target["stun_points"] -= damage["net_damage"]
	else:
		 target["hp"] -= damage["net_damage"]
	if damage["messy"] == true:
		print("do damage to building, area, or person (missing arm?)") #TODO: messy
	if damage["forceful"] == true:
		print("chance to knock down or knock target back")
	if damage["needs_reloaded"] == true:
		player_weapon_used["needs_reloaded"] = true

func process_damage_to_player(damage) -> void:
	if damage["stun"] == true:
		CharacterSheet.player_stunpoints -= damage["net_damage"]
		#TODO: does this stun player?
	else:
		 CharacterSheet.player_hitpoints -= damage["net_damage"]
		#TODO: notify player whenever they take damage?
	if damage["messy"] == true:
		print("do damage to building, area, or person (missing arm?)") #TODO: messy
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