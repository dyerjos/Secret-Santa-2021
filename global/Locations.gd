extends Node


#* monster settings: swamp, undead, woods, hordes, experiments, underdark, planar

var template = {
	"name" : "template",
	"entered_from" : "starter_city",
	"description": "template",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}


var hovel = {
	"name" : "hovel",
	"entered_from" : "starter_city",
	"description": "your hovel",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var cottage = {
	"name" : "cottage",
	"entered_from" : "starter_city",
	"description": "your cottage",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var house = {
	"name" : "house",
	"entered_from" : "starter_city",
	"description": "your house",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var mansion = {
	"name" : "mansion",
	"entered_from" : "starter_city",
	"description": "your mansion",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var keep = {
	"name" : "keep",
	"entered_from" : "starter_city",
	"description": "your keep",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var castle = {
	"name" : "castle",
	"entered_from" : "starter_city",
	"description": "your castle",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}
var grand_castle = {
	"name" : "grand_castle",
	"entered_from" : "starter_city",
	"description": "your grand castle",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": false,
	"has_services" : false,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : starter_city, "distance_in_rations": 0},
	],
	"steading_type" : "building",
	"popluation_tag": null,
	"poplualation_trend" : null, # 3 is steady
	"prosperity_tag": null,
	"prosperity_trend" : null, # 3 is moderate
	"defenses": null,
	"defense_trend": null, # 4 is guard
	"misc_tags": ["safe"]
}

#* -------- The Hard-Coded World ---------------------------------
var world = {
	"name" : "world",
	"description": "",
	"parent": null,
	"children": [], #TODO: world regions here
	"is_known": true,
}

var starter_city = {
	"name" : "Nystera",
	"parent": ""
	"entered_from" : "root",
	"description": "Your hometown",
	"monsters" : [],
	"includes_food": false,
	"has_alarm_set": false,
	"items" : [],
	"is_magical": false,
	"useful_info": "",
	"interesting_info": "",
	"has_market": true,
	"has_services" : true,
	"places_of_interest" : [],
	"next_destinations": [
		{"location" : a1_s1_cave, "distance_in_rations": 2},
	],
	"steading_type" : "city",
	"popluation_tag": "steady",
	"poplualation_trend" : 3, # 3 is steady
	"prosperity_tag": "moderate",
	"prosperity_trend" : 3, # 3 is moderate
	"defenses": "guard",
	"defense_trend": 4, # 4 is guard
	"misc_tags": ["safe"]
}

var a1_s1_cave = { #* Act 1 Scene 1
	"name" : "a small cave",
	"entered_from" : starter_city,
	"description": "A cold dark cave",
	"monsters" : Enemies.cavern, # or Enemies.A1_S1_bossfight.duplicate(true) or null if a safe location
	"includes_food" : false, #* true if this is an inn or a home that provides food for free or with cost of stay
	"has_alarm_set" : false, #* a wizard can set an alarm spell up in a minor-location to warn of danger
	"items" : [],
	"is_magical" : false, #* detect_magic spell can reveal if the location is magical
	"useful_info": "",
	"interesting_info": "",
	# "hp" : 100 # TODO: should have system to translate location hp to dialogue and consequences. Does building collapse? only buildings have hp?
	# "child_locations" : [ #TODO: could add child-locations which are places that make up the parent location. 
	#     entrance, second_level, lowest_level
	# ]
}

var secret_portal_1 = {}
var secret_portal_2 = {}
var secret_portal_3 = {}

var secret_locations = [
	secret_portal_1, 
	secret_portal_2, 
	secret_portal_3
]


func change_location(new_location):
	Signals.log("now at %s" % new_location["name"])
	CharacterSheet.current_location = new_location.duplicate(true)

func generate_random_portal():
	var destination = {
		"location" : secret_locations.duplicate(true).shuffle().pop_back(),
		"distance_in_rations": 0
		}
	CharacterSheet.current_location["next_destinations"].append(destination)
	Signals.log("A portal appeared!")
