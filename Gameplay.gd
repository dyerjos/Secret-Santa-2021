extends ColorRect


func _ready():
	SaveSystem.save_and_encrypt_game()


func _on_TestBtn1_pressed(): #monster enounter
	print("hi")


func _on_TestBtn2_pressed(): # generate monsters
	Enemies.generate_monsters(Locations.A1_S1_cave)


func _on_TestBtn3_pressed(): # recover
	Moves.recover_fn(3)
	

func _on_TestBtn4_pressed(): # generate treasure
	#TODO: how to select a target?
	Items.generate_treasure(Enemies.ankheg)
