extends ColorRect


#func _ready():
#	SaveSystem.save_and_encrypt_config()
#	print("saving the game")

func _on_Play_pressed():
	Scene.change("ClassPicker")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Load_pressed():
	#TODO: Player can load previous game state
	print("Loading previous game save!")
	SaveSystem.load_and_unencrypt_config()
	# Scene.change(CharacterSheet.current_scene)
