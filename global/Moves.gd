extends Node


#* Common Moves
var common_moves = [
	hack_and_slash,
]

#NOTE: deal_damage(number, base_damage, target_armor, damage_bonuses, attack_tag)
func hack_and_slash(targets, reckless=false, player_weapon_used=null):
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
				var damage = Utilities.deal_damage(1, Utilities.stat_to_modifier(stat_for_attack), target["armor"], CharacterSheet.damage_bonuses(), player_weapon_used["weapon_tags"])
				process_damage_to_npc(damage, target, player_weapon_used)
				if reckless:
					print("reckless")
					var reckless_damage = Utilities.deal_damage(1, 6, target["armor"], CharacterSheet.damage_bonuses(),  player_weapon_used["weapon_tags"])
					process_damage_to_npc(reckless_damage, target, player_weapon_used)
			if reckless:
				# damage to player
				damage_to_player(targets)
		"partial":
			# damage to enemies:
			for target in targets:
				var damage_results = Utilities.deal_damage(1, CharacterSheet.class_base_damage, target.armor, target.damage_bonuses(), player_weapon_used["weapon_tags"])
				process_damage_to_npc(damage_results, target, player_weapon_used)
			# damage to player
			damage_to_player(targets)
		"fail":
			CharacterSheet.player_exp += 1
			print("GM says what happens (you miss and enemy makes an attack against you?)")
			#TODO: add something extra here?
			damage_to_player(targets)
			
var hack_and_slash = {
	"name" : "hack and slash",
	"type" : "basic",
	"description" : "When you attack an enemy in melee, roll+STR. On a 10+ you deal your damage to the enemy and avoid their attack. At your option, you may choose to do +1d6 damage but expose yourself to the enemy’s attack. On a 7–9, you deal your damage to the enemy and the enemy makes an attack against you.",
	"execute" : funcref(self, "hack_and_slash")
}



#* Special Moves






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

func process_damage_to_player(damage, character_sheet) -> void:
	if damage["stun"] == true:
		CharacterSheet.player_stunpoints -= damage["net_damage"]
	else:
		 CharacterSheet.player_hitpoints -= damage["net_damage"]
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
	process_damage_to_player(best_damage_dict, CharacterSheet)
