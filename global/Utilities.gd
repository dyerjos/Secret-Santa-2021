extends Node

func _ready():
	randomize() #TODO: is this needed?

func roll_dice_for_success(stat=null):
	var random = RandomNumberGenerator.new()
	random.randomize()
	var dice_result = random.randi_range(2, 12)
	var modifier = stat_to_modifier(stat) #returns 0 if stat is null or ""
	var result_after_modifier = dice_result + modifier + CharacterSheet.ongoing_moves_modifier()
	if result_after_modifier >= 10:
		return "success"
	elif result_after_modifier == 7 or result_after_modifier == 8 or result_after_modifier == 9:
		return "partial"
	else:
		return "fail"

func roll_dice_for_total(number_of_dice, sides_of_dice):
	var random = RandomNumberGenerator.new() 
	random.randomize()
	var dice_total = 0
	for i in range(number_of_dice):
		var dice_roll = random.randi_range(1, sides_of_dice)
		dice_total += dice_roll
	return dice_total

func random_number_in_range(lowest, highest):
	var random = RandomNumberGenerator.new()
	random.randomize()
	return random.randi_range(lowest, highest)
		
func stat_to_modifier(stat=null):
	if stat == null:
		return 0
	assert(stat >= 1)
	assert(stat <= 18)
	if stat >= 1 and stat <= 3:
		return -3
	elif stat == 4 or stat == 5:
		return -2
	elif stat >= 6 and stat <=8:
		return -1
	elif stat >= 9 and stat <= 12:
		return 0
	elif stat >= 13 and stat <= 15:
		return 1
	elif stat >= 16 and stat <= 17:
		return 1
	elif stat == 18:
		return 3
	else:
		assert("stat shouldn't be" == stat)

func deal_damage(number, base_damage, target_armor, damage_bonuses=0, weapon_tags=[]):
	var tag_damage_bonus = 0
	var forceful = false
	var stun = false
	var messy = false
	var needs_reloaded = false
	for tag in weapon_tags:
		match tag:
			"forceful":
				forceful = true
			"-1 damage":
				tag_damage_bonus -= 1
			"-2 damage":
				tag_damage_bonus -= 2
			"+1 damage":
				tag_damage_bonus += 1
			"+2 damage":
				tag_damage_bonus += 2
			"+3 damage":
				tag_damage_bonus += 3
			"+4 damage":
				tag_damage_bonus += 4
			"+5 damage":
				tag_damage_bonus += 5
			"+6 damage":
				tag_damage_bonus += 6
			"+7 damage":
				tag_damage_bonus += 7
			"+8 damage":
				tag_damage_bonus += 8
			"ignores armor":
				tag_damage_bonus += target_armor
			"messy":
				messy = true
			"+1 piercing":
				var pierce_damage = target_armor - 1
				if pierce_damage < 0:
					return
				else:
					tag_damage_bonus += pierce_damage
			"+2 piercing":
				var pierce_damage = target_armor - 2
				if pierce_damage < 0:
					return
				else:
					tag_damage_bonus += pierce_damage
			"+3 piercing":
				var pierce_damage = target_armor - 3
				if pierce_damage < 0:
					return
				else:
					tag_damage_bonus += pierce_damage
			"+4 piercing":
				var pierce_damage = target_armor - 4
				if pierce_damage < 0:
					return
				else:
					tag_damage_bonus += pierce_damage
			"reload":
				Signals.log("weapon needs reloaded")
				needs_reloaded = true
			"stun":
				stun = true
	tag_damage_bonus = clamp(tag_damage_bonus, 0, 15)
	assert(tag_damage_bonus < 15)
	var total_damage = roll_dice_for_total(number, base_damage) + damage_bonuses
	var net_damage = total_damage - target_armor + tag_damage_bonus
	if net_damage < 0:
		return {
			"net_damage": 0, "stun": stun, "forceful" : forceful, "messy": messy, "needs_reloaded": needs_reloaded
		}
	else:
		return {
			"net_damage": net_damage, "stun": stun, "forceful" : forceful, "messy": messy, "needs_reloaded": needs_reloaded
		}

func best_dice(number_of_dice, sides_of_dice):
	var roll1 = Utilities.roll_dice_for_total(number_of_dice, sides_of_dice)
	var roll2 = Utilities.roll_dice_for_total(number_of_dice, sides_of_dice)
	if roll1 > roll2:
		return roll1
	else: 
		return roll2	
