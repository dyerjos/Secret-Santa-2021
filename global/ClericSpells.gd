extends Node



func  cure_light_wounds_fn(target):
	print("now healing")
	#TODO: must touch to heal
	var heal_amount = Utilities.roll_dice_for_total(1, 8)
	print("heal amount %s" % heal_amount)
	if target["hp"]:
		print("healing an npc or monster")
		target["hp"] = clamp((target["hp"] + heal_amount), 0, target["max_hp"])
	else:
		print("healing a player")
		assert(target["instinct"] == null) # make sure not a player
		CharacterSheet.player_hitpoints = clamp((CharacterSheet.player_hitpoints + heal_amount), 0, CharacterSheet.max_hitpoints())
var  cure_light_wounds = {
	"name" : "cure light wounds",
	"level" : 1,
	"description" : "At your touch wounds scab and bones cease to ache. Heal an ally you touch of 1d8 damage.",
	"school" : "",
	"ongoing" : false,
	"execute" : funcref(self, " cure_light_wounds_fn")
}
