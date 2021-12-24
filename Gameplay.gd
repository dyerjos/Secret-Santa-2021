extends ColorRect

onready var location_label = $TabContainer/Location/Column/LocationLabel
onready var inventory_label = $TabContainer/Inventory/Column/InventoryLabel
onready var move_list = $TabContainer/Main/VBoxContainer/MoveRow/MoveList
onready var target_list = $TabContainer/Main/VBoxContainer/MoveRow/TargetList

func _ready():
	if CharacterSheet.debug_mode == false:
		SaveSystem.save_and_encrypt_game()
	else:
		CharacterSheet.current_location = Locations.starter_city
		CharacterSheet.player_in_battle = true
		CharacterSheet.player_in_town = false
	populate_move_list()
	populate_target_list()

func _process(delta):
	location_label.text = JSON.print(CharacterSheet.current_location)
	inventory_label.text = JSON.print(CharacterSheet.player_inventory)
	
func populate_move_list():
	CharacterSheet.available_moves = Moves.get_valid_moves()
	
func populate_target_list():
	pass

func _on_TestBtn1_pressed(): #monster enounter
	print("hi")


func _on_TestBtn2_pressed(): # generate monsters
	Enemies.generate_monsters(Locations.A1_S1_cave)


func _on_TestBtn3_pressed(): # recover
	Moves.recover_fn(3)
	

func _on_TestBtn4_pressed(): # generate treasure
	#TODO: how to select a target?
	Items.generate_treasure(Enemies.ankheg)
