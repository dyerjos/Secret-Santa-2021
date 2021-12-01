extends ColorRect

onready var NameLabel := $TabContainer/Class/VBoxContainer/CenterContainer2/NameLabel
onready var NameField := $TabContainer/Class/VBoxContainer/CenterContainer/NameField

func _on_NameField_text_changed(new_text):
	CharacterSheet.player_name = new_text
	NameLabel.text = ("Is your name %s?" % new_text)

func _on_YesBtn_pressed():
	Scene.change("LookPicker")


func _on_ResetBtn_pressed():
	NameLabel.text = ""
	NameField.text = ""


