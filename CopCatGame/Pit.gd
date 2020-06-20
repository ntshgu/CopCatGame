#extends StaticBody2D
extends Area2D

func _ready():
	add_to_group("Obstacle")


func _on_Pit_body_entered(body):
	GameState.PlayerCharacter.gf_hit(0, 50)
