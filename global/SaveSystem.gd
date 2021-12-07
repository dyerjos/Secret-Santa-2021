extends Node


#* ------------File methods -----------------------------------------

# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_and_encrypt_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
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
		var node_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_and_unencrypt_game():
	pass


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
#	var score_data = {} # example of loading a dictionary
	var config = ConfigFile.new()

	var err = config.load_encrypted_pass("user://character_sheets.cfg", "PA$$word99!")
	if err != OK:
		return

	# ! can't save dictionaries like this
	
	for section in config.get_sections():
		# example of loading individual values
		CharacterSheet.current_scene = config.get_value(section, "current_scene")
		CharacterSheet.player_race = config.get_value(section, "player_race")
		CharacterSheet.player_class = config.get_value(section, "player_class")
		
		# example of loading a dictionary:
#	    score_data[player_name] = player_score 

