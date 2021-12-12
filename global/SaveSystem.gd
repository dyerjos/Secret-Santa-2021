extends Node

var save_path = "user://savegame.save"


#* ------------File methods -----------------------------------------

# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_and_encrypt_game():
	var save_game = File.new()
	save_game.open(save_path, File.WRITE) # or open_encrypted_with_pass(save_path,file.w,PA$$word99!)
	var master_save_list = []
	prep_persistant_nodes(master_save_list)
	prep_globals(master_save_list)
	print("master_save_list length: %s" % len(master_save_list))
	assert(typeof(master_save_list) == TYPE_ARRAY)
	save_game.store_var(master_save_list, true)
	save_game.close()

func load_and_unencrypt_game():
	var save_game = File.new()
	if save_game.file_exists(save_path):
		save_game.open(save_path, File.READ)
		var master_save_list = save_game.get_var(true)
		save_game.close()
		load_persistant_nodes(master_save_list)
		load_globals(master_save_list)
	else:
		print("error: save file not found!")

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
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_dict = node.call("save")
#		assert(typeof(node_dict) == TYPE_DICTIONARY)

		# save_game.store_line(to_json(node_data)) #* official docs method
		master_save_list.append(node_dict)
	return master_save_list

func load_persistant_nodes(master_save_list):
	print("TODO: load persistant nodes") # load_persistant_nodes()

func prep_globals(master_save_list):
	master_save_list.append(CharacterSheet.save_dict())
#	assert(typeof(CharacterSheet.save_dict) == TYPE_DICTIONARY)

	print("TODO: save any other autoloaded scripts here")
	return master_save_list

func load_globals(master_save_list):
	for dict in master_save_list:
		print("loading %s" % dict)
		if "player_name" in dict:
			CharacterSheet.load(dict)
	print("loaded globals")
