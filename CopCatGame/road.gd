extends Node2D


func _process(delta):
	$borders.position.y = GameState.PlayerCharacter.position.y
