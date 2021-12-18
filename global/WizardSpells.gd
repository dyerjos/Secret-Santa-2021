extends Node


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
