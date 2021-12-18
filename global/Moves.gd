extends Node


#* Common Moves
var common_moves = [
	hack_and_slash,
]
# note: If a move just says “deal damage” the character rolls their class’s damage dice plus any bonuses or penalties from moves, weapons, or effects. If a move specifies an amount of damage, use that in place of the class’s damage roll
func hack_and_slash(targets):
	print("calling move!")
	var roll_result = Utilities.roll_dice_for_success(CharacterSheet.player_str)
	match roll_result:
		"critical":
			print("deal  damage to target(s)")
			
			print("optional: deal extra 1d6 damage to target but expose yourself to enemy attack")
		"partial":
			print("deal 1d6 damage to target and enemy makes attack against you")
		"fail":
			print("mark xp")
			print("GM says what happens (you miss and enemy makes an attack against you?)")
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
