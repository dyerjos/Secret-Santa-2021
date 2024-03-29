extends Node


var scenes := {
	"MainMenu": "res://menu/MainMenu.tscn",
	"ClassPicker": "res://character_creator/class/ClassPicker.tscn",
	"BarbarianRaces": "res://character_creator/races/BarbarianRaces.tscn",
	"BardRaces": "res://character_creator/races/BardRaces.tscn",
	"ClericRaces": "res://character_creator/races/ClericRaces.tscn",
	"DruidRaces": "res://character_creator/races/DruidRaces.tscn",
	"FighterRaces": "res://character_creator/races/FighterRaces.tscn",
	"PaladinRaces": "res://character_creator/races/PaladinRaces.tscn",
	"RangerRaces": "res://character_creator/races/RangerRaces.tscn",
	"ThiefRaces": "res://character_creator/races/ThiefRaces.tscn",
	"WizardRaces": "res://character_creator/races/WizardRaces.tscn",
	"ImmolatorRaces": "res://character_creator/races/ImmolatorRaces.tscn",
	"NamePicker": "res://character_creator/NamePicker.tscn",
	"LookPicker": "res://character_creator/LookPicker.tscn",
	"StatsPicker": "res://character_creator/StatsPicker.tscn",
	"ClassMovesPicker": "res://character_creator/ClassMovesPicker.tscn",
	"SpellPicker": "res://character_creator/SpellPicker.tscn",
	"GearPicker": "res://character_creator/GearPicker.tscn",
	"Gameplay": "res://Gameplay.tscn",
}


func change(scene_name: String):
	if not scenes.has(scene_name):
		assert("cannot change to scene" == scene_name)
		return
# warning-ignore:return_value_discarded
	CharacterSheet.current_scene = scenes[scene_name]
	get_tree().change_scene(scenes[scene_name])
