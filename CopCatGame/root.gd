extends Node

var player = load("res://player.tscn")
onready var road = load("res://road.tscn")
var ui = load("res://UI.tscn")
var bonusSpawner = load("res://BonusSpawner.tscn")

func _ready():
	add_child(ui.instance())
	add_child(road.instance())
	add_child(player.instance())
	add_child(bonusSpawner.instance())
