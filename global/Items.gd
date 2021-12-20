extends Node


#TODO: add attack_tags, range_tags, etc
var spellbook = {
	"name" : "spellbook",
	"tags" : [],
	"coin" : null,
	"weight": 1,
}

var dungeon_rations = {
	"name" : "dungeon rations",
	"tags" : ["ration"],
	"coin" : 3,
	"weight": 1,
	"uses" : 5,
}

var leather_armor = {
	"name" : "leather armor",
	"tags" : ["worn"],
	"coin" : 10,
	"weight": 1,
	"armor" : 1,
}

var bag_of_books = {
	"name" : "bag of books",
	"tags" : [],
	"coin" : 10,
	"weight": 2,
	"uses" : 5,
}

var healing_potion = {
	"name" : "healing potion",
	"tags" : [],
	"coin" : 50,
	"weight": 0,
}

var dagger = {
	"name" : "dagger",
	"weapon_tags": [], #TODO: do more like this
	"tags" : ["hand"],
	"coin" : 2,
	"weight": 1,
}

var staff = {
	"name" : "staff",
	"tags" : ["close", "two_handed"],
	"coin" : 1,
	"weight": 1,
}

var antitoxin = {
	"name" : "antitoxin",
	"tags" : [],
	"coin" : 10,
	"weight": 0,
}

#TODO: make unseen servant an npc instead of an item in the future
var unseen_servant = {
	"name" : "unseen servant",
	"tags" : [],
	"coin" : null,
	"weight": -3,
}
