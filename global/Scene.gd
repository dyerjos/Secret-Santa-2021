extends Node


var scenes := {
	"MainMenu": "res://menu/MainMenu.tscn",
	"CharacterCreation": "res://character_creator/CharacterCreation.tscn",
}


func change(scene_name: String):
	if not scenes.has(scene_name):
		print("cannot change to scene %s" % scene_name)
		return

	get_tree().change_scene(scenes[scene_name])
