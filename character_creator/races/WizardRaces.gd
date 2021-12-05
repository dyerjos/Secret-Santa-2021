extends ColorRect





func _on_Race1_pressed():
	CharacterSheet.player_race = "elf"
	Scene.change("NamePicker")


func _on_Race2_pressed():
	CharacterSheet.player_race = "human"
	Scene.change("NamePicker")
