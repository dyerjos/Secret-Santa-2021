extends ColorRect


func _on_SpellBtn1_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Contact Spirits")


func _on_SpellBtn2_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Detect Magic")


func _on_SpellBtn3_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Magic Missile")


func _on_SpellBtn4_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Charm Person")


func _on_SpellBtn5_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Invisibility")


func _on_SpellBtn6_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Telepathy")


func _on_SpellBtn7_pressed():
	if CharacterSheet.player_level_one_spells.count() < 3:
		CharacterSheet.player_level_one_spells.append("Alarm")

