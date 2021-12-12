extends ColorRect

onready var DoneBtn = $TabContainer/Class/Column/CenterContainer3/HBoxContainer/DoneBtn
onready var SpellBtn1 = $TabContainer/Class/Column/Row4/SpellPanel/SpellBtn1
onready var SpellBtn2 = $TabContainer/Class/Column/Row5/SpellPanel/SpellBtn2
onready var SpellBtn3 = $TabContainer/Class/Column/Row6/SpellPanel/SpellBtn3
onready var SpellBtn4 = $TabContainer/Class/Column/Row7/SpellPanel/SpellBtn4
onready var SpellBtn5 = $TabContainer/Class/Column/Row8/SpellPanel/SpellBtn5
onready var SpellBtn6 = $TabContainer/Class/Column/Row9/SpellPanel/SpellBtn6
onready var SpellBtn7 = $TabContainer/Class/Column/Row10/SpellPanel/SpellBtn7 
onready var SpellBtn8 = $TabContainer/Class/Column/Row11/SpellPanel/SpellBtn8

onready var CureLightWoundsRow = $TabContainer/Class/Column/Row11

func _ready():
	assign_cantrips_and_race()

func _process(delta):
	done_btn_checker()
	
func done_btn_checker():
	if CharacterSheet.player_level_one_spells.size() < 3:
		DoneBtn.disabled = true
	else:
		DoneBtn.disabled = false
		disable_all_buttons()
		
func renable_all_buttons():
	SpellBtn1.disabled = false
	SpellBtn2.disabled = false
	SpellBtn3.disabled = false
	SpellBtn4.disabled = false
	SpellBtn5.disabled = false
	SpellBtn6.disabled = false
	SpellBtn7.disabled = false
	SpellBtn8.disabled = false
	
func disable_all_buttons():
	SpellBtn1.disabled = true
	SpellBtn2.disabled = true
	SpellBtn3.disabled = true
	SpellBtn4.disabled = true
	SpellBtn5.disabled = true
	SpellBtn6.disabled = true
	SpellBtn7.disabled = true
	SpellBtn8.disabled = true

func assign_cantrips_and_race():
	var wizard_cantrips = ["Light", "Unseen Servant", "Prestidigitation"]
	CharacterSheet.known_cantrips = []
	if CharacterSheet.player_class == "wizard":
		CharacterSheet.known_cantrips.append_array(wizard_cantrips)
		if CharacterSheet.player_race == "elf":
			CharacterSheet.known_cantrips.append("Detect Magic")
			SpellBtn2.disabled = true
			SpellBtn2.text = "As an Elf, you always have this prepared!"
			CureLightWoundsRow.visible = false
		if CharacterSheet.player_race == "human":
			CureLightWoundsRow.visible = true
		#! Godot 3.4 is adding cantrips to spell array. 
		#! Godot 3.4 also makes clear() clear cantrip array as well...
		CharacterSheet.player_level_one_spells = []
			

func _on_SpellBtn1_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Contact Spirits")
		SpellBtn1.disabled = true

func _on_SpellBtn2_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Detect Magic")
		SpellBtn2.disabled = true

func _on_SpellBtn3_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Magic Missile")
		SpellBtn3.disabled = true

func _on_SpellBtn4_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Charm Person")
		SpellBtn4.disabled = true

func _on_SpellBtn5_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Invisibility")
		SpellBtn5.disabled = true

func _on_SpellBtn6_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Telepathy")
		SpellBtn6.disabled = true

func _on_SpellBtn7_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Alarm")
		SpellBtn7.disabled = true

func _on_SpellBtn8_pressed():
	if CharacterSheet.player_level_one_spells.size() < 3:
		CharacterSheet.player_level_one_spells.append("Cure Light Wounds")
		SpellBtn8.disabled = true


func _on_DoneBtn_pressed():
	print("going to next scene")
	print("Testing modifier: con %s" % CharacterSheet.stat_to_modifier(CharacterSheet.player_con))


func _on_ResetBtn_pressed():
	assign_cantrips_and_race()
	renable_all_buttons()

