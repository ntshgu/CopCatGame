extends Node

var player = load("res://player.tscn")
var road = load("res://road.tscn")

func _ready():
	add_child(road.instance())
	add_child(player.instance())
