extends ColorRect


# func _ready():
	# SaveSystem.save_and_encrypt_config()

func _on_Play_pressed():
	Scene.change("ClassPicker")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Load_pressed():
	# SaveSystem.load_and_unencrypt_config()
	SaveSystem.load_and_unencrypt_game()
	get_tree().change_scene(CharacterSheet.current_scene)
