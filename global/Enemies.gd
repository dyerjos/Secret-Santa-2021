extends Node

#TODO: order monsters by biome
var cavern = [
	ankheg,
]
var swamp = []
var undead = []
var woods = []
var hordes = []
var experiments = []
var underdark = []
var planar = []

#TODO: add "needs_reloaded" field
var ankheg = {
	"name" : "ankheg",
	"organization" : "group",
	"size" : "large",
	"attack_name" : "bite",
	"attack_base_damage" : 8,
	"attack_modifier" : 1,
	"attack_number" : 1,
	"attack_tag" : "",
	"monster_tags" : [],
	"range_tags" : ["close", "reach"],
	"hp" : 10,
	"stun_points": 0,
	"armor" : 3,
	"special_qualities" : "borrowing",
	"instinct" : "to undermine",
	"addtional_moves" : ["undermine the ground", "burst from the earth", "spray forth acid, eating away at metal and flesh"]
}
