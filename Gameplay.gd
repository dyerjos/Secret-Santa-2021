extends ColorRect


#* UI references:
#* ----- main tab var ---------
onready var context_label = $HeaderRow/CenterContainer/ContextLabel
onready var aside_one = $HeaderRow/HeaderAside1/ContextLabel
onready var aside_two = $HeaderRow/HeaderAside2/ContextLabel
onready var adventure_log = $TabContainer/Main/VBoxContainer/LogContainer/ScrollContainer/AdventureLog

onready var move_options = $TabContainer/Main/VBoxContainer/MoveCommand/MoveOption
onready var using_label = $TabContainer/Main/VBoxContainer/MoveCommand/Using
onready var weapon_options = $TabContainer/Main/VBoxContainer/MoveCommand/Weapon
onready var against_label = $TabContainer/Main/VBoxContainer/MoveCommand/Against
onready var target_options = $TabContainer/Main/VBoxContainer/MoveCommand/Target
onready var adventure_text = $TabContainer/Main/VBoxContainer/TextContainer/AdventureText
#* ----- player tab var ---------
onready var current_hp = $TabContainer/Player/PlayerDetails/ReferenceRect/HBoxContainer/CurrentHp
onready var max_hp = $TabContainer/Player/PlayerDetails/ReferenceRect2/HBoxContainer/MaxHp
onready var strength = $TabContainer/Player/PlayerDetails/ReferenceRect3/HBoxContainer/Strength
onready var constitution = $TabContainer/Player/PlayerDetails/ReferenceRect4/HBoxContainer/Constitution
onready var dexterity = $TabContainer/Player/PlayerDetails/ReferenceRect5/HBoxContainer/Dexterity
onready var wisdom = $TabContainer/Player/PlayerDetails/ReferenceRect6/HBoxContainer/Wisdom
onready var intelligence = $TabContainer/Player/PlayerDetails/ReferenceRect7/HBoxContainer/Intelligence
onready var charisma = $TabContainer/Player/PlayerDetails/ReferenceRect8/HBoxContainer/Charisma
onready var level = $TabContainer/Player/PlayerDetails/ReferenceRect9/HBoxContainer/Level
onready var experience = $TabContainer/Player/PlayerDetails/ReferenceRect10/HBoxContainer/Experience
onready var armor = $TabContainer/Player/PlayerDetails/ReferenceRect11/HBoxContainer/Armor
onready var max_load = $TabContainer/Player/PlayerDetails/ReferenceRect13/HBoxContainer/MaxLoad
#* ----- inventory tab var ---------
onready var inventory_list = $TabContainer/Inventory/InventoryList
#* ----- location tab var ---------
onready var location_name = $TabContainer/Location/LocationDetails/ReferenceRect/HBoxContainer/Name
onready var steading = $TabContainer/Location/LocationDetails/ReferenceRect2/HBoxContainer/Steading
onready var location_description = $TabContainer/Location/LocationDetails/HBoxContainer/Description
onready var location_tree = $TabContainer/Location/LocationDetails/Tree

#* Script vars:
#* ----- main tab var ---------
var selected_move = {}
var selected_item = {}
var selected_targets = []
var selected_target_index = null
var possible_targets = []
var available_weapons = []
var dead_list = []
var loot = {
	"coins": 0,
	"special_items" : []
}
#* ----- player tab var ---------
#* ----- inventory tab var ---------
#* ----- location tab var ---------

#* ---- Setup scripts -------
func state_override():
	if CharacterSheet.debug_mode == true:
#		update_context("In Battle", true, false) #battle
		update_context("In Town", false, true) #town
		CharacterSheet.player_coins += 0
		if CharacterSheet.battle_targets.size() == 0:
			Enemies.generate_monsters(Locations.A1_S1_cave)

func load_the_ui():
	populate_move_options()
	popluate_weapon_options()
	populate_target_options()
	populate_inventory_list()
	populate_player_tab()
	populate_location_tab()
	update_aside_one()
	update_aside_two()
	connect_signals()
	Signals.log("Welcome Back!")


func _ready():
	state_override()
	load_the_ui()
	SaveSystem.save_and_encrypt_game()

func populate_move_options():
	var available_moves = Moves.get_valid_moves()
	CharacterSheet.available_moves = available_moves
	for move in available_moves:
		move_options.add_item(move["name"])
	selected_move = CharacterSheet.available_moves[0] #* setting default

func popluate_weapon_options():
	if available_weapons:
		available_weapons.clear()
	if weapon_options:
		weapon_options.clear()
	match selected_move["name"]:
		"volley":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and item["range_tags"].has("close") == false and item["range_tags"].has("hand") == false:
					available_weapons.append(item)
					weapon_options.add_item(item["name"])
		"hack and slash":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and (item["range_tags"].has("close") == true or item["range_tags"].has("hand") == true):
					available_weapons.append(item)
					weapon_options.add_item(item["name"])
			available_weapons.append(Items.no_weapon)
			weapon_options.add_item(Items.no_weapon["name"])
		"hack and slash recklessly":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and (item["range_tags"].has("close") == true or item["range_tags"].has("hand") == true):
					available_weapons.append(item)
					weapon_options.add_item(item["name"])
			available_weapons.append(Items.no_weapon)
			weapon_options.add_item(Items.no_weapon["name"])
		"cast spell":
			for spell in CharacterSheet.prepared_spells:
				available_weapons.append(spell)
				weapon_options.add_item(spell["name"])
		"shop for an item":
			for item in Items.master_list:
				available_weapons.append(item)
				var cost = item["coin"] if item["coin"] else ""
				weapon_options.add_item(item["name"] + " - " + String(cost))
		"shop for a service":
			for service in Services.master_service_list:
				available_weapons.append(service)
				var cost = service["coin"] if service["coin"] else ""
				weapon_options.add_item(service["name"] + " - " + String(cost))
		"sell an item":
			for item in CharacterSheet.player_inventory:
				if item["coin"]:
					available_weapons.append(item)
					var cost = item["coin"] if item["coin"] else ""
					weapon_options.add_item(item["name"] + " - " + String(cost))
		_:
			assert("unknown: selected" == selected_move) # add unknown move
	selected_item = available_weapons[0]
			
func populate_target_options():
	if target_options.get_item_count() > 0:
		target_options.clear()
	var enemies = CharacterSheet.battle_targets
	if enemies.size() == 0:
		battle_ended()
	var friends = CharacterSheet.friendly_targets
	var you = [{"name": CharacterSheet.player_name, "friend_foe": "[Self]"}]
	possible_targets = enemies + friends + you
	var index = 1
	for target in possible_targets:
		var target_info = target["name"] + "-" + String(index) + " "  + target["friend_foe"] + " " + health_summary(target)
		target_options.add_item(target_info)
		index += 1
	selected_targets = [possible_targets[0]] #* setting default
	selected_target_index = 0

func populate_inventory_list():
	if inventory_list.get_item_count() > 0:
		inventory_list.clear()	
	for item in CharacterSheet.player_inventory:
		inventory_list.add_item(item["name"])

func populate_location_tab():
	if CharacterSheet.current_location.empty():
		CharacterSheet.current_location = Locations.starter_city.duplicate(true)
	location_name.text = CharacterSheet.current_location["name"]
	steading.text = CharacterSheet.current_location["steading_type"]
	location_description.text = CharacterSheet.current_location["description"]
	#* First create giant dictionary of known locations
	#* Then use that dictionary to populate the locations tree
	#* For performance reasons, all locations are "visible" but are labeled "Unkown".
	#* Use set_text() on a treeitem to change text from "Unkown" to it's actual name.
	var world = location_tree.create_item()
	world.set_text(0, "world")
	# var region1 = location_tree.create_item(world)
	# region1.set_text(0, "region Foo")
	# var region2 = location_tree.create_item(world)
	# region2.set_text(0, "Unexplored Region")
	# var area2 = location_tree.create_item(region2)
	# area2.set_text(0, "Unexplored Area")
	# var area1 = location_tree.create_item(region1)
	# area1.set_text(0, "area Bar")
	# var steading1 = location_tree.create_item(area1)
	# steading1.set_text(0, "steading Lorem")
	# var site1 = location_tree.create_item(steading1)
	# site1.set_text(0, "site Market (you are here)")
	# var site2 = location_tree.create_item(area1)
	# site2.set_text(0, "Unexplored Site")

func populate_player_tab():
	current_hp.text = String(CharacterSheet.hp)
	max_hp.text = String(CharacterSheet.max_hitpoints())
	strength.text = String(CharacterSheet.player_str)
	constitution.text = String(CharacterSheet.player_con)
	dexterity.text = String(CharacterSheet.player_dex)
	wisdom.text = String(CharacterSheet.player_wis)
	intelligence.text = String(CharacterSheet.player_int)
	charisma.text = String(CharacterSheet.player_cha)
	level.text = String(CharacterSheet.player_level)
	experience.text = String(CharacterSheet.player_exp)
	armor.text = String(CharacterSheet.total_armor())
	max_load.text = String(CharacterSheet.max_load())

func update_context(text, battle_bool, town_bool):
	CharacterSheet.player_in_battle = battle_bool
	CharacterSheet.player_in_town = town_bool
	context_label.text = text

func update_aside_one():
	var new_text = "HP: " + String(CharacterSheet.hp)
	aside_one.text = new_text
	
func update_aside_two():
	var new_text = "Coins: " + String(CharacterSheet.player_coins)
	aside_two.text = new_text

#* ---------- Main Tab -------------------------

func _on_SubmitBtn_pressed():
	pre_move_hook()
	match selected_move["name"]:
		# ----common----
		"hack and slash":
			# targets, reckless=false, player_weapon_used=null
			var reckless = false
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_targets, reckless, selected_item)
			for target in selected_targets:
				Signals.log("%s is %s" % [target["name"], health_summary(target)])
		"hack and slash recklessly":
			# targets, reckless=true, player_weapon_used=null
			var reckless = true
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_targets, reckless, selected_item)
			for target in selected_targets:
				Signals.log("%s is %s" % [target["name"], health_summary(target)])
		"volley":
			# target, player_weapon_used, fail_opt
			selected_move["execute"].call_func()
		"defy danger":
			selected_move["execute"].call_func()
			# stat_choice
			# "defend":
			# 	selected_move["execute"].call_func()
			# 	#TODO: not implemented yet
			# "aid or interfere":
			# 	selected_move["execute"].call_func()
		# 	#TODO: implement once bonds are setup
		"spout lore":
			selected_move["execute"].call_func()
			# object(item,place,npc)
			#TODO: not implemented yet
		# "discern realities":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		# "parley":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		#----special----
		# "last breath":
		# 	selected_move["execute"].call_func()
		# "encumbrance":
		# 	selected_move["execute"].call_func()
		"make camp":
			selected_move["execute"].call_func()
			# location
		"take watch":
			selected_move["execute"].call_func()
			# location
		# "carouse":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		# "undertake perilous journey":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		"shop for an item":
			selected_move["execute"].call_func(selected_item)
			populate_inventory_list()
		"shop for a service":
			selected_move["execute"].call_func(selected_item)
			populate_inventory_list()
		"sell an item":
			selected_move["execute"].call_func(selected_item)
			popluate_weapon_options()
			populate_inventory_list()
		"recover":
			selected_move["execute"].call_func()
			# days
		# "recruit":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		# "outstanding warrants":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		# "bolster":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		"level up":
			selected_move["execute"].call_func()
		# "end of session":
		# 	selected_move["execute"].call_func()

		#----wizard common----
		"cast spell":
			assert(selected_item != null)
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_item, selected_targets)
			for target in selected_targets:
				if target["hp"] > 0:
					Signals.log("%s is %s" % [target["name"], health_summary(target)])
		"prepare spells":
			selected_move["execute"].call_func()
		"add to spellbook":
			selected_move["execute"].call_func()
		"spell defense":
			selected_move["execute"].call_func()
		# "ritual":
		# 	selected_move["execute"].call_func()
		# 	#TODO: not implemented yet
		_:
			assert("move not yet implemented for submitBn" == selected_move["name"])
	post_move_hook()

func pre_move_hook():
	adventure_log.unselect_all()
	
func post_move_hook():
	refresh_targets()
	update_aside_one()
	update_aside_two()

func refresh_targets():
	target_options.clear()
	populate_target_options()
	
func _on_target_died(target):
	Signals.log("%s has been killed" % target["name"])
	var new_loot = Items.generate_treasure(target)
	var coins_dropped = new_loot["coins"]
	loot["coins"] += coins_dropped
	var items_dropped = new_loot["special_items"]
	loot["special_items"].append_array(items_dropped)
	CharacterSheet.battle_targets.remove(selected_target_index)
	if CharacterSheet.battle_targets.size() == 0:
		Signals.log("%s coins were found" % loot["coins"])
	if loot["special_items"].size() > 0:
		for item in loot["special_items"]:
			Signals.log("%s was found" % item["name"])

func _on_player_died(): 
	Signals.log("You died! Thanks for trying the Alpha release of the game") #TODO: what happens when player dies?

func _on_add_to_adventure_log(text):
	adventure_log.add_item(text)
	print(adventure_log.get_item_count())
	var last_index = adventure_log.get_item_count() - 1
	adventure_log.move_item(last_index, 0)
	adventure_log.select(0, false)
	
func _on_MoveOption_item_selected(index):
	selected_move = CharacterSheet.available_moves[index]
	match selected_move["name"]:
		# ----common----
		"hack and slash":
			using_weapon_against_target_setter(true, true, true, true)
			popluate_weapon_options()
		"hack and slash recklessly":
			using_weapon_against_target_setter(true, true, true, true)
			popluate_weapon_options()
		"volley":
			using_weapon_against_target_setter(true, true, true, true)
			popluate_weapon_options()
		"defy danger":
			using_weapon_against_target_setter(false, false, false, false)
		"defend":
			using_weapon_against_target_setter(false, false, true, true)
			popluate_weapon_options()
		"aid or interfere":
			pass #TODO: implement once bonds are setup
		"spout lore":
			using_weapon_against_target_setter(false, false, false, false)
		"discern realities":
			using_weapon_against_target_setter(false, false, false, false)
		"parley":
			using_weapon_against_target_setter(false, false, true, true)
		#----special----
		"last breath":
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
		"shop for an item":
			using_weapon_against_target_setter(false, true, false, false)
			popluate_weapon_options()
		"shop for a service":
			using_weapon_against_target_setter(false, true, false, false)
			popluate_weapon_options()
		"sell an item":
			using_weapon_against_target_setter(false, true, false, false)
			popluate_weapon_options()
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
			using_weapon_against_target_setter(true, true, true, true)
			popluate_weapon_options()
		"prepare spells":
			using_weapon_against_target_setter(false, false, false, false)
		"add to spellbook":
			using_weapon_against_target_setter(false, false, false, false)
		"spell defense":
			using_weapon_against_target_setter(false, false, false, false)
		"ritual":
			using_weapon_against_target_setter(false, false, false, false)
		_:
			assert("move is not yet implemented for move option" == selected_move["name"])

func using_weapon_against_target_setter(using, weapon, against, target):
	using_label.visible = using
	weapon_options.visible = weapon
	against_label.visible = against
	target_options.visible = target

func _on_Weapon_item_selected(index):
	match selected_move["name"]:
		"volley":
			selected_item = CharacterSheet.player_inventory[index]
		"hack and slash":
			selected_item = CharacterSheet.player_inventory[index]
		"hack and slash recklessly":
			selected_item = CharacterSheet.player_inventory[index]
		"cast spell":
			selected_item = CharacterSheet.prepared_spells[index]
		"shop for an item":
			selected_item = Items.master_list[index]
		"shop for a service":
			selected_item = Services.master_service_list[index]
		"sell an item":
			selected_item = CharacterSheet.player_inventory[index]
		_:
			assert("move not implemented for weapon item select" == selected_move["name"])

func _on_Target_item_selected(index):
	selected_targets = [possible_targets[index]]
	selected_target_index = index
	
func battle_ended():
	Signals.log("Battle is now over. You now look for loot")
	CharacterSheet.player_in_battle = false
	context_label.text = "No Immediate Danger"

func health_summary(target):
	var max_hp = 0
	var hp = 0
	if target.has("monster_tags"):
		max_hp = float(target["max_hp"]) 
		hp = float(target["hp"]) 
	else:
		max_hp = float(CharacterSheet.max_hitpoints())
		hp = float(CharacterSheet.hp)
	var hp_one_to_hundred = (hp / max_hp) * 100
	var hp_category = String(stepify(hp_one_to_hundred, 20))
	var hp_summary = ""
	match hp_category:
		"0":
			hp_summary = "critically wounded"
		"20":
			hp_summary = "severely wounded"
		"40":
			hp_summary = "seriously wounded"
		"60":
			hp_summary = "moderately wounded"
		"80":
			hp_summary = "slightly wounded"
		"100":
			hp_summary = "not wounded"
		_:
			hp_summary = "dead"
#			assert("this value shouldn't exist" == "_")
	return hp_summary

func connect_signals():
	Signals.connect("target_died", self, "_on_target_died")
	Signals.connect("player_died", self, "_on_player_died")
	Signals.connect("add_to_adventure_log", self, "_on_add_to_adventure_log")

#* ---------- Player Tab -------------------------
#* ---------- Location Tab -------------------------
#* ---------- Test Tab -------------------------
#
#func _on_TestBtn1_pressed(): #monster enounter
#
#func _on_TestBtn2_pressed(): # generate monsters
#	Enemies.generate_monsters(Locations.A1_S1_cave)
#
#func _on_TestBtn3_pressed(): # recover
#	Moves.recover_fn(3)
#
#func _on_TestBtn4_pressed(): # generate treasure
#	Items.generate_treasure(Enemies.ankheg)


