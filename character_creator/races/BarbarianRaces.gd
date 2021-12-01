extends ColorRect



func _on_Race1_pressed():
	CharacterSheet.player_race = "elf"
	Scene.change("NamePicker")
