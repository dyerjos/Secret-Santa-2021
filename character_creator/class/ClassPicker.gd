extends ColorRect



func _on_BarbarianBtn_pressed():
	CharacterSheet.player_class = "barbarian"
	Scene.change("BarbarianRaces")

func _on_BardBtn_pressed():
	CharacterSheet.player_class = "bard"
	Scene.change("BardRaces")

func _on_ClericBtn_pressed():
	CharacterSheet.player_class = "cleric"
	Scene.change("ClericRaces")

func _on_DruidBtn_pressed():
	CharacterSheet.player_class = "druid"
	Scene.change("DruidRaces")

func _on_FighterBtn_pressed():
	CharacterSheet.player_class = "fighter"
	Scene.change("FighterRaces")

func _on_ImmolatorBtn_pressed():
	CharacterSheet.player_class = "immolator"
	Scene.change("ImmolatorRaces")

func _on_PaladinBtn_pressed():
	CharacterSheet.player_class = "paladin"
	Scene.change("PaladinRaces")

func _on_RangerBtn_pressed():
	CharacterSheet.player_class = "ranger"
	Scene.change("RangerRaces")

func _on_ThiefBtn_pressed():
	CharacterSheet.player_class = "thief"
	Scene.change("ThiefRaces")

func _on_WizardBtn_pressed():
	CharacterSheet.player_class = "wizard"
	Scene.change("WizardRaces")
