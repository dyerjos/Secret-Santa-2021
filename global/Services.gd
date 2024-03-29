extends Node



func template_fn():
	assert(1==1)
	#("calling service method")
	assert(1==1)
var template = {
	"name" : "template",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 999,
	"description" : "When you you have leverage on a GM character and manipulate them",
	"execute" : funcref(self, "template_fn")
}
	
#* ------- General Services -------------
func week_at_peasant_inn_fn():
	assert(1==1)
	#("calling service method")
var week_at_peasant_inn = {
	"name" : "week at peasant inn",
	"type" : "general_service",
	"charisma_discount": true,
	"coin": 14,
	"description" : "A week's stay at a peasant inn",
	"execute" : funcref(self, "week_at_peasant_inn_fn")
}
func week_at_civilized_inn_fn():
	assert(1==1)
	#("calling service method")
var week_at_civilized_inn = {
	"name" : "week at civilized inn",
	"type" : "general_service",
	"charisma_discount": true,
	"coin": 30,
	"description" : "A week's stay at a civilized inn",
	"execute" : funcref(self, "week_at_civilized_inn_fn")
}
func week_at_fanciest_inn_fn():
	assert(1==1)
	#("calling service method")
var week_at_fanciest_inn = {
	"name" : "week at fanciest inn",
	"type" : "general_service",
	"charisma_discount": true,
	"coin": 43,
	"description" : "A week's stay at the fanciest inn in town",
	"execute" : funcref(self, "week_at_fanciest_inn_fn")
}
func week_of_unskilled_mundane_labor_fn():
	assert(1==1)
	#("calling service method")
var week_of_unskilled_mundane_labor = {
	"name" : "week of unskilled mundane labor",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 10,
	"description" : "A week's unskilled mundane labor",
	"execute" : funcref(self, "week_of_unskilled_mundane_labor_fn")
}
func month_enlistment_in_army_fn():
	assert(1==1)
	#("calling service method")
var month_enlistment_in_army = {
	"name" : "month enlistment in army",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 30,
	"description" : "A month's pay for enlistment in an army",
	"execute" : funcref(self, "month_enlistment_in_army_fn")
}
func custom_item_at_blacksmith_fn():
	assert(1==1)
	#("calling service method")
var custom_item_at_blacksmith = {
	"name" : "custom item at blacksmith",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": "Base Item value + 50 coins",
	"description" : "A custom item from a blacksmith",
	"execute" : funcref(self, "custom_item_at_blacksmith_fn")
}
func night_of_companionship_fn():
	assert(1==1)
	#("calling service method")
var night_of_companionship = {
	"name" : "night of companionship",
	"type" : "general_service",
	"charisma_discount": true,
	"coin": 20,
	"description" : "A night's 'companionship",
	"execute" : funcref(self, "night_of_companionship_fn")
}
func evening_of_song_and_dance_fn():
	assert(1==1)
	#("calling service method")
var evening_of_song_and_dance = {
	"name" : "evening of song and dance",
	"type" : "general_service",
	"charisma_discount": true,
	"coin": 18,
	"description" : "An evening of song and dance",
	"execute" : funcref(self, "evening_of_song_and_dance_fn")
}
func escort_for_day_along_dangerous_road_fn():
	assert(1==1)
	#("calling service method")
var escort_for_day_along_dangerous_road = {
	"name" : "escort for day along dangerous road",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 20,
	"description" : "Escort for a day along a bandit-infested road",
	"execute" : funcref(self, "escort_for_day_along_dangerous_road_fn")
}
func escort_for_day_along_very_dangerous_road_fn():
	assert(1==1)
	#("calling service method")
var escort_for_day_along_very_dangerous_road = {
	"name" : "escort for day along very dangerous road",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 54,
	"description" : "Escort for a day along a monster-infested road",
	"execute" : funcref(self, "escort_for_day_along_very_dangerous_road_fn")
}
func run_of_the_mill_killing_fn():
	assert(1==1)
	#("calling service method")
var run_of_the_mill_killing = {
	"name" : "run-of-the-mill killing",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 5,
	"description" : "A run-of-the-mill killing",
	"execute" : funcref(self, "run_of_the_mill_killing_fn")
}
func assassination_fn():
	assert(1==1)
	#("calling service method")
var assassination = {
	"name" : "assassination",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 120,
	"description" : "An assassination",
	"execute" : funcref(self, "assassination_fn")
}
func healing_from_a_doctor_fn():
	assert(1==1)
	#("calling service method")
var healing_from_a_doctor = {
	"name" : "healing from a doctor",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 5,
	"description" : "Healing from a doctor",
	"execute" : funcref(self, "healing_from_a_doctor_fn")
}
func months_prayer_for_the_departed_fn():
	assert(1==1)
	#("calling service method")
var months_prayer_for_the_departed = {
	"name" : "months prayer for the departed",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 1,
	"description" : "A month's prayers for the departed",
	"execute" : funcref(self, "months_prayer_for_the_departed_fn")
}


#* ------- Meals -------------
func hearty_meal_for_one_fn():
	assert(1==1)
	#("calling service method")
var hearty_meal_for_one = {
	"name" : "hearty meal for one",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 1,
	"description" : "A hearty meal for one",
	"execute" : funcref(self, "hearty_meal_for_one_fn")
}
func poor_meal_for_a_family_fn():
	assert(1==1)
	#("calling service method")
var poor_meal_for_a_family = {
	"name" : "poor meal for a family",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 1,
	"description" : "A poor meal for a family",
	"execute" : funcref(self, "poor_meal_for_a_family_fn")
}
func feast_for_one_fn():
	assert(1==1)
	#("calling service method")
var feast_for_one = {
	"name" : "feast for one",
	"type" : "general_service",
	"charisma_discount": false,
	"coin": 15,
	"description" : "A feast for one",
	"execute" : funcref(self, "feast_for_one_fn")
}



#* ------- Transport -------------
func passage_on_a_safe_route_fn():
	assert(1==1)
	#("calling service method")
var passage_on_a_safe_route = {
	"name" : "passage on a safe route",
	"type" : "transport",
	"charisma_discount": false,
	"coin": 1,
	"description" : "Passage on a safe route",
	"execute" : funcref(self, "passage_on_a_safe_route_fn")
}
func passage_on_a_tough_route_fn():
	assert(1==1)
	#("calling service method")
var passage_on_a_tough_route = {
	"name" : "passage on a tough route",
	"type" : "transport",
	"charisma_discount": false,
	"coin": 10,
	"description" : "Passage on a tough route",
	"execute" : funcref(self, "passage_on_a_tough_route_fn")
}
func passage_on_a_dangerous_route_fn():
	assert(1==1)
	#("calling service method")
var passage_on_a_dangerous_route = {
	"name" : "passage on a dangerous route",
	"type" : "transport",
	"charisma_discount": false,
	"coin": 100,
	"description" : "Passage on a dangerous route",
	"execute" : funcref(self, "passage_on_a_dangerous_route_fn")
}



#* ------- Upkeep -------------
func repair_a_mundane_item_fn():
	assert(1==1)
	#("calling service method")
var repair_a_mundane_item = {
	"name" : "repair a mundane item",
	"type" : "upkeep",
	"charisma_discount": false,
	"coin": "25% of the item's coin",
	"description" : "Repairs to a mundane item",
	"execute" : funcref(self, "repair_a_mundane_item_fn")
}
func a_months_upkeep_fn():
	assert(1==1)
	#("calling service method")
var a_months_upkeep = {
	"name" : "a months upkeep",
	"type" : "upkeep",
	"charisma_discount": false,
	"coin": "1% of coin",
	"description" : "A month's upkeep",
	"execute" : funcref(self, "a_months_upkeep_fn")
}



#* ------- Bribes -------------
func a_peasant_dowry_fn():
	assert(1==1)
	#("calling service method")
var a_peasant_dowry = {
	"name" : "a peasant dowry",
	"type" : "bribes",
	"charisma_discount": true,
	"coin": 20,
	"description" : "A peasant dowry",
	"execute" : funcref(self, "a_peasant_dowry_fn")
}
func protection_for_a_small_business_fn():
	assert(1==1)
	#("calling service method")
var protection_for_a_small_business = {
	"name" : "protection for a small business",
	"type" : "bribes",
	"charisma_discount": true,
	"coin": 100,
	"description" : "'Proection' for a small business",
	"execute" : funcref(self, "protection_for_a_small_business_fn")
}
func a_compelling_bribe_fn():
	assert(1==1)
	#("calling service method")
var a_compelling_bribe = {
	"name" : "a compelling bribe",
	"type" : "bribes",
	"charisma_discount": true,
	"coin": 80,
	"description" : "A compelling bribe",
	"execute" : funcref(self, "a_compelling_bribe_fn")
}
func a_government_bribe_fn():
	assert(1==1)
	#("calling service method")
var a_government_bribe = {
	"name" : "a government bribe",
	"type" : "bribes",
	"charisma_discount": true,
	"coin": 50,
	"description" : "A government bribe",
	"execute" : funcref(self, "a_government_bribe_fn")
}
func an_offer_you_cant_refuse_fn():
	assert(1==1)
	#("calling service method")
var an_offer_you_cant_refuse = {
	"name" : "an offer you cant refuse",
	"type" : "bribes",
	"charisma_discount": true,
	"coin": 500,
	"description" : "An offer you can't refuse",
	"execute" : funcref(self, "an_offer_you_cant_refuse_fn")
}

#* ----- Disable or Enable ------------:
var general_services = [
	week_at_peasant_inn,
	week_at_civilized_inn,
	week_at_fanciest_inn,
	week_of_unskilled_mundane_labor,
	month_enlistment_in_army,
	custom_item_at_blacksmith,
	night_of_companionship,
	evening_of_song_and_dance,
	escort_for_day_along_dangerous_road,
	escort_for_day_along_very_dangerous_road,
	run_of_the_mill_killing,
	assassination,
	healing_from_a_doctor,
	months_prayer_for_the_departed,
]
var meals = [
	hearty_meal_for_one,
	poor_meal_for_a_family,
	feast_for_one,
]
var transport = [
	passage_on_a_safe_route,
	passage_on_a_tough_route,
	passage_on_a_dangerous_route,
]
var upkeep = [
	repair_a_mundane_item,
	a_months_upkeep,
]
var bribes = [
	a_peasant_dowry,
	protection_for_a_small_business,
	a_compelling_bribe,
	a_government_bribe,
	an_offer_you_cant_refuse,
]

var master_service_list = general_services + meals + transport + upkeep + bribes

#* ------------------end of Disable/Enable ---------------------:
