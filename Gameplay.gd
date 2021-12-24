extends ColorRect

onready var context_label = $CenterContainer/ContextLabel
onready var location_label = $TabContainer/Location/Column/LocationLabel
onready var inventory_label = $TabContainer/Inventory/Column/InventoryLabel
onready var move_options = $TabContainer/Main/MoveCommand/MoveOption
onready var using_label = $TabContainer/Main/MoveCommand/Using
onready var weapon_options = $TabContainer/Main/MoveCommand/Weapon
onready var against_label = $TabContainer/Main/MoveCommand/Against
onready var target_options = $TabContainer/Main/MoveCommand/Target


func _ready():
	if CharacterSheet.debug_mode == false:
		SaveSystem.save_and_encrypt_game()
	else:
		CharacterSheet.current_location = Locations.starter_city
	update_context("In Battle", true, false) #! only for testing
	populate_move_options() #* moves in player dropdown
	popluate_weapon_options()
	Enemies.generate_monsters(Locations.A1_S1_cave)
	populate_target_options()


func _process(delta):
	location_label.text = JSON.print(CharacterSheet.current_location)
	inventory_label.text = JSON.print(CharacterSheet.player_inventory)

	
func populate_move_options():
	var available_moves = Moves.get_valid_moves()
	CharacterSheet.available_moves = available_moves
	for move in available_moves:
		move_options.add_item(move["name"])

func popluate_weapon_options():
	var player_inventory = CharacterSheet.player_inventory
	print("player_inventory size: %s" % player_inventory.size())
	for item in player_inventory:
		if item.has("is_weapon") and item["is_weapon"] == true:
			weapon_options.add_item(item["name"])

#TODO: if CharacterSheet.active_weapon.has("range_tags") and CharacterSheet.active_weapon["range_tags"].has("close") == true:
	
func populate_target_options():
	var targets = CharacterSheet.battle_targets + CharacterSheet.friendly_targets + ["self"] 
	
func update_context(text, battle_bool, town_bool):
	CharacterSheet.player_in_battle = battle_bool
	CharacterSheet.player_in_town = town_bool
	context_label.text = text

func _on_TestBtn1_pressed(): #monster enounter
	print("hi")


func _on_TestBtn2_pressed(): # generate monsters
	Enemies.generate_monsters(Locations.A1_S1_cave)


func _on_TestBtn3_pressed(): # recover
	Moves.recover_fn(3)
	

func _on_TestBtn4_pressed(): # generate treasure
	#TODO: how to select a target?
	Items.generate_treasure(Enemies.ankheg)


func _on_SubmitBtn_pressed():
	print("calling move")
	#TODO call move
