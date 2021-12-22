extends Node


#* monster settings: swamp, undead, woods, hordes, experiments, underdark, planar

var A1_S1_cave = { #* Act 1 Scene 1
    "name" : "a small cave"
    "monsters" : Enemies.cavern.duplicate(true) # or Enemies.A1_S1_bossfight.duplicate(true) or null if a safe location
    "includes_food" : false, #* true if this is an inn or a home that provides food for free or with cost of stay
    "has_alarm_set" : false, #* a wizard can set an alarm spell up in a minor-location to warn of danger
    "items" : [],
    "is_magical" : false, #* detect_magic spell can reveal if the location is magical
    # "hp" : 100 # TODO: should have system to translate location hp to dialogue and consequences. Does building collapse? only buildings have hp?
    # "child_locations" : [ #TODO: could add child-locations which are places that make up the parent location. 
    #     entrance, second_level, lowest_level
    # ]
}
