extends Node


#TODO: cleric spell func
func  cure_light_wounds():
	print("spell called!")
var  cure_light_wounds = {
	"name" : "cure light wounds",
	"level" : 1,
	"description" : "At your touch wounds scab and bones cease to ache. Heal an ally you touch of 1d8 damage.",
	"school" : "",
	"ongoing" : false,
	"execute" : funcref(self, " cure_light_wounds")
}
