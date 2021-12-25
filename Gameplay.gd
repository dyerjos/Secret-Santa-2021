extends ColorRect

onready var context_label = $CenterContainer/ContextLabel
onready var location_label = $TabContainer/Location/Column/LocationLabel
onready var inventory_label = $TabContainer/Inventory/Column/InventoryLabel
onready var move_options = $TabContainer/Main/VBoxContainer/MoveCommand/MoveOption
onready var using_label = $TabContainer/Main/VBoxContainer/MoveCommand/Using
onready var weapon_options = $TabContainer/Main/VBoxContainer/MoveCommand/Weapon
onready var against_label = $TabContainer/Main/VBoxContainer/MoveCommand/Against
onready var target_options = $TabContainer/Main/VBoxContainer/MoveCommand/Target

var selected_move = {}
var selected_weapon = {}
var selected_targets = []
var possible_targets = []


func _ready():
	if CharacterSheet.debug_mode == false:
		SaveSystem.save_and_encrypt_game()
	else:
		CharacterSheet.current_location = Locations.starter_city
	update_context("In Battle", true, false) #! only for testing
	populate_move_options() #* moves in player dropdown
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
	weapon_options.clear()
	match selected_move:
		"volley":
			for item in player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and CharacterSheet.selected_weapon.has("range_tags") and CharacterSheet.selected_weapon["range_tags"].has("close") == false and CharacterSheet.selected_weapon["range_tags"].has("hand") == false:
					weapon_options.add_item(item["name"])
		"hack and slash":
			for item in player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and CharacterSheet.selected_weapon.has("range_tags") and (CharacterSheet.selected_weapon["range_tags"].has("close") == true or CharacterSheet.selected_weapon["range_tags"].has("hand") == true):
					weapon_options.add_item(item["name"])

func populate_target_options():
		var enemies = CharacterSheet.battle_targets 
		var friends = CharacterSheet.friendly_targets
		var you = [{"name": "", "friend_foe": "[Self]"}]
		possible_targets = enemies + friends + you
		for target in possible_targets:
			target_options.add_item(target["name"] + " " + target["friend_foe"])

		#* other way:
		# for target in enemies:
		# 	target_options.add_item(target["name"] + " [Enemy]")
		# for target in friends:
		# 	target_options.add_item(target["name"] + " [Ally]")
		# target_options.add_item("[Self]")

	
func update_context(text, battle_bool, town_bool):
	CharacterSheet.player_in_battle = battle_bool
	CharacterSheet.player_in_town = town_bool
	context_label.text = text

#* ---------- Main Tab -------------------------

func _on_SubmitBtn_pressed():
	print("calling move")
	#TODO call move

func _on_MoveOption_item_selected(index):
	selected_move = CharacterSheet.available_moves[index]
	print("selected %s" % selected_move)
	match selected_move["name"]:
		# ----common----
		"hack and slash":
			using_weapon_against_target_setter(true, true, true, true)
		"volley":
			using_weapon_against_target_setter(true, true, true, true)
		"defy danger":
			using_weapon_against_target_setter(false, false, false, false)
		"defend":
			using_weapon_against_target_setter(false, false, true, true)
		"aid or interfere":
			pass #TODO: implement once bonds are setup
		"spout lore":
			using_weapon_against_target_setter(false, false, false, false)
		"discern realities":
			using_weapon_against_target_setter(false, false, false, false)
		"parley":
			using_weapon_against_target_setter(false, false, true, true)
		#----special----
		"last_breath":
			pass
		"encumbrance":
			pass
		"make camp":
			using_weapon_against_target_setter(false, false, false, false)
		"take watch":
			using_weapon_against_target_setter(false, false, false, false)
		"carouse":
			using_weapon_against_target_setter(false, false, false, false)
		"undertake perilous journey":
			using_weapon_against_target_setter(false, false, false, false)
		"supply":
			using_weapon_against_target_setter(false, false, false, false)
		"recover":
			using_weapon_against_target_setter(false, false, false, false)
		"recruit":
			using_weapon_against_target_setter(false, false, false, false)
		"outstanding warrants":
			using_weapon_against_target_setter(false, false, false, false)
		"bolster":
			using_weapon_against_target_setter(false, false, false, false)
		"level up":
			using_weapon_against_target_setter(false, false, false, false)
		"end of session":
			using_weapon_against_target_setter(false, false, false, false)
		#----wizard common----
		"cast spell":
			using_weapon_against_target_setter(false, false, true, true)
		"prepare spells":
			using_weapon_against_target_setter(false, false, false, false)
		"add to spellbook":
			using_weapon_against_target_setter(false, false, false, false)
		"spell defense":
			using_weapon_against_target_setter(false, false, false, false)
		"ritual":
			using_weapon_against_target_setter(false, false, false, false)
	popluate_weapon_options()

func using_weapon_against_target_setter(using, weapon, against, target):
	using_label.visible = using
	weapon_options.visible = weapon
	against_label.visible = against
	target_options.visible = target
	
func _on_Weapon_item_selected(index):
	selected_weapon = CharacterSheet.player_inventory[index]
	print("selected %s" % selected_move)

func _on_Target_item_selected(index):
	selected_targets = possible_targets[index]

#* ---------- Player Tab -------------------------

#* ---------- Location Tab -------------------------

#* ---------- Test Tab -------------------------

func _on_TestBtn1_pressed(): #monster enounter
	print("hi")


func _on_TestBtn2_pressed(): # generate monsters
	Enemies.generate_monsters(Locations.A1_S1_cave)


func _on_TestBtn3_pressed(): # recover
	Moves.recover_fn(3)
	

func _on_TestBtn4_pressed(): # generate treasure
	#TODO: how to select a target?
	Items.generate_treasure(Enemies.ankheg)
