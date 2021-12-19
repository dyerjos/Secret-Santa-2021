extends Node

#TODO: wizard spell methods
func light():
	print("spell called!")
var light = {
	"name" : "light",
	"level" : 0,
	"description" : "An item you touch glows with arcane light, about as bright as a torch. It gives off no heat or sound and requires no fuel, but it is otherwise like a mundane torch. You have complete control of the color of the flame. The spell lasts as long as it is in your presence.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "light")
}

func unseen_servant():
	print("spell called!")
var unseen_servant = {
	"name" : "unseen servant",
	"level" : 0,
	"description" : "You conjure a simple invisible construct that can do nothing but carry items. It has Load 3 and carries anything you hand to it. It cannot pick up items on its own and can only carry those you give to it. Items carried by an unseen servant appear to float in the air a few paces behind you. An unseen servant that takes damage or leaves your presence is immediately dispelled, dropping any items it carried.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "unseen_servant")
}

func prestidigitation():
	print("spell called!")
var prestidigitation = {
	"name" : "prestidigitation",
	"level" : 0,
	"description" : "You perform minor tricks of true magic. If you touch an item as part of the casting you can make cosmetic changes to it: clean it, soil it, cool it, warm it, flavor it, or change its color. If you cast the spell without touching an item you can instead create minor illusions no bigger than yourself. Prestidigitation illusions are crude and clearly illusions—they won’t fool anyone, but they might entertain them.",
	"school" : "cantrip",
	"ongoing" : false,
	"execute" : funcref(self, "prestidigitation")
}


func contact_spirits():
	print("contact spirits called!")
var contact_spirits = {
	"name" : "contact spirits",
	"level" : 1,
	"description" : "Name the spirit you wish to contact. You pull that creature through the planes, just close enough to speak to you. It is bound to answer any one question you ask to the best of its ability.",
	"school" : "summoning",
	"ongoing" : false,
	"execute" : funcref(self, "contact_spirits")
}

func detect_magic():
	print("spell called!")
var detect_magic = {
	"name" : "detect magic",
	"level" : 1,
	"description" : "One of your senses is briefly attuned to magic. The GM will tell you what here is magical.",
	"school" : "divination",
	"ongoing" : false,
	"execute" : funcref(self, "detect_magic")
}

func  magic_missile():
	print("spell called!")
var  magic_missile = {
	"name" : "magic missile",
	"level" : 1,
	"description" : "Projectiles of pure magic spring from your fingers. Deal 2d4 damage to one target.",
	"school" : "evocation",
	"ongoing" : false,
	"execute" : funcref(self, " magic_missile")
}

func  charm_person():
	print("spell called!")
var  charm_person = {
	"name" : "charm person",
	"level" : 1,
	"description" : "The person (not beast or monster) you touch while casting this spell counts you as a friend until they take damage or you prove otherwise.",
	"school" : "enchantment",
	"ongoing" : true,
	"execute" : funcref(self, " charm_person")
}

func  invisibility():
	print("spell called!")
var  invisibility = {
	"name" : "invisibility",
	"level" : 1,
	"description" : "Touch an ally: nobody can see them. They’re invisible! The spell persists until the target attacks or you dismiss the effect. While the spell is ongoing you can not cast a spell.",
	"school" : "illusion",
	"ongoing" : true,
	"execute" : funcref(self, " invisibility")
}

func  telepathy():
	print("spell called!")
var  telepathy = {
	"name" : "telepathy",
	"level" : 1,
	"description" : "You form a telepathic bond with a single person you touch, enabling you to converse with that person through your thoughts. You can only have one telepathic bond at a time.",
	"school" : "divination",
	"ongoing" : true,
	"execute" : funcref(self, " telepathy")
}

func  alarm():
	print("spell called!")
var  alarm = {
	"name" : "alarm",
	"level" : 1,
	"description" : "Walk a wide circle as you cast this spell. Until you prepare spells again your magic will alert you if a creature crosses that circle. Even if you are asleep, the spell will shake you from your slumber.",
	"school" : "",
	"ongoing" : false,
	"execute" : funcref(self, " alarm")
}

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
