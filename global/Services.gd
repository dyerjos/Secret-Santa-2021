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
	"cost": "Base Item value + 50 coins",
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
func cart_and_donkey_fn():
	print("calling service method")
var cart_and_donkey = {
	"name" : "cart and donkey",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 50,
	"description" : "Cart and Donkey",
	"execute" : funcref(self, "cart_and_donkey_fn")
}
func horse_fn():
	print("calling service method")
var horse = {
	"name" : "horse transport",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 75,
	"description" : "Horse",
	"execute" : funcref(self, "horse_fn")
}
func warhorse_fn():
	print("calling service method")
var warhorse = {
	"name" : "warhorse transport",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 400,
	"description" : "Warhorse",
	"execute" : funcref(self, "warhorse_fn")
}
func wagon_fn():
	print("calling service method")
var wagon = {
	"name" : "wagon",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 150,
	"description" : "Wagon",
	"execute" : funcref(self, "wagon_fn")
}
func Barge_fn():
	print("calling service method")
var Barge = {
	"name" : "Barge",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 50,
	"description" : "Barge",
	"execute" : funcref(self, "Barge_fn")
}
func river_boat_fn():
	print("calling service method")
var river_boat = {
	"name" : "river boat",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 150,
	"description" : "River boat",
	"execute" : funcref(self, "river_boat_fn")
}
func merchant_ship_fn():
	print("calling service method")
var merchant_ship = {
	"name" : "merchant ship",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 5_000,
	"description" : "Merchant ship",
	"execute" : funcref(self, "merchant_ship_fn")
}
func war_ship_fn():
	print("calling service method")
var war_ship = {
	"name" : "war ship",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 20_000,
	"description" : "War ship",
	"execute" : funcref(self, "war_ship_fn")
}
func passage_on_a_safe_route_fn():
	print("calling service method")
var passage_on_a_safe_route = {
	"name" : "passage on a safe route",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 1,
	"description" : "Passage on a safe route",
	"execute" : funcref(self, "passage_on_a_safe_route_fn")
}
func passage_on_a_tough_route_fn():
	print("calling service method")
var passage_on_a_tough_route = {
	"name" : "passage on a tough route",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 10,
	"description" : "Passage on a tough route",
	"execute" : funcref(self, "passage_on_a_tough_route_fn")
}
func passage_on_a_dangerous_route_fn():
	print("calling service method")
var passage_on_a_dangerous_route = {
	"name" : "passage on a dangerous route",
	"type" : "transport",
	"charisma_discount": false,
	"cost": 100,
	"description" : "Passage on a dangerous route",
	"execute" : funcref(self, "passage_on_a_dangerous_route_fn")
}



#* ------- Upkeep -------------
func repair_a_mundane_item_fn():
	print("calling service method")
var repair_a_mundane_item = {
	"name" : "repair a mundane item",
	"type" : "upkeep",
	"charisma_discount": false,
	"cost": "25% of the item's cost",
	"description" : "Repairs to a mundane item",
	"execute" : funcref(self, "repair_a_mundane_item_fn")
}
func a_months_upkeep_fn():
	print("calling service method")
var a_months_upkeep = {
	"name" : "a_months_upkeep",
	"type" : "upkeep",
	"charisma_discount": false,
	"cost": "1% of cost",
	"description" : "A month's upkeep",
	"execute" : funcref(self, "a_months_upkeep_fn")
}



#* ------- Bribes -------------
func a_peasant_dowry_fn():
	print("calling service method")
var a_peasant_dowry = {
	"name" : "a peasant dowry",
	"type" : "bribes",
	"charisma_discount": true,
	"cost": 20,
	"description" : "A peasant dowry",
	"execute" : funcref(self, "a_peasant_dowry_fn")
}
func protection_for_a_small_business_fn():
	print("calling service method")
var protection_for_a_small_business = {
	"name" : "protection for a small business",
	"type" : "bribes",
	"charisma_discount": true,
	"cost": 100,
	"description" : "'Proection' for a small business",
	"execute" : funcref(self, "protection_for_a_small_business_fn")
}
func a_compelling_bribe_fn():
	print("calling service method")
var a_compelling_bribe = {
	"name" : "a_compelling_bribe",
	"type" : "bribes",
	"charisma_discount": true,
	"cost": 80,
	"description" : "A compelling bribe",
	"execute" : funcref(self, "a_compelling_bribe_fn")
}
func a_government_bribe_fn():
	print("calling service method")
var a_government_bribe = {
	"name" : "a government bribe",
	"type" : "bribes",
	"charisma_discount": true,
	"cost": 50,
	"description" : "A government bribe",
	"execute" : funcref(self, "a_government_bribe_fn")
}
func an_offer_you_cant_refuse_fn():
	print("calling service method")
var an_offer_you_cant_refuse = {
	"name" : "an offer you cant refuse",
	"type" : "bribes",
	"charisma_discount": true,
	"cost": 500,
	"description" : "An offer you can't refuse",
	"execute" : funcref(self, "an_offer_you_cant_refuse_fn")
}

