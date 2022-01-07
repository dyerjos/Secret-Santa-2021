extends Node

var general_services = []
var meals = []
var transport = []
var upkeep = []
var bribes = []

func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
	
#* ------- General Services -------------
func week_at_peasant_inn_fn():
	print("calling service method")
var week_at_peasant_inn = {
	"name" : "week at peasant inn",
	"type" : "general_service",
	"charisma_discount": true,
	"cost": 14,
	"description" : "A week's stay at a peasant inn",
	"execute" : funcref(self, "week_at_peasant_inn_fn")
}
func week_at_civilized_inn_fn():
	print("calling service method")
var week_at_civilized_inn = {
	"name" : "week at civilized inn",
	"type" : "general_service",
	"charisma_discount": true,
	"cost": 30,
	"description" : "A week's stay at a civilized inn",
	"execute" : funcref(self, "week_at_civilized_inn_fn")
}
func week_at_fanciest_inn_fn():
	print("calling service method")
var week_at_fanciest_inn = {
	"name" : "week at fanciest inn",
	"type" : "general_service",
	"charisma_discount": true,
	"cost": 43,
	"description" : "A week's stay at the fanciest inn in town",
	"execute" : funcref(self, "week_at_fanciest_inn_fn")
}
func week_of_unskilled_mundane_labor_fn():
	print("calling service method")
var week_of_unskilled_mundane_labor = {
	"name" : "week of unskilled mundane labor",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 10,
	"description" : "A week's unskilled mundane labor",
	"execute" : funcref(self, "week_of_unskilled_mundane_labor_fn")
}
func month_enlistment_in_army_fn():
	print("calling service method")
var month_enlistment_in_army = {
	"name" : "month enlistment in army",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 30,
	"description" : "A month's pay for enlistment in an army",
	"execute" : funcref(self, "month_enlistment_in_army_fn")
}
func custom_item_at_blacksmith_fn():
	print("calling service method")
var custom_item_at_blacksmith = {
	"name" : "custom item at blacksmith",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 50,
	"description" : "A custom item from a blacksmith",
	"execute" : funcref(self, "custom_item_at_blacksmith_fn")
}
func night_of_companionship_fn():
	print("calling service method")
var night_of_companionship = {
	"name" : "night of companionship",
	"type" : "general_service",
	"charisma_discount": true,
	"cost": 20,
	"description" : "A night's 'companionship",
	"execute" : funcref(self, "night_of_companionship_fn")
}
func evening_of_song_and_dance_fn():
	print("calling service method")
var evening_of_song_and_dance = {
	"name" : "evening of song and dance",
	"type" : "general_service",
	"charisma_discount": true,
	"cost": 18,
	"description" : "An evening of song and dance",
	"execute" : funcref(self, "evening_of_song_and_dance_fn")
}
func escort_for_day_along_dangerous_road_fn():
	print("calling service method")
var escort_for_day_along_dangerous_road = {
	"name" : "escort for day along dangerous road",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 20,
	"description" : "Escort for a day along a bandit-infested road",
	"execute" : funcref(self, "escort_for_day_along_dangerous_road_fn")
}
func escort_for_day_along_very_dangerous_road_fn():
	print("calling service method")
var escort_for_day_along_very_dangerous_road = {
	"name" : "escort for day along very dangerous road",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 54,
	"description" : "Escort for a day along a monster-infested road",
	"execute" : funcref(self, "escort_for_day_along_very_dangerous_road_fn")
}
func run_of_the_mill_killing_fn():
	print("calling service method")
var run_of_the_mill_killing = {
	"name" : "run-of-the-mill killing",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 5,
	"description" : "A run-of-the-mill killing",
	"execute" : funcref(self, "run_of_the_mill_killing_fn")
}
func assassination_fn():
	print("calling service method")
var assassination = {
	"name" : "assassination",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 120,
	"description" : "An assassination",
	"execute" : funcref(self, "assassination_fn")
}
func healing_from_a_doctor_fn():
	print("calling service method")
var healing_from_a_doctor = {
	"name" : "healing from a doctor",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 5,
	"description" : "Healing from a doctor",
	"execute" : funcref(self, "healing_from_a_doctor_fn")
}
func months_prayer_for_the_departed_fn():
	print("calling service method")
var months_prayer_for_the_departed = {
	"name" : "months prayer for the departed",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 1,
	"description" : "A month's prayers for the departed",
	"execute" : funcref(self, "months_prayer_for_the_departed_fn")
}


#* ------- Meals -------------
func hearty_meal_for_one_fn():
	print("calling service method")
var hearty_meal_for_one = {
	"name" : "hearty meal for one",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 1,
	"description" : "A hearty meal for one",
	"execute" : funcref(self, "hearty_meal_for_one_fn")
}
func poor_meal_for_a_family_fn():
	print("calling service method")
var poor_meal_for_a_family = {
	"name" : "poor meal for a family",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 1,
	"description" : "A poor meal for a family",
	"execute" : funcref(self, "poor_meal_for_a_family_fn")
}
func feast_for_one_fn():
	print("calling service method")
var feast_for_one = {
	"name" : "feast for one",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 15,
	"description" : "A feast for one",
	"execute" : funcref(self, "feast_for_one_fn")
}



#* ------- Transport -------------
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}



#* ------- Upkeep -------------
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}



#* ------- Bribes -------------
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
func template_fn():
	print("calling service method")
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"cost": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}

