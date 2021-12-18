extends ColorRect

export var choices_counter = 0

onready var LeatherBtn = $TabContainer/Defense/Column/Row2/GearPanel/GearBtn9
onready var BooksBtn = $TabContainer/Defense/Column/Row3/GearPanel/GearBtn10
onready var DaggerBtn = $TabContainer/Weapon/Column/Row2/GearPanel/DaggerBtn
onready var StaffBtn = $TabContainer/Weapon/Column/Row3/GearPanel/StaffBtn
onready var HealBtn = $TabContainer/Misc/Column/Row2/GearPanel/HealBtn
onready var AntiBtn = $TabContainer/Misc/Column/Row3/GearPanel/AntiBtn


# defense tab
func _on_GearBtn9_pressed(): # leather armor
	add_to_inventory("leather_armor")
	LeatherBtn.disabled = true
	BooksBtn.disabled = true
	LeatherBtn.text = "This item is now added to your inventory!"
func _on_GearBtn10_pressed(): # bag of books and potions
	add_to_inventory("bag_of_books")
	add_to_inventory("healing_potion", 3)
	LeatherBtn.disabled = true
	BooksBtn.disabled = true
	BooksBtn.text = "These items are now added to your inventory!"

# weapon tab
func _on_DaggerBtn_pressed():
	add_to_inventory("dagger")
	DaggerBtn.disabled = true
	StaffBtn.disabled = true
	DaggerBtn.text = "This item is now added to your inventory!"
func _on_StaffBtn_pressed():
	add_to_inventory("staff")
	DaggerBtn.disabled = true
	StaffBtn.disabled = true
	StaffBtn.text = "This item is now added to your inventory!"
	
# misc tab
func _on_HealBtn_pressed():
	add_to_inventory("healing_potion")
	HealBtn.disabled = true
	AntiBtn.disabled = true
	HealBtn.text = "This item is now added to your inventory!"
func _on_AntiBtn_pressed():
	add_to_inventory("antitoxin", 3)
	HealBtn.disabled = true
	AntiBtn.disabled = true
	AntiBtn.text = "These items are now added to your inventory!"

# helper functions
func add_to_inventory(item, count=1):
	for i in range(count):
		CharacterSheet.player_inventory.append(Items.get(item))
	choices_counter += 1
	if choices_counter == 3:
		Scene.change("Test")

