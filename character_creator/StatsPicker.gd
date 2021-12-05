extends ColorRect


onready var StrOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer/StrOptBtn
onready var DexOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer2/DexOptBtn
onready var ConOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer3/ConOptBtn
onready var IntOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer4/IntOptBtn
onready var WisOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer5/WisOptBtn
onready var ChaOptBtn := $TabContainer/Class/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer6/ChaOptBtn
onready var DoneBtn := $TabContainer/Class/VBoxContainer/CenterContainer3/HBoxContainer/DoneBtn

onready var StatsPool := {"-": 0, "16": 1, "15": 2, "13": 3, "12": 4, "9": 5, "8": 6} # idx 0 is null

export var stats_set_count = 0

func _ready():
	clear_stats()
	populate_stats()
	assert(StrOptBtn.get_item_count() == 7)
	DoneBtn.disabled = true # incase I accidentally change this in editor

func _process(delta):
	done_btn_checker()

func _on_DoneBtn_pressed():
	Scene.change("ClassMovesPicker")

func _on_ResetBtn_pressed():
	clear_stats()
	populate_stats()
	renable_dropdowns()

func populate_stats():
	for stat in StatsPool:
		StrOptBtn.add_item(stat, StatsPool[stat])
		DexOptBtn.add_item(stat, StatsPool[stat])
		ConOptBtn.add_item(stat, StatsPool[stat])
		IntOptBtn.add_item(stat, StatsPool[stat])
		WisOptBtn.add_item(stat, StatsPool[stat])
		ChaOptBtn.add_item(stat, StatsPool[stat])

func clear_stats():
	DexOptBtn.clear()
	ConOptBtn.clear()
	IntOptBtn.clear()
	WisOptBtn.clear()
	ChaOptBtn.clear()
	StrOptBtn.clear()

func renable_dropdowns():
	DexOptBtn.disabled = false
	ConOptBtn.disabled = false
	IntOptBtn.disabled = false
	WisOptBtn.disabled = false
	ChaOptBtn.disabled = false
	StrOptBtn.disabled = false

func disable_item_at_index(index):
	if index == 0:
		return
	StrOptBtn.set_item_disabled(index, true)
	DexOptBtn.set_item_disabled(index, true)
	ConOptBtn.set_item_disabled(index, true)
	IntOptBtn.set_item_disabled(index, true)
	WisOptBtn.set_item_disabled(index, true)
	ChaOptBtn.set_item_disabled(index, true)

func remove_item_at_index(index):
	if index == 0:
		return
	StrOptBtn.remove_item(index)
	DexOptBtn.remove_item(index)
	ConOptBtn.remove_item(index)
	IntOptBtn.remove_item(index)
	WisOptBtn.remove_item(index)
	ChaOptBtn.remove_item(index)

func done_checker(): # proceed to next scene so player doesn't have to think
	stats_set_count += 1
	if stats_set_count == 6:
		print("done")
		
func done_btn_checker():
	if CharacterSheet.player_str == "" or CharacterSheet.player_dex == "" or CharacterSheet.player_con == "" or CharacterSheet.player_int == "" or CharacterSheet.player_wis == "" or CharacterSheet.player_cha == "":
		return
	else:
		DoneBtn.disabled = false

func _on_StrOptBtn_item_selected(index):
	CharacterSheet.player_str = StrOptBtn.get_item_text(index)
	remove_item_at_index(index)
	StrOptBtn.disabled = true
	done_checker()

func _on_DexOptBtn_item_selected(index):
	CharacterSheet.player_dex = DexOptBtn.get_item_text(index)
	remove_item_at_index(index)
	DexOptBtn.disabled = true
	done_checker()

func _on_ConOptBtn_item_selected(index):
	CharacterSheet.player_con = ConOptBtn.get_item_text(index)
	remove_item_at_index(index)
	ConOptBtn.disabled = true
	done_checker()

func _on_IntOptBtn_item_selected(index):
	CharacterSheet.player_int = IntOptBtn.get_item_text(index)
	remove_item_at_index(index)
	IntOptBtn.disabled = true
	done_checker()

func _on_WisOptBtn_item_selected(index):
	CharacterSheet.player_wis = WisOptBtn.get_item_text(index)
	remove_item_at_index(index)
	WisOptBtn.disabled = true
	done_checker()

func _on_ChaOptBtn_item_selected(index):
	CharacterSheet.player_cha = ChaOptBtn.get_item_text(index)
	remove_item_at_index(index)
	ChaOptBtn.disabled = true
	done_checker()
