extends Node


signal player_died
signal target_died(target)
signal add_to_adventure_log(text)


func log(text):
	emit_signal("add_to_adventure_log", text)
