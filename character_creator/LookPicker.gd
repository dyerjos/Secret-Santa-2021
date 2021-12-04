extends ColorRect

onready var BodyField := $TabContainer/Class/VBoxContainer/CenterContainer/BodyField
onready var EyesField := $TabContainer/Class/VBoxContainer/CenterContainer4/EyesField
onready var DecorationField := $TabContainer/Class/VBoxContainer/CenterContainer5/DecorationField
onready var ClothesField := $TabContainer/Class/VBoxContainer/CenterContainer6/ClothesField


func _on_BodyField_text_changed(new_text):
	CharacterSheet.player_body = new_text


func _on_EyesField_text_changed(new_text):
	CharacterSheet.player_eyes = new_text


func _on_DecorationField_text_changed(new_text):
	CharacterSheet.player_decoration = new_text


func _on_ClothesField_text_changed(new_text):
	CharacterSheet.player_clothes = new_text


func _on_DoneBtn_pressed():
	Scene.change("StatsPicker")


func _on_ResetBtn_pressed():
	BodyField.text = ""
	EyesField.text = ""
	DecorationField.text = ""
	ClothesField.text = ""
