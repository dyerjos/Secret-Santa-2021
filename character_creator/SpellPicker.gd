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
	if CharacterSheet.spells_in_spellbook.size() < 3:
		DoneBtn.disabled = true
	else:
		DoneBtn.disabled = false
		disable_all_buttons()
		
func renable_all_buttons():
	# SpellBtn1.disabled = false #TODO: contact_spirits
	SpellBtn2.disabled = false
	SpellBtn3.disabled = false
	SpellBtn4.disabled = false
	SpellBtn5.disabled = false
	SpellBtn6.disabled = false
	SpellBtn7.disabled = false
	SpellBtn8.disabled = false
	
func disable_all_buttons():
	# SpellBtn1.disabled = true #TODO: contact_spirits
	SpellBtn2.disabled = true
	SpellBtn3.disabled = true
	SpellBtn4.disabled = true
	SpellBtn5.disabled = true
	SpellBtn6.disabled = true
	SpellBtn7.disabled = true
	SpellBtn8.disabled = true

func assign_cantrips_and_race():
	CharacterSheet.known_cantrips = []
	if CharacterSheet.player_class == "wizard":
		CharacterSheet.known_cantrips.append_array(WizardSpells.wizard_cantrips)
		if CharacterSheet.player_race == "elf":
			CharacterSheet.known_cantrips.append(WizardSpells.detect_magic)
			SpellBtn2.disabled = true
			SpellBtn2.text = "As an Elf, you always have this prepared!"
			CureLightWoundsRow.visible = false
			assert(CharacterSheet.spells_in_spellbook.size() == 0) # (detect Godot export array bug)
		if CharacterSheet.player_race == "human":
			CureLightWoundsRow.visible = true
	
#TODO: contact_spirits row is also made invisible for now
# func _on_SpellBtn1_pressed():
# 	if CharacterSheet.spells_in_spellbook.size() < 3:
# 		CharacterSheet.spells_in_spellbook.append(WizardSpells.contact_spirits)
# 		CharacterSheet.prepared_spells.append(WizardSpells.contact_spirits.duplicate(true))
# 		SpellBtn1.disabled = true
# 		assert(CharacterSheet.player_inventory.size() == 0)

func _on_SpellBtn2_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.detect_magic)
		CharacterSheet.prepared_spells.append(WizardSpells.detect_magic.duplicate(true))
		SpellBtn2.disabled = true


func _on_SpellBtn3_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.magic_missile)
		CharacterSheet.prepared_spells.append(WizardSpells.magic_missile)
		SpellBtn3.disabled = true

func _on_SpellBtn4_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.charm_person)
		CharacterSheet.prepared_spells.append(WizardSpells.charm_person.duplicate(true))
		SpellBtn4.disabled = true

func _on_SpellBtn5_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.invisibility)
		CharacterSheet.prepared_spells.append(WizardSpells.invisibility.duplicate(true))
		SpellBtn5.disabled = true

func _on_SpellBtn6_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.telepathy)
		CharacterSheet.prepared_spells.append(WizardSpells.telepathy.duplicate(true))
		SpellBtn6.disabled = true

func _on_SpellBtn7_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(WizardSpells.alarm)
		CharacterSheet.prepared_spells.append(WizardSpells.alarm.duplicate(true))
		SpellBtn7.disabled = true

func _on_SpellBtn8_pressed():
	if CharacterSheet.spells_in_spellbook.size() < 3:
		CharacterSheet.spells_in_spellbook.append(ClericSpells.cure_light_wounds)
		CharacterSheet.prepared_spells.append(ClericSpells.cure_light_wounds.duplicate(true))
		SpellBtn8.disabled = true


func _on_DoneBtn_pressed():
	Scene.change("GearPicker")



func _on_ResetBtn_pressed():
	assign_cantrips_and_race()
	renable_all_buttons()

