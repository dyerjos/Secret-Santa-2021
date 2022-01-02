extends ColorRect


#* UI references:
#* ----- main tab var ---------
onready var context_label = $CenterContainer/ContextLabel
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

#* Script vars:
#* ----- main tab var ---------
var selected_move = {}
var selected_weapon = {}
#var selected_spell = {}  #using selected_weapon instead
var selected_targets = []
var selected_target_index = null
var possible_targets = []
var availabile_weapons = []
var dead_list = []
var loot = {
	"coins": 0,
	"special_items" : []
}
#* ----- player tab var ---------
#* ----- inventory tab var ---------
#* ----- location tab var ---------

#* ---- Setup scripts -------
func _ready():
	if CharacterSheet.debug_mode == true:
		update_context("In Battle", true, false)
		if CharacterSheet.battle_targets.size() == 0:
			Enemies.generate_monsters(Locations.A1_S1_cave)
	populate_move_options()
	popluate_weapon_options()
	populate_target_options()
	populate_inventory_list()
	populate_player_tab()
	populate_location_tab()
	connect_signals()
	SaveSystem.save_and_encrypt_game()


func populate_move_options():
	var available_moves = Moves.get_valid_moves()
	CharacterSheet.available_moves = available_moves
	for move in available_moves:
		move_options.add_item(move["name"])
	selected_move = CharacterSheet.available_moves[0] #* setting default

func popluate_weapon_options():
	print("populate_weapon_options hit")
	if availabile_weapons:
		availabile_weapons.clear()
	if weapon_options:
		weapon_options.clear()
	match selected_move["name"]:
		"volley":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and item["range_tags"].has("close") == false and item["range_tags"].has("hand") == false:
					availabile_weapons.append(item)
					weapon_options.add_item(item["name"])
		"hack and slash":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and (item["range_tags"].has("close") == true or item["range_tags"].has("hand") == true):
					availabile_weapons.append(item)
					weapon_options.add_item(item["name"])
			availabile_weapons.append(Items.no_weapon)
			weapon_options.add_item(Items.no_weapon["name"])
		"hack and slash recklessly":
			for item in CharacterSheet.player_inventory:
				if item.has("is_weapon") and item["is_weapon"] == true and item.has("range_tags") and (item["range_tags"].has("close") == true or item["range_tags"].has("hand") == true):
					availabile_weapons.append(item)
					weapon_options.add_item(item["name"])
			availabile_weapons.append(Items.no_weapon)
			weapon_options.add_item(Items.no_weapon["name"])
		"cast spell":
			print("poplulating weapon options")
			for spell in CharacterSheet.prepared_spells:
				availabile_weapons.append(spell)
				weapon_options.add_item(spell["name"])
				print("spell added to spell options: %s" % spell["name"])
			print("weapon_options list size: %s" % weapon_options.get_item_count())
		_:
			print("unknown: selected %s" % selected_move)
	selected_weapon = availabile_weapons[0]
			
func populate_target_options():
	print("populating targets")
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

	#* other way:
	# for target in enemies:
	# 	target_options.add_item(target["name"] + " [Enemy]")
	# for target in friends:
	# 	target_options.add_item(target["name"] + " [Ally]")
	# target_options.add_item("[Self]")

func populate_inventory_list():
	for item in CharacterSheet.player_inventory:
		inventory_list.add_item(item["name"])

func populate_location_tab():
	if CharacterSheet.current_location.empty():
		CharacterSheet.current_location = Locations.starter_city.duplicate(true)
	location_name.text = CharacterSheet.current_location["name"]
	steading.text = CharacterSheet.current_location["steading_type"]
	location_description.text = CharacterSheet.current_location["description"]

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

#* ---------- Main Tab -------------------------

func _on_SubmitBtn_pressed():
	print("calling move's funcref via submitBtn_pressed")
	match selected_move["name"]:
		# ----common----
		"hack and slash":
			# targets, reckless=false, player_weapon_used=null
			var reckless = false
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_targets, reckless, selected_weapon)
		"hack and slash recklessly":
			# targets, reckless=true, player_weapon_used=null
			var reckless = true
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_targets, reckless, selected_weapon)
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
		# "last_breath":
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
		"supply":
			selected_move["execute"].call_func()
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
			assert(selected_weapon != null)
			assert(selected_targets != null)
			selected_move["execute"].call_func(selected_weapon, selected_targets)
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
			print("move %s is not yet implemented for submit move button action." % selected_move["name"])
	post_move_hook()

func post_move_hook():
	refresh_targets()

func refresh_targets():
	target_options.clear()
	populate_target_options()
	
func _on_target_died(target):
	print("received signal that target died")
	print(target["name"])
	var new_loot = Items.generate_treasure(target)
	var coins_dropped = new_loot["coins"]
	print("signal here? monster dropped %s coins" % coins_dropped)
	loot["coins"] += coins_dropped
	var items_dropped = new_loot["special_items"]
	if items_dropped:
		print("signal here? monster dropped %s items" % items_dropped)
	loot["special_items"].append_array(items_dropped)
	print("current loot now: %s" % loot)
	print("target that died: %s" % target)
	CharacterSheet.battle_targets.remove(selected_target_index)
	# target_options.clear()
	# populate_target_options()


func _on_player_died(): 
	print("received signal that player died")
	
func _on_MoveOption_item_selected(index):
	selected_move = CharacterSheet.available_moves[index]
	print("selected %s" % selected_move)
	match selected_move["name"]:
		# ----common----
		"hack and slash":
			using_weapon_against_target_setter(true, true, true, true)
		"hack and slash recklessly":
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
			using_weapon_against_target_setter(true, true, true, true)
		"prepare spells":
			using_weapon_against_target_setter(false, false, false, false)
		"add to spellbook":
			using_weapon_against_target_setter(false, false, false, false)
		"spell defense":
			using_weapon_against_target_setter(false, false, false, false)
		"ritual":
			using_weapon_against_target_setter(false, false, false, false)
		_:
			print("move %s is not yet implemented for submit move button action." % selected_move["name"])
	popluate_weapon_options()

func using_weapon_against_target_setter(using, weapon, against, target):
	using_label.visible = using
	weapon_options.visible = weapon
	against_label.visible = against
	target_options.visible = target

func _on_Weapon_item_selected(index):
	print("selected_move: %s" % selected_move)
	match selected_move["name"]:
		"volley":
			selected_weapon = CharacterSheet.player_inventory[index]
		"hack and slash":
			selected_weapon = CharacterSheet.player_inventory[index]
		"hack and slash recklessly":
			selected_weapon = CharacterSheet.player_inventory[index]
		"cast spell":
			print("number of prepared_spells: %s" % CharacterSheet.prepared_spells.size())
			selected_weapon = CharacterSheet.prepared_spells[index]
			print("I am the spell: %s" % CharacterSheet.prepared_spells[index])
		_:
			print("move %s is not yet implemented for submit move button action." % selected_move["name"])

func _on_Target_item_selected(index):
	selected_targets = [possible_targets[index]]
	selected_target_index = index
	
func battle_ended():
	print("battle ended")
	CharacterSheet.player_in_battle = false
	context_label.text = "No Immediate Danger"

func health_summary(target):
	var max_hp = 0
	var hp = 0
	if target.has("monster_tags"):
		max_hp = float(target["max_hp"]) 
		hp = float(target["hp"]) 
		print("percentage of health: %s" % (hp/max_hp))
		print("hp left: %s" % hp)
	else:
		max_hp = float(CharacterSheet.max_hitpoints())
		hp = float(CharacterSheet.hp)
	var hp_one_to_hundred = (hp / max_hp) * 100
	var hp_category = String(stepify(hp_one_to_hundred, 20))
	var hp_summary = ""
	match hp_category:
		"0":
			hp_summary = "Critically Wounded"
		"20":
			hp_summary = "Severely Wounded"
		"40":
			hp_summary = "Seriously Wounded"
		"60":
			hp_summary = "Moderately Wounds"
		"80":
			hp_summary = "Slighly Wounded"
		"100":
			hp_summary = ""
		_:
			assert("this value shouldn't exist" == "_")
	return hp_summary

func connect_signals():
	Signals.connect("target_died", self, "_on_target_died")
	Signals.connect("player_died", self, "_on_player_died")

#* ---------- Player Tab -------------------------
#* ---------- Location Tab -------------------------
#* ---------- Test Tab -------------------------
#
#func _on_TestBtn1_pressed(): #monster enounter
#	print("hi")
#
#
#func _on_TestBtn2_pressed(): # generate monsters
#	Enemies.generate_monsters(Locations.A1_S1_cave)
#
#
#func _on_TestBtn3_pressed(): # recover
#	Moves.recover_fn(3)
#
#
#func _on_TestBtn4_pressed(): # generate treasure
#	#TODO: how to select a target?
#	Items.generate_treasure(Enemies.ankheg)


