extends Node

export var game_loaded = false
var save_path = "user://savegame.save"

#* ------------File methods -----------------------------------------


func save_and_encrypt_game():
	if game_loaded == true:
		return
	var save_game = File.new()
#	save_game.open(save_path, File.WRITE) #! non-encrypteed way
	save_game.open_encrypted_with_pass(save_path, File.WRITE, "PA$$word99!")
	var master_save_list = []
	prep_persistant_nodes(master_save_list)
	prep_globals(master_save_list)
	assert(typeof(master_save_list) == TYPE_ARRAY)
	save_game.store_var(master_save_list, true)
	save_game.close()

func load_and_unencrypt_game():
	var save_game = File.new()
	if save_game.file_exists(save_path):
#		save_game.open(save_path, File.READ) #! non-encrypteed way
		save_game.open_encrypted_with_pass(save_path, File.READ, "PA$$word99!")
		var master_save_list = save_game.get_var(true)
		save_game.close()
		load_persistant_nodes(master_save_list)
		load_globals(master_save_list)
		game_loaded = true
	else:
		assert("error: save file not found!" == "kjklj")

#* --------Config methods ------------------------------------------

func save_and_encrypt_config():
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	config.set_value("core", "CharacterSheet", CharacterSheet.big_dict())
	#* Store some values (section, key, value )
#	config.set_value("Player1", "current_scene", "LookPicker")
#	config.set_value("Player1", "player_class", "barbarian")
#	config.set_value("Player1", "player_race", "elf")
#	config.set_value("Player2", "player_name", "V3geta") #* example of 2nd section
#
	# Save it to a file (overwrite if already exists).
	config.save_encrypted_pass("user://character_sheets.cfg", "PA$$word99!")
	
func load_and_unencrypt_config():
	var config = ConfigFile.new()
	var err = config.load_encrypted_pass("user://character_sheets.cfg", "PA$$word99!")
	if err != OK:
		assert("error" == err)
		return
	for section in config.get_sections():
		# example of loading individual values
		CharacterSheet.current_scene = config.get_value(section, "current_scene")
		CharacterSheet.player_race = config.get_value(section, "player_race")
		CharacterSheet.player_class = config.get_value(section, "player_class")

func prep_persistant_nodes(master_save_list):
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			continue
		# Check the node has a save function.
		if !node.has_method("save"):
			continue
		# Call the node's save function.
		var node_dict = node.call("save")
		# save_game.store_line(to_json(node_data)) #* official docs method
		master_save_list.append(node_dict)
	return master_save_list

func load_persistant_nodes(master_save_list):
	assert(1==1)
	#TODO: load persistant nodes") # load_persistant_nodes()

func prep_globals(master_save_list):
	master_save_list.append(CharacterSheet.save_dict())
	#TODO: save any other autoloaded scripts here
	return master_save_list

func load_globals(master_save_list):
	for dict in master_save_list:
		if "player_name" in dict:
			CharacterSheet.load(dict)
