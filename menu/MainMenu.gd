extends ColorRect


func _on_Play_pressed():
	Scene.change("CharacterCreation")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Load_pressed():
	#TODO: Player can load previous game state
	print("Loading previous game save!")
