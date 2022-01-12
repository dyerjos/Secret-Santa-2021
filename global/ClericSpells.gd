extends Node



func cure_light_wounds_fn(target):
	#TODO: must touch to heal
	Signals.log("cure light wounds spell has been cast")
	var base_heal_amount = Utilities.roll_dice_for_total(1, 8)
	if target.has("hp"):
		var new_hp = clamp((target["hp"] + base_heal_amount), 0, target["max_hp"])
		target["hp"] = new_hp
		Signals.log("health is now %s" % new_hp)
	else:
		var new_hp = clamp((CharacterSheet.hp + base_heal_amount), 0, CharacterSheet.max_hitpoints())
		CharacterSheet.hp = new_hp
		Signals.log("Your health is now %s" % new_hp)
var cure_light_wounds = {
	"name" : "cure light wounds",
	"level" : 1,
	"description" : "At your touch wounds scab and bones cease to ache. Heal an ally you touch of 1d8 damage.",
	"school" : "",
	"ongoing" : false,
	"execute" : funcref(self, "cure_light_wounds_fn"),
	"method" : "cure_light_wounds_fn",
	"script" : "ClericSpells"
}

#* ----- Disable or Enable ------------:
#TODO: organize cleric spells by spell level like WizardSpells.gd
#* ------------------end of Disable/Enable ---------------------:

