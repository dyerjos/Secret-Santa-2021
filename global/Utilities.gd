extends Node

func _ready():
	randomize()

func roll_dice_for_success(stat=null):
	var random = RandomNumberGenerator.new()
	random.randomize()
	var dice_result = random.randi_range(2, 12)
	var modifier = stat_to_modifier(stat)
	var result_after_modifier = dice_result + modifier
	print("result after modifier: %s" % result_after_modifier)
	if result_after_modifier >= 10:
		return "success"
	elif result_after_modifier >= 7 or result_after_modifier <= 9:
		return "partial"
	else:
		return "fail"

func roll_dice_for_total(number_of_dice, sides_of_dice):
	var random = RandomNumberGenerator.new()
	random.randomize()
	var dice_total = 0
	for i in range(number_of_dice):
		dice_total += random.randi_range(number_of_dice, sides_of_dice)
		print("dice rolled: %s" % dice_total)
	print("dice total: %s" % dice_total)
	return dice_total

func stat_to_modifier(stat):
	if stat == null or stat == "":
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
		print("stat shouldn't be %s" % stat)
