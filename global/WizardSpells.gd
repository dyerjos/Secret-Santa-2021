extends Node

var wizard_cantrips = [
	light,
	unseen_servant,
	prestidigitation,
]

var wizard_level_one_spells = [
	contact_spirits,
	detect_magic,
	magic_missile,
	charm_person,
	invisibility,
	telepathy,
	alarm,
]

#TODO: var wizard_level_third_spells = []
#TODO: var wizard_level_fifth_spells = []
#TODO: var wizard_level_seventh_spells = []
#TODO: var wizard_level_ninth_spells = []

func light_fn():
	print("light")
	CharacterSheet.has_a_light = not CharacterSheet.has_a_light #boolean flip
var light = {
	"name" : "light",
	"level" : 0,
	"description" : "An item you touch glows with arcane light, about as bright as a torch. It gives off no heat or sound and requires no fuel, but it is otherwise like a mundane torch. You have complete control of the color of the flame. The spell lasts as long as it is in your presence.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "light_fn")
}

func unseen_servant_fn():
	print("unseen servant called")
	#TODO: setup unseen servant as a destructable npc that holds inventory for you
	CharacterSheet.player_inventory.append(Items.get("unseen_servant").duplicate(true)) #* this is a shortcut
	CharacterSheet.has_unseen_servant = true
var unseen_servant = {
	"name" : "unseen servant",
	"level" : 0,
	"description" : "You conjure a simple invisible construct that can do nothing but carry items. It has Load 3 and carries anything you hand to it. It cannot pick up items on its own and can only carry those you give to it. Items carried by an unseen servant appear to float in the air a few paces behind you. An unseen servant that takes damage or leaves your presence is immediately dispelled, dropping any items it carried.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "unseen_servant_fn")
}

func prestidigitation_fn(targets):
	print("perform crude illusion to entertain")
	for target in targets:
		target["saw_magic_trick"].call_func()
var prestidigitation = {
	"name" : "prestidigitation",
	"level" : 0,
	"description" : "You perform minor tricks of true magic. If you touch an item as part of the casting you can make cosmetic changes to it: clean it, soil it, cool it, warm it, flavor it, or change its color. If you cast the spell without touching an item you can instead create minor illusions no bigger than yourself. Prestidigitation illusions are crude and clearly illusions—they won’t fool anyone, but they might entertain them.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "prestidigitation_fn")
}


func contact_spirits_fn():
	print("contact spirits called")
	#TODO: this would require a lot more dialogue and would not be polished enough to be useful yet
var contact_spirits = {
	"name" : "contact spirits",
	"level" : 1,
	"description" : "Name the spirit you wish to contact. You pull that creature through the planes, just close enough to speak to you. It is bound to answer any one question you ask to the best of its ability.",
	"school" : "summoning",
	"ongoing" : false,
	"execute" : funcref(self, "contact_spirits_fn")
}

func detect_magic_fn():
	print("detect magic called")
	if CharacterSheet.current_location["is_magical"]:
		print("This location is magical")
	for item in CharacterSheet.player_inventory:
		if item["is_magical"]:
			print("you sense that the item['name'] is magical!")
	for item in  CharacterSheet.current_location["items"]:
		if item["is_magical"]:
			print("you found an item in the room that is magical! item['name'] ")
var detect_magic = {
	"name" : "detect magic",
	"level" : 1,
	"description" : "One of your senses is briefly attuned to magic. The GM will tell you what here is magical.",
	"school" : "divination",
	"ongoing" : false,
	"execute" : funcref(self, "detect_magic_fn")
}

func magic_missile_fn(targets):
	print("magic missile called")
	for target in targets:
		var damage = Utilities.deal_damage(2, 4, target["armor"], 0, [])
		Moves.process_damage_to_npc(damage, target, {})
var  magic_missile = {
	"name" : "magic missile",
	"level" : 1,
	"description" : "Projectiles of pure magic spring from your fingers. Deal 2d4 damage to one target.",
	"school" : "evocation",
	"ongoing" : false,
	"execute" : funcref(self, "magic_missile_fn"),
	"method" : "magic_missile_fn",
	"script" : "WizardSpells"
}

func charm_person_fn(target):
	print("charm called")
	#TODO: target must be touched
	target["is_charmed"] = true
var  charm_person = {
	"name" : "charm person",
	"level" : 1,
	"description" : "The person (not beast or monster) you touch while casting this spell counts you as a friend until they take damage or you prove otherwise.",
	"school" : "enchantment",
	"ongoing" : true,
	"execute" : funcref(self, " charm_person_fn")
}

func invisibility_fn(target):
	print("invisibility called")
	#TODO: target must be touched
	target["is_invisible"] = true
var  invisibility = {
	"name" : "invisibility",
	"level" : 1,
	"description" : "Touch an ally: nobody can see them. They are invisible! The spell persists until the target attacks or you dismiss the effect. While the spell is ongoing you can not cast a spell.",
	"school" : "illusion",
	"ongoing" : true,
	"execute" : funcref(self, " invisibility_fn")
}

func telepathy_fn(target):
	print("telepathy called")
	CharacterSheet.telepathic_bonds.append(target.duplicate(true))
	target["telepathic_bond_with_player"] = true
var  telepathy = {
	"name" : "telepathy",
	"level" : 1,
	"description" : "You form a telepathic bond with a single person you touch, enabling you to converse with that person through your thoughts. You can only have one telepathic bond at a time.",
	"school" : "divination",
	"ongoing" : true,
	"execute" : funcref(self, " telepathy_fn")
}

func alarm_fn(location):
	print("alarm called")
	location["has_alarm_set"] = true
	CharacterSheet.has_set_alarm = true
var  alarm = {
	"name" : "alarm",
	"level" : 1,
	"description" : "Walk a wide circle as you cast this spell. Until you prepare spells again your magic will alert you if a creature crosses that circle. Even if you are asleep, the spell will shake you from your slumber.",
	"school" : "",
	"ongoing" : false,
	"execute" : funcref(self, " alarm_fn")
}


