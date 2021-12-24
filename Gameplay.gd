extends ColorRect

onready var location_label = $TabContainer/Location/Column/LocationLabel
onready var inventory_label = $TabContainer/Inventory/Column/InventoryLabel

func _ready():
	if not CharacterSheet.debug_mode:
		SaveSystem.save_and_encrypt_game()
	else:
		CharacterSheet.current_location = Locations.starter_city

func _process(delta):
	location_label.text = JSON.print(CharacterSheet.current_location)
	inventory_label.text = JSON.print(CharacterSheet.player_inventory)

func _on_TestBtn1_pressed(): #monster enounter
	print("hi")


func _on_TestBtn2_pressed(): # generate monsters
	Enemies.generate_monsters(Locations.A1_S1_cave)


func _on_TestBtn3_pressed(): # recover
	Moves.recover_fn(3)
	

func _on_TestBtn4_pressed(): # generate treasure
	#TODO: how to select a target?
	Items.generate_treasure(Enemies.ankheg)
